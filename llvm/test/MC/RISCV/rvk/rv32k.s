# RUN: llvm-mc -triple=riscv32 -show-encoding --mattr=+experimental-k %s \
# RUN:      | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST

# RUN: not llvm-mc -triple=riscv32 -show-encoding %s 2>&1 \
# RUN:      | FileCheck %s --check-prefix=CHECK-ERROR

# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-k %s \
# RUN:      | llvm-objdump -d --mattr=+experimental-k - \
# RUN:      | FileCheck %s --check-prefix=CHECK-INST

# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-k %s \
# RUN:      | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

sha256sum0 a0, a1
# CHECK-INST: sha256sum0 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x05,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions) 
# CHECK-UNKNOWN: 13 95 05 10 <unknown>