--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed Jun 17 20:25:37 2026
--Host        : lvanoffice-208 running 64-bit major release  (build 9200)
--Command     : generate_target fir_sysgen_bd.bd
--Design      : fir_sysgen_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fir_sysgen_bd is
  port (
    clk : in STD_LOGIC;
    data_out_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    fir_data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    fir_data_out : out STD_LOGIC_VECTOR ( 29 downto 0 );
    valid_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of fir_sysgen_bd : entity is "fir_sysgen_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fir_sysgen_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of fir_sysgen_bd : entity is "fir_sysgen_bd.hwdef";
end fir_sysgen_bd;

architecture STRUCTURE of fir_sysgen_bd is
  component fir_sysgen_bd_fir_sysgen_1_0 is
  port (
    fir_data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    valid_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    fir_data_out : out STD_LOGIC_VECTOR ( 29 downto 0 );
    data_tready_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_tvalid_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component fir_sysgen_bd_fir_sysgen_1_0;
  signal clk_1 : STD_LOGIC;
  signal data_out_1_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal data_out_1_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal fir_data_in_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal fir_sysgen_1_fir_data_out : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal valid_in_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF data_out, CLK_DOMAIN fir_sysgen_bd_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of data_out_tready : signal is "xilinx.com:interface:axis:1.0 data_out TREADY";
  attribute X_INTERFACE_PARAMETER of data_out_tready : signal is "XIL_INTERFACENAME data_out, CLK_DOMAIN fir_sysgen_bd_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of data_out_tvalid : signal is "xilinx.com:interface:axis:1.0 data_out TVALID";
  attribute X_INTERFACE_INFO of fir_data_in : signal is "xilinx.com:signal:data:1.0 DATA.FIR_DATA_IN DATA";
  attribute X_INTERFACE_PARAMETER of fir_data_in : signal is "XIL_INTERFACENAME DATA.FIR_DATA_IN, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of fir_data_out : signal is "xilinx.com:signal:data:1.0 DATA.FIR_DATA_OUT DATA";
  attribute X_INTERFACE_PARAMETER of fir_data_out : signal is "XIL_INTERFACENAME DATA.FIR_DATA_OUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 30} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 27} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}";
  attribute X_INTERFACE_INFO of valid_in : signal is "xilinx.com:signal:data:1.0 DATA.VALID_IN DATA";
  attribute X_INTERFACE_PARAMETER of valid_in : signal is "XIL_INTERFACENAME DATA.VALID_IN, LAYERED_METADATA undef";
begin
  clk_1 <= clk;
  data_out_tready(0) <= data_out_1_TREADY(0);
  data_out_tvalid(0) <= data_out_1_TVALID(0);
  fir_data_in_1(7 downto 0) <= fir_data_in(7 downto 0);
  fir_data_out(29 downto 0) <= fir_sysgen_1_fir_data_out(29 downto 0);
  valid_in_1(0) <= valid_in(0);
fir_sysgen_1: component fir_sysgen_bd_fir_sysgen_1_0
     port map (
      clk => clk_1,
      data_tready_out(0) => data_out_1_TREADY(0),
      data_tvalid_out(0) => data_out_1_TVALID(0),
      fir_data_in(7 downto 0) => fir_data_in_1(7 downto 0),
      fir_data_out(29 downto 0) => fir_sysgen_1_fir_data_out(29 downto 0),
      valid_in(0) => valid_in_1(0)
    );
end STRUCTURE;
