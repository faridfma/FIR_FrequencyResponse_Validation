// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jun 17 20:27:54 2026
// Host        : lvanoffice-208 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/fmabrouk/Documents/YT/FIR_25KHz_SysGen/FIR25KHz_IP/ip_catalog/fir_sysgen.srcs/sources_1/bd/fir_sysgen_bd/ip/fir_sysgen_bd_fir_sysgen_1_0/fir_sysgen_bd_fir_sysgen_1_0_stub.v
// Design      : fir_sysgen_bd_fir_sysgen_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fir_sysgen,Vivado 2018.3" *)
module fir_sysgen_bd_fir_sysgen_1_0(fir_data_in, valid_in, clk, fir_data_out, 
  data_tready_out, data_tvalid_out)
/* synthesis syn_black_box black_box_pad_pin="fir_data_in[7:0],valid_in[0:0],clk,fir_data_out[29:0],data_tready_out[0:0],data_tvalid_out[0:0]" */;
  input [7:0]fir_data_in;
  input [0:0]valid_in;
  input clk;
  output [29:0]fir_data_out;
  output [0:0]data_tready_out;
  output [0:0]data_tvalid_out;
endmodule
