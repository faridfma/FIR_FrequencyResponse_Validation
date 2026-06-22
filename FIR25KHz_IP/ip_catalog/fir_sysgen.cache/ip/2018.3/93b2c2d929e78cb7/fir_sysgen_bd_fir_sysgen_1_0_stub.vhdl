-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Jun 17 20:27:49 2026
-- Host        : lvanoffice-208 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fir_sysgen_bd_fir_sysgen_1_0_stub.vhdl
-- Design      : fir_sysgen_bd_fir_sysgen_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s50csga324-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    fir_data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    valid_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    fir_data_out : out STD_LOGIC_VECTOR ( 29 downto 0 );
    data_tready_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_tvalid_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "fir_data_in[7:0],valid_in[0:0],clk,fir_data_out[29:0],data_tready_out[0:0],data_tvalid_out[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fir_sysgen,Vivado 2018.3";
begin
end;
