-- Generated from Simulink block FIR_SysGen_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity fir_sysgen_struct is
  port (
    fir_data_in : in std_logic_vector( 8-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_400 : in std_logic;
    ce_400 : in std_logic;
    fir_data_out : out std_logic_vector( 30-1 downto 0 );
    data_tready_out : out std_logic_vector( 1-1 downto 0 );
    data_tvalid_out : out std_logic_vector( 1-1 downto 0 )
  );
end fir_sysgen_struct;
architecture structural of fir_sysgen_struct is 
  signal ce_net : std_logic;
  signal src_clk_net : std_logic;
  signal valid_in_net : std_logic_vector( 1-1 downto 0 );
  signal fir_25khz_bw_m_axis_data_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal fir_data_in_net : std_logic_vector( 8-1 downto 0 );
  signal fir_25khz_bw_m_axis_data_tdata_real_net : std_logic_vector( 30-1 downto 0 );
  signal clk_net : std_logic;
  signal src_ce_net : std_logic;
  signal fir_25khz_bw_s_axis_data_tready_net : std_logic_vector( 1-1 downto 0 );
begin
  fir_data_in_net <= fir_data_in;
  fir_data_out <= fir_25khz_bw_m_axis_data_tdata_real_net;
  data_tready_out <= fir_25khz_bw_s_axis_data_tready_net;
  data_tvalid_out <= fir_25khz_bw_m_axis_data_tvalid_net;
  valid_in_net <= valid_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  src_clk_net <= clk_400;
  src_ce_net <= ce_400;
  fir_25khz_bw : entity xil_defaultlib.xlfir_compiler_c41073c5cefd6cd2f1cd21defbc3a41d 
  port map (
    s_axis_data_tvalid => valid_in_net(0),
    s_axis_data_tdata_real => fir_data_in_net,
    src_clk => src_clk_net,
    src_ce => src_ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_25khz_bw_s_axis_data_tready_net(0),
    m_axis_data_tvalid => fir_25khz_bw_m_axis_data_tvalid_net(0),
    m_axis_data_tdata_real => fir_25khz_bw_m_axis_data_tdata_real_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity fir_sysgen_default_clock_driver is
  port (
    fir_sysgen_sysclk : in std_logic;
    fir_sysgen_sysce : in std_logic;
    fir_sysgen_sysclr : in std_logic;
    fir_sysgen_clk1 : out std_logic;
    fir_sysgen_ce1 : out std_logic;
    fir_sysgen_clk400 : out std_logic;
    fir_sysgen_ce400 : out std_logic
  );
end fir_sysgen_default_clock_driver;
architecture structural of fir_sysgen_default_clock_driver is 
begin
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => fir_sysgen_sysclk,
    sysce => fir_sysgen_sysce,
    sysclr => fir_sysgen_sysclr,
    clk => fir_sysgen_clk1,
    ce => fir_sysgen_ce1
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 400,
    log_2_period => 9
  )
  port map (
    sysclk => fir_sysgen_sysclk,
    sysce => fir_sysgen_sysce,
    sysclr => fir_sysgen_sysclr,
    clk => fir_sysgen_clk400,
    ce => fir_sysgen_ce400
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity fir_sysgen is
  port (
    fir_data_in : in std_logic_vector( 8-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    fir_data_out : out std_logic_vector( 30-1 downto 0 );
    data_tready_out : out std_logic_vector( 1-1 downto 0 );
    data_tvalid_out : out std_logic_vector( 1-1 downto 0 )
  );
end fir_sysgen;
architecture structural of fir_sysgen is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "fir_sysgen,sysgen_core_2018_3,{,compilation=IP Catalog,block_icon_display=Default,family=spartan7,part=xc7s50,speed=-2,package=csga324,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=5,system_simulink_period=5e-09,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=0.01,fir_compiler_v7_2=1,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
  signal ce_400_net : std_logic;
  signal clk_400_net : std_logic;
begin
  fir_sysgen_default_clock_driver : entity xil_defaultlib.fir_sysgen_default_clock_driver 
  port map (
    fir_sysgen_sysclk => clk,
    fir_sysgen_sysce => '1',
    fir_sysgen_sysclr => '0',
    fir_sysgen_clk1 => clk_1_net,
    fir_sysgen_ce1 => ce_1_net,
    fir_sysgen_clk400 => clk_400_net,
    fir_sysgen_ce400 => ce_400_net
  );
  fir_sysgen_struct : entity xil_defaultlib.fir_sysgen_struct 
  port map (
    fir_data_in => fir_data_in,
    valid_in => valid_in,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_400 => clk_400_net,
    ce_400 => ce_400_net,
    fir_data_out => fir_data_out,
    data_tready_out => data_tready_out,
    data_tvalid_out => data_tvalid_out
  );
end structural;
