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

//===--------------------------example of P Ext------------------------------------===//
//      please remove this block after implement first instruction
//
// let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in
// class ALU_P_rr<bits<7> funct7, bits<3> funct3, string opcodestr>
//     : RVInstR<funct7, funct3, OPC_OP_P, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
//               opcodestr, "$rd, $rs1, $rs2">;

// let Predicates = [HasStdExtP] in {
//   def RADD16 : ALU_P_rr<0b0000000, 0b000, "radd16">;
// }
//===--------------------------example of P Ext------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction class templates
//===----------------------------------------------------------------------===//

let hasSideEffects = 0, mayLoad = 0, mayStore = 0 in 
class RVKUnary<bits<3> funct3, string opcodestr>
    : RVInstI<funct3, OPC_OP_IMM, (outs GPR: $rd), (ins GPR: $rs1), opcodestr, "$rd, $rs1">;

let Predicates = [HasStdExtK] in {
    def SHA256SUM0 :    RVKUnary<0b001, "sha256sum0">, 
                        Sched<[]>;
}
