-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity fir_sysgen_stub is
  port (
    fir_data_in : in std_logic_vector( 8-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    fir_data_out : out std_logic_vector( 30-1 downto 0 );
    data_tready_out : out std_logic_vector( 1-1 downto 0 );
    data_tvalid_out : out std_logic_vector( 1-1 downto 0 )
  );
end fir_sysgen_stub;
architecture structural of fir_sysgen_stub is 
begin
  sysgen_dut : entity xil_defaultlib.fir_sysgen_0 
  port map (
    fir_data_in => fir_data_in,
    valid_in => valid_in,
    clk => clk,
    fir_data_out => fir_data_out,
    data_tready_out => data_tready_out,
    data_tvalid_out => data_tvalid_out
  );
end structural;
