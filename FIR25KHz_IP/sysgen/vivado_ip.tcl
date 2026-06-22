#-----------------------------------------------------------------
# System Generator version 2018.3 IP Tcl source file.
#
# Copyright(C) 2018 by Xilinx, Inc.  All rights reserved.  This
# text/file contains proprietary, confidential information of Xilinx,
# Inc., is distributed under license from Xilinx, Inc., and may be used,
# copied and/or disclosed only pursuant to the terms of a valid license
# agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
# this text/file solely for design, simulation, implementation and
# creation of design files limited to Xilinx devices or technologies.
# Use with non-Xilinx devices or technologies is expressly prohibited
# and immediately terminates your license unless covered by a separate
# agreement.
#
# Xilinx is providing this design, code, or information "as is" solely
# for use in developing programs and solutions for Xilinx devices.  By
# providing this design, code, or information as one possible
# implementation of this feature, application or standard, Xilinx is
# making no representation that this implementation is free from any
# claims of infringement.  You are responsible for obtaining any rights
# you may require for your implementation.  Xilinx expressly disclaims
# any warranty whatsoever with respect to the adequacy of the
# implementation, including but not limited to warranties of
# merchantability or fitness for a particular purpose.
#
# Xilinx products are not intended for use in life support appliances,
# devices, or systems.  Use in such applications is expressly prohibited.
#
# Any modifications that are made to the source code are done at the user's
# sole risk and will be unsupported.
#
# This copyright and support notice must be retained as part of this
# text at all times.  (c) Copyright 1995-2018 Xilinx, Inc.  All rights
# reserved.
#-----------------------------------------------------------------

