//===-- RISCVInstrInfoK.td - RISC-V 'K' instructions -------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// This file describes the RISC-K instructions from the standard 'K' 
/// scalar cryptography extension, version 0.8.1. 
///
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction class templates
//===----------------------------------------------------------------------===//

let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
    // op rd, rs1
    class RVKUnary<bits<7> funct7, bits<5> funct5, bits<3> funct3, string opcodestr>
        : RVInstR<funct7, funct3, OPC_OP_IMM, (outs GPR:$rd), (ins GPR:$rs1), opcodestr, "$rd, $rs1">{
            let Inst{24-20} = funct5;
        }

    // op rd rs1 rs2
    class RVKBinary<bits<7> funct7, bits<3> funct3, string opcodestr>
        : RVInstR<funct7, funct3, OPC_OP, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                opcodestr, "$rd, $rs1, $rs2">;
} // hasSideEffects = 0, mayLoad = 0, mayStore = 0

let Predicates = [HasStdExtK] in {
    // RVKUnary
    def SHA256SUM0 :    RVKUnary<0b0001000, 0b00000, 0b001, "sha256sum0">, 
                        Sched<[]>;
    def SHA256SUM1 :    RVKUnary<0b0001000, 0b00001, 0b001, "sha256sum1">, 
                        Sched<[]>;
    def SHA256SIG0 :    RVKUnary<0b0001000, 0b00010, 0b001, "sha256sig0">, 
                        Sched<[]>;
    def SHA256SIG1 :    RVKUnary<0b0001000, 0b00011, 0b001, "sha256sig1">, 
                        Sched<[]>;

    // Pseudo Instructions
    def GETNOISE   :   InstAlias<"getnoise $rd", (CSRRS GPR:$rd, MNOISE.Encoding, X0)>, 
                        Sched<[]>;
    def POLLENTROPY:   InstAlias<"pollentropy $rd", (CSRRS GPR:$rd, MENTROPY.Encoding, X0)>, 
                        Sched<[]>;
} // Predicates = [HasStdExtK]

let Predicates = [HasStdExtK, IsRV32] in {
    def SHA512SUM0R : RVKBinary<0b0101000, 0b000, "sha512sum0r">, 
                        Sched<[]>;
    def SHA512SUM1R : RVKBinary<0b0101001, 0b000, "sha512sum1r">, 
                        Sched<[]>;
    def SHA512SIG0L : RVKBinary<0b0101010, 0b000, "sha512sig0l">, 
                        Sched<[]>;
    def SHA512SIG0H : RVKBinary<0b0101110, 0b000, "sha512sig0h">, 
                        Sched<[]>;
    def SHA512SIG1L : RVKBinary<0b0101011, 0b000, "sha512sig1l">, 
                        Sched<[]>;
    def SHA512SIG1H : RVKBinary<0b0101111, 0b000, "sha512sig1h">, 
                        Sched<[]>;
} // Predicates = [HasStdExtK, IsRV32]

let Predicates = [HasStdExtK, IsRV64] in {
    def AES64KS2    : RVKBinary<0b0111111, 0b000, "aes64ks2">, 
                        Sched<[]>;
    def AES64ESM    : RVKBinary<0b0011011, 0b000, "aes64esm">, 
                        Sched<[]>;
    def AES64ES     : RVKBinary<0b0011001, 0b000, "aes64es">, 
                        Sched<[]>;
    def AES64DSM    : RVKBinary<0b0011111, 0b000, "aes64dsm">, 
                        Sched<[]>;
    def AES64DS     : RVKBinary<0b0011101, 0b000, "aes64ds">, 
                        Sched<[]>;
} // Predicates = [HasStdExtK, IsRV64]
