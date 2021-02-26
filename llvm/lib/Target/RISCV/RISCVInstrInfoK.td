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

let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in 
class RVKUnary<bits<7> funct7, bits<5> funct5, bits<3> funct3, string opcodestr>
    : RVInstR<funct7, funct3, OPC_OP_IMM, (outs GPR:$rd), (ins GPR:$rs1), opcodestr, "$rd, $rs1">{
        let Inst{24-20} = funct5;
    }

let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
class RVKBinary<bits<7> funct7, bits<3> funct3, string opcodestr>
    : RVInstR<funct7, funct3, OPC_OP, (outs GPR: $rd), (ins GPR: $rs1, $rs2), opcodestr, "$rd, $rs1, $rs2">;

let Predicates = [HasStdExtK] in {
    def SHA256SUM0 :    RVKUnary<0b0001000, 0b00000, 0b001, "sha256sum0">, 
                        Sched<[]>;
    def SHA256SUM1 :    RVKUnary<0b0001000, 0b00001, 0b001, "sha256sum1">, 
                        Sched<[]>;
    def SHA256SIG0 :    RVKUnary<0b0001000, 0b00010, 0b001, "sha256sig0">, 
                        Sched<[]>;
    def SHA256SIG1 :    RVKUnary<0b0001000, 0b00011, 0b001, "sha256sig1">, 
                        Sched<[]>;
}
