set rateCefir_sysgen400 fir_sysgen_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellsfir_sysgen400 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCefir_sysgen400/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellsfir_sysgen400 -to $rateCellsfir_sysgen400 -setup 400
set_multicycle_path -from $rateCellsfir_sysgen400 -to $rateCellsfir_sysgen400 -hold 399
