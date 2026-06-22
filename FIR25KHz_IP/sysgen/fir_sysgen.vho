  sysgen_dut : entity xil_defaultlib.fir_sysgen 
  port map (
    fir_data_in => fir_data_in,
    valid_in => valid_in,
    clk => clk,
    fir_data_out => fir_data_out,
    data_tready_out => data_tready_out,
    data_tvalid_out => data_tvalid_out
  );