set existingipslist [get_ips]
if {[lsearch $existingipslist fir_sysgen_fir_compiler_v7_2_i0] < 0} {
create_ip -name fir_compiler -version 7.2 -vendor xilinx.com -library ip -module_name fir_sysgen_fir_compiler_v7_2_i0
set params_list [list]
lappend params_list CONFIG.Component_Name {fir_sysgen_fir_compiler_v7_2_i0}
lappend params_list CONFIG.BestPrecision {true}
lappend params_list CONFIG.Blank_Output {false}
lappend params_list CONFIG.Channel_Sequence {Basic}
lappend params_list CONFIG.Clock_Frequency {300.0}
lappend params_list CONFIG.CoefficientSource {Vector}
lappend params_list CONFIG.CoefficientVector {binary:F8C28315667537BF46167C1335F03C3F6F816AEB58203B3F557F9DB34DEA3E3F343EECD0D0C0423FA8B64DEC16BF463FB3B528BD53074B3F5B3C092AB74C4F3F34CA52B522A6513FBEF5325B8462533F8A112A44C6BB543FA14958536692553F654EEED8AEC9553F3C5B7BC70A48553F37A6A8A24CF9533FBB101022D4CF513FC343914EE18D4D3F0060B91527C5453FF2FE2BFE9EC7383F90A06CB979CC093F1C9254C8028D34BFBA6B8B44FDE846BF3878500DC2EC51BF704BA570DA4A58BFB83C620F364C5EBF85F07FA7FFCE61BFB7F60AF8750164BF5FCF3676479465BF594B7D6EF96766BF0C1B427E566366BFEB7505B5D67065BF1C86E8424B8263BF22FA8601559460BF092A08D0E05C59BF5F06CEF0C38C4FBF169E48922D8332BFF0B52BB4AC083F3FE07A104372FB543F02B31FCE8348613FAE314F6900FD673F986B0B5078516E3F9269A1929BFC713F9DAEFDAE0354743F66ED769B830A763F14AC331EFAFE763F12B599CD4615773FCA8C655AE437763FE8FD60DD4259743F2C307023D574713F7B9ED35DEE216B3FE26BD96B557B613FCF43736CDCBB483FB0470DEDDAD749BF2050C4AF5A1164BF63626F4C931671BFA08AA7A7D62178BF496B50B5A6E17EBFA3747540588482BF16BD9B50E22385BFDE96C065562887BF2C70166D676C88BFB11D05CDEFCD88BF2CC08C803F2F88BF628E987A527886BF0E4003CC029883BF96467A610B0A7FBF7443513EED7C74BF47B5A2EC16635EBF0EE77A46FDFF5D3F5F87D0E11299783F6AB12D5485B6853F00BEC88A4CD38F3F9A08BBC4B438953F7E95AEC2E8AC9A3FB5DC34314814A03F264C0DCC6AC6A23F29172B46335DA53FFA1040D83CC9A73F121B50A9DFFBA93FFD92260993E7AB3FB09F74E75880AD3F4C9A7FE426BCAE3F18660C002B93AF3F6E8E96760400B03F6E8E96760400B03F18660C002B93AF3F4C9A7FE426BCAE3FB09F74E75880AD3FFD92260993E7AB3F121B50A9DFFBA93FFA1040D83CC9A73F29172B46335DA53F264C0DCC6AC6A23FB5DC34314814A03F7E95AEC2E8AC9A3F9A08BBC4B438953F00BEC88A4CD38F3F6AB12D5485B6853F5F87D0E11299783F0EE77A46FDFF5D3F47B5A2EC16635EBF7443513EED7C74BF96467A610B0A7FBF0E4003CC029883BF628E987A527886BF2CC08C803F2F88BFB11D05CDEFCD88BF2C70166D676C88BFDE96C065562887BF16BD9B50E22385BFA3747540588482BF496B50B5A6E17EBFA08AA7A7D62178BF63626F4C931671BF2050C4AF5A1164BFB0470DEDDAD749BFCF43736CDCBB483FE26BD96B557B613F7B9ED35DEE216B3F2C307023D574713FE8FD60DD4259743FCA8C655AE437763F12B599CD4615773F14AC331EFAFE763F66ED769B830A763F9DAEFDAE0354743F9269A1929BFC713F986B0B5078516E3FAE314F6900FD673F02B31FCE8348613FE07A104372FB543FF0B52BB4AC083F3F169E48922D8332BF5F06CEF0C38C4FBF092A08D0E05C59BF22FA8601559460BF1C86E8424B8263BFEB7505B5D67065BF0C1B427E566366BF594B7D6EF96766BF5FCF3676479465BFB7F60AF8750164BF85F07FA7FFCE61BFB83C620F364C5EBF704BA570DA4A58BF3878500DC2EC51BFBA6B8B44FDE846BF1C9254C8028D34BF90A06CB979CC093FF2FE2BFE9EC7383F0060B91527C5453FC343914EE18D4D3FBB101022D4CF513F37A6A8A24CF9533F3C5B7BC70A48553F654EEED8AEC9553FA14958536692553F8A112A44C6BB543FBEF5325B8462533F34CA52B522A6513F5B3C092AB74C4F3FB3B528BD53074B3FA8B64DEC16BF463F343EECD0D0C0423F557F9DB34DEA3E3F6F816AEB58203B3F46167C1335F03C3FF8C28315667537BF}
lappend params_list CONFIG.Coefficient_Buffer_Type {Automatic}
lappend params_list CONFIG.Coefficient_File {no_coe_file_loaded}
lappend params_list CONFIG.Coefficient_Fractional_Bits {20}
lappend params_list CONFIG.Coefficient_Reload {false}
lappend params_list CONFIG.Coefficient_Sets {1}
lappend params_list CONFIG.Coefficient_Sign {Signed}
lappend params_list CONFIG.Coefficient_Structure {Symmetric}
lappend params_list CONFIG.Coefficient_Width {18}
lappend params_list CONFIG.ColumnConfig {84}
lappend params_list CONFIG.DATA_Has_TLAST {Not_Required}
lappend params_list CONFIG.DATA_TUSER_Width {1}
lappend params_list CONFIG.Data_Buffer_Type {Automatic}
lappend params_list CONFIG.Data_Fractional_Bits {7}
lappend params_list CONFIG.Data_Sign {Signed}
lappend params_list CONFIG.Data_Width {8}
lappend params_list CONFIG.Decimation_Rate {1}
lappend params_list CONFIG.DisplayReloadOrder {false}
lappend params_list CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate}
lappend params_list CONFIG.Filter_Selection {1}
lappend params_list CONFIG.Filter_Type {Single_Rate}
lappend params_list CONFIG.GUI_Behaviour {Sysgen_uUPP}
lappend params_list CONFIG.Gen_MIF_Files {false}
lappend params_list CONFIG.Gen_MIF_from_COE {false}
lappend params_list CONFIG.Gen_MIF_from_Spec {false}
lappend params_list CONFIG.HardwareOversamplingRate {1}
lappend params_list CONFIG.Has_ACLKEN {true}
lappend params_list CONFIG.Has_ARESETn {false}
lappend params_list CONFIG.Input_Buffer_Type {Automatic}
lappend params_list CONFIG.Inter_Column_Pipe_Length {4}
lappend params_list CONFIG.Interpolation_Rate {1}
lappend params_list CONFIG.M_DATA_Has_TREADY {false}
lappend params_list CONFIG.M_DATA_Has_TUSER {Not_Required}
lappend params_list CONFIG.Multi_Column_Support {Automatic}
lappend params_list CONFIG.Num_Reload_Slots {1}
lappend params_list CONFIG.Number_Channels {1}
lappend params_list CONFIG.Number_Paths {1}
lappend params_list CONFIG.Optimization_Goal {Area}
lappend params_list CONFIG.Optimization_List {None}
lappend params_list CONFIG.Optimization_Selection {None}
lappend params_list CONFIG.Output_Buffer_Type {Automatic}
lappend params_list CONFIG.Output_Rounding_Mode {Full_Precision}
lappend params_list CONFIG.Output_Width {30}
lappend params_list CONFIG.Passband_Max {0.50000000}
lappend params_list CONFIG.Passband_Min {0.00000000}
lappend params_list CONFIG.Pattern_List {P4-0,P4-1,P4-2,P4-3,P4-4}
lappend params_list CONFIG.Preference_For_Other_Storage {Automatic}
lappend params_list CONFIG.Quantization {Maximize_Dynamic_Range}
lappend params_list CONFIG.RateSpecification {Input_Sample_Period}
lappend params_list CONFIG.Rate_Change_Type {Integer}
lappend params_list CONFIG.Reload_File {no_coe_file_loaded}
lappend params_list CONFIG.Reset_Data_Vector {true}
lappend params_list CONFIG.S_CONFIG_Method {Single}
lappend params_list CONFIG.S_CONFIG_Sync_Mode {On_Vector}
lappend params_list CONFIG.S_DATA_Has_FIFO {false}
lappend params_list CONFIG.S_DATA_Has_TUSER {Not_Required}
lappend params_list CONFIG.SamplePeriod {1.00000000}
lappend params_list CONFIG.Sample_Frequency {0.001}
lappend params_list CONFIG.Select_Pattern {All}
lappend params_list CONFIG.Stopband_Max {1.00000000}
lappend params_list CONFIG.Stopband_Min {0.50000000}
lappend params_list CONFIG.Zero_Pack_Factor {1}

set_property -dict $params_list [get_ips fir_sysgen_fir_compiler_v7_2_i0]
}


validate_ip [get_ips]
