--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed Jun 17 20:25:37 2026
--Host        : lvanoffice-208 running 64-bit major release  (build 9200)
--Command     : generate_target fir_sysgen_bd_wrapper.bd
--Design      : fir_sysgen_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fir_sysgen_bd_wrapper is
  port (
    clk : in STD_LOGIC;
    data_out_tready : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    fir_data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    fir_data_out : out STD_LOGIC_VECTOR ( 29 downto 0 );
    valid_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end fir_sysgen_bd_wrapper;

architecture STRUCTURE of fir_sysgen_bd_wrapper is
  component fir_sysgen_bd is
  port (
    clk : in STD_LOGIC;
    fir_data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    fir_data_out : out STD_LOGIC_VECTOR ( 29 downto 0 );
    valid_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    data_out_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_out_tready : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component fir_sysgen_bd;
begin
fir_sysgen_bd_i: component fir_sysgen_bd
     port map (
      clk => clk,
      data_out_tready(0) => data_out_tready(0),
      data_out_tvalid(0) => data_out_tvalid(0),
      fir_data_in(7 downto 0) => fir_data_in(7 downto 0),
      fir_data_out(29 downto 0) => fir_data_out(29 downto 0),
      valid_in(0) => valid_in(0)
    );
end STRUCTURE;
