; RUN: llc -mtriple=riscv64 -mattr=+experimental-v < %s | FileCheck -check-prefix=CHECK %s

; Function Attrs: noinline nounwind optnone
define <vscale x 4 x half> @test_vfredsum_vs_f16mf4_f16m1(<vscale x 4 x half> %dst, <vscale x 1 x half> %vector, <vscale x 4 x half> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f16mf4_f16m1
; CHECK: vsetvli zero, zero, e16,mf4,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv1f16(<vscale x 4 x half> %dst, <vscale x 1 x half> %vector, <vscale x 4 x half> %scalar)
  ret <vscale x 4 x half> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 4 x half> @test_vfredsum_vs_f16mf2_f16m1(<vscale x 4 x half> %dst, <vscale x 2 x half> %vector, <vscale x 4 x half> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f16mf2_f16m1
; CHECK: vsetvli zero, zero, e16,mf2,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv2f16(<vscale x 4 x half> %dst, <vscale x 2 x half> %vector, <vscale x 4 x half> %scalar)
  ret <vscale x 4 x half> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 4 x half> @test_vfredsum_vs_f16m1_f16m1(<vscale x 4 x half> %dst, <vscale x 4 x half> %vector, <vscale x 4 x half> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f16m1_f16m1
; CHECK: vsetvli zero, zero, e16,m1,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv4f16(<vscale x 4 x half> %dst, <vscale x 4 x half> %vector, <vscale x 4 x half> %scalar)
  ret <vscale x 4 x half> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 4 x half> @test_vfredsum_vs_f16m2_f16m1(<vscale x 4 x half> %dst, <vscale x 8 x half> %vector, <vscale x 4 x half> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f16m2_f16m1
; CHECK: vsetvli zero, zero, e16,m2,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv8f16(<vscale x 4 x half> %dst, <vscale x 8 x half> %vector, <vscale x 4 x half> %scalar)
  ret <vscale x 4 x half> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 4 x half> @test_vfredsum_vs_f16m4_f16m1(<vscale x 4 x half> %dst, <vscale x 16 x half> %vector, <vscale x 4 x half> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f16m4_f16m1
; CHECK: vsetvli zero, zero, e16,m4,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv16f16(<vscale x 4 x half> %dst, <vscale x 16 x half> %vector, <vscale x 4 x half> %scalar)
  ret <vscale x 4 x half> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 4 x half> @test_vfredsum_vs_f16m8_f16m1(<vscale x 4 x half> %dst, <vscale x 32 x half> %vector, <vscale x 4 x half> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f16m8_f16m1
; CHECK: vsetvli zero, zero, e16,m8,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv32f16(<vscale x 4 x half> %dst, <vscale x 32 x half> %vector, <vscale x 4 x half> %scalar)
  ret <vscale x 4 x half> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 2 x float> @test_vfredsum_vs_f32mf2_f32m1(<vscale x 2 x float> %dst, <vscale x 1 x float> %vector, <vscale x 2 x float> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f32mf2_f32m1
; CHECK: vsetvli zero, zero, e32,mf2,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv1f32(<vscale x 2 x float> %dst, <vscale x 1 x float> %vector, <vscale x 2 x float> %scalar)
  ret <vscale x 2 x float> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 2 x float> @test_vfredsum_vs_f32m1_f32m1(<vscale x 2 x float> %dst, <vscale x 2 x float> %vector, <vscale x 2 x float> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f32m1_f32m1
; CHECK: vsetvli zero, zero, e32,m1,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv2f32(<vscale x 2 x float> %dst, <vscale x 2 x float> %vector, <vscale x 2 x float> %scalar)
  ret <vscale x 2 x float> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 2 x float> @test_vfredsum_vs_f32m2_f32m1(<vscale x 2 x float> %dst, <vscale x 4 x float> %vector, <vscale x 2 x float> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f32m2_f32m1
; CHECK: vsetvli zero, zero, e32,m2,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv4f32(<vscale x 2 x float> %dst, <vscale x 4 x float> %vector, <vscale x 2 x float> %scalar)
  ret <vscale x 2 x float> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 2 x float> @test_vfredsum_vs_f32m4_f32m1(<vscale x 2 x float> %dst, <vscale x 8 x float> %vector, <vscale x 2 x float> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f32m4_f32m1
; CHECK: vsetvli zero, zero, e32,m4,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv8f32(<vscale x 2 x float> %dst, <vscale x 8 x float> %vector, <vscale x 2 x float> %scalar)
  ret <vscale x 2 x float> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 2 x float> @test_vfredsum_vs_f32m8_f32m1(<vscale x 2 x float> %dst, <vscale x 16 x float> %vector, <vscale x 2 x float> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f32m8_f32m1
; CHECK: vsetvli zero, zero, e32,m8,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv16f32(<vscale x 2 x float> %dst, <vscale x 16 x float> %vector, <vscale x 2 x float> %scalar)
  ret <vscale x 2 x float> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 1 x double> @test_vfredsum_vs_f64m1_f64m1(<vscale x 1 x double> %dst, <vscale x 1 x double> %vector, <vscale x 1 x double> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f64m1_f64m1
; CHECK: vsetvli zero, zero, e64,m1,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 1 x double> @llvm.riscv.vfredsum.vs.nxv1f64.nxv1f64(<vscale x 1 x double> %dst, <vscale x 1 x double> %vector, <vscale x 1 x double> %scalar)
  ret <vscale x 1 x double> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 1 x double> @test_vfredsum_vs_f64m2_f64m1(<vscale x 1 x double> %dst, <vscale x 2 x double> %vector, <vscale x 1 x double> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f64m2_f64m1
; CHECK: vsetvli zero, zero, e64,m2,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 1 x double> @llvm.riscv.vfredsum.vs.nxv1f64.nxv2f64(<vscale x 1 x double> %dst, <vscale x 2 x double> %vector, <vscale x 1 x double> %scalar)
  ret <vscale x 1 x double> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 1 x double> @test_vfredsum_vs_f64m4_f64m1(<vscale x 1 x double> %dst, <vscale x 4 x double> %vector, <vscale x 1 x double> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f64m4_f64m1
; CHECK: vsetvli zero, zero, e64,m4,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 1 x double> @llvm.riscv.vfredsum.vs.nxv1f64.nxv4f64(<vscale x 1 x double> %dst, <vscale x 4 x double> %vector, <vscale x 1 x double> %scalar)
  ret <vscale x 1 x double> %call
}

; Function Attrs: noinline nounwind optnone
define <vscale x 1 x double> @test_vfredsum_vs_f64m8_f64m1(<vscale x 1 x double> %dst, <vscale x 8 x double> %vector, <vscale x 1 x double> %scalar) {
entry:
; CHECK-LABEL: vfredsum_vs_f64m8_f64m1
; CHECK: vsetvli zero, zero, e64,m8,tu,mu
; CHECK: vfredsum.vs {{v[0-9]+}}, {{v[0-9]+}}, {{v[0-9]+}}
; CHECK: ret
  %call = tail call <vscale x 1 x double> @llvm.riscv.vfredsum.vs.nxv1f64.nxv8f64(<vscale x 1 x double> %dst, <vscale x 8 x double> %vector, <vscale x 1 x double> %scalar)
  ret <vscale x 1 x double> %call
}

; Function Attrs: nounwind
declare <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv1f32(<vscale x 2 x float>, <vscale x 1 x float>, <vscale x 2 x float>)
; Function Attrs: nounwind
declare <vscale x 1 x double> @llvm.riscv.vfredsum.vs.nxv1f64.nxv1f64(<vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x double>)
; Function Attrs: nounwind
declare <vscale x 1 x double> @llvm.riscv.vfredsum.vs.nxv1f64.nxv2f64(<vscale x 1 x double>, <vscale x 2 x double>, <vscale x 1 x double>)
; Function Attrs: nounwind
declare <vscale x 1 x double> @llvm.riscv.vfredsum.vs.nxv1f64.nxv4f64(<vscale x 1 x double>, <vscale x 4 x double>, <vscale x 1 x double>)
; Function Attrs: nounwind
declare <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv4f16(<vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x half>)
; Function Attrs: nounwind
declare <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv16f16(<vscale x 4 x half>, <vscale x 16 x half>, <vscale x 4 x half>)
; Function Attrs: nounwind
declare <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv8f16(<vscale x 4 x half>, <vscale x 8 x half>, <vscale x 4 x half>)
; Function Attrs: nounwind
declare <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv8f32(<vscale x 2 x float>, <vscale x 8 x float>, <vscale x 2 x float>)
; Function Attrs: nounwind
declare <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv2f16(<vscale x 4 x half>, <vscale x 2 x half>, <vscale x 4 x half>)
; Function Attrs: nounwind
declare <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv32f16(<vscale x 4 x half>, <vscale x 32 x half>, <vscale x 4 x half>)
; Function Attrs: nounwind
declare <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv2f32(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>)
; Function Attrs: nounwind
declare <vscale x 1 x double> @llvm.riscv.vfredsum.vs.nxv1f64.nxv8f64(<vscale x 1 x double>, <vscale x 8 x double>, <vscale x 1 x double>)
; Function Attrs: nounwind
declare <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv4f32(<vscale x 2 x float>, <vscale x 4 x float>, <vscale x 2 x float>)
; Function Attrs: nounwind
declare <vscale x 4 x half> @llvm.riscv.vfredsum.vs.nxv4f16.nxv1f16(<vscale x 4 x half>, <vscale x 1 x half>, <vscale x 4 x half>)
; Function Attrs: nounwind
declare <vscale x 2 x float> @llvm.riscv.vfredsum.vs.nxv2f32.nxv16f32(<vscale x 2 x float>, <vscale x 16 x float>, <vscale x 2 x float>)
