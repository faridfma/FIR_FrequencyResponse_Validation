# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set AnalyzeTiming 1
	set AnalyzeTimingNumPaths {10000}
	set AnalyzeTimingPostImplementation 0
	set AnalyzeTimingPostSynthesis 1
	set Compilation {IP Catalog}
	set CompilationFlow {IP}
	set CreateInterfaceDocument {on}
	set DSPDevice {xc7s50}
	set DSPFamily {spartan7}
	set DSPPackage {csga324}
	set DSPSpeed {-2}
	set FPGAClockPeriod 5
	set GenerateTestBench 0
	set HDLLanguage {vhdl}
	set IPOOCCacheRootPath {C:/Users/fmabrouk/AppData/Local/Xilinx/Sysgen/SysgenVivado/win64.o/ip}
	set IP_Auto_Infer {1}
	set IP_Categories_Text {System_Generator_for_DSP}
	set IP_Common_Repos {0}
	set IP_Description {}
	set IP_Dir {}
	set IP_Library_Text {SysGen}
	set IP_LifeCycle_Menu {2}
	set IP_Logo {sysgen_icon_100.png}
	set IP_Name {}
	set IP_Revision {412633516}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {User_Company}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {fir_sysgen}
	set ProjectFiles {
		{{conv_pkg.vhd} -lib {xil_defaultlib}}
		{{synth_reg.vhd} -lib {xil_defaultlib}}
		{{synth_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{srl17e.vhd} -lib {xil_defaultlib}}
		{{srl33e.vhd} -lib {xil_defaultlib}}
		{{synth_reg_reg.vhd} -lib {xil_defaultlib}}
		{{single_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{xlclockdriver_rd.vhd} -lib {xil_defaultlib}}
		{{vivado_ip.tcl}}
		{{fir_sysgen_entity_declarations.vhd} -lib {xil_defaultlib}}
		{{fir_sysgen.vhd} -lib {xil_defaultlib}}
		{{fir_sysgen_clock.xdc}}
		{{fir_sysgen.xdc}}
		{{fir_sysgen.htm}}
	}
	set SimPeriod 5e-09
	set SimTime 0.01
	set SimulationTime {10000205.00000000 ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {C:/Users/fmabrouk/Documents/YT/FIR_25KHz_SysGen/FIR25KHz_IP}
	set TopLevelModule {fir_sysgen}
	set TopLevelSimulinkHandle 2.00024
	set VHDLLib {xil_defaultlib}
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface valid_in Name {valid_in}
	dict set TopLevelPortInterface valid_in Type Bool
	dict set TopLevelPortInterface valid_in ArithmeticType xlUnsigned
	dict set TopLevelPortInterface valid_in BinaryPoint 0
	dict set TopLevelPortInterface valid_in Width 1
	dict set TopLevelPortInterface valid_in DatFile {fir_sysgen_valid_in.dat}
	dict set TopLevelPortInterface valid_in IconText {valid_in}
	dict set TopLevelPortInterface valid_in Direction in
	dict set TopLevelPortInterface valid_in Period 400
	dict set TopLevelPortInterface valid_in Interface 0
	dict set TopLevelPortInterface valid_in InterfaceName {}
	dict set TopLevelPortInterface valid_in InterfaceString {DATA}
	dict set TopLevelPortInterface valid_in ClockDomain {fir_sysgen}
	dict set TopLevelPortInterface valid_in Locs {}
	dict set TopLevelPortInterface valid_in IOStandard {}
	dict set TopLevelPortInterface fir_data_in Name {fir_data_in}
	dict set TopLevelPortInterface fir_data_in Type Fix_8_7
	dict set TopLevelPortInterface fir_data_in ArithmeticType xlSigned
	dict set TopLevelPortInterface fir_data_in BinaryPoint 7
	dict set TopLevelPortInterface fir_data_in Width 8
	dict set TopLevelPortInterface fir_data_in DatFile {fir_sysgen_fir_data_in.dat}
	dict set TopLevelPortInterface fir_data_in IconText {FIR_Data_in}
	dict set TopLevelPortInterface fir_data_in Direction in
	dict set TopLevelPortInterface fir_data_in Period 400
	dict set TopLevelPortInterface fir_data_in Interface 0
	dict set TopLevelPortInterface fir_data_in InterfaceName {}
	dict set TopLevelPortInterface fir_data_in InterfaceString {DATA}
	dict set TopLevelPortInterface fir_data_in ClockDomain {fir_sysgen}
	dict set TopLevelPortInterface fir_data_in Locs {}
	dict set TopLevelPortInterface fir_data_in IOStandard {}
	dict set TopLevelPortInterface fir_data_out Name {fir_data_out}
	dict set TopLevelPortInterface fir_data_out Type Fix_30_27
	dict set TopLevelPortInterface fir_data_out ArithmeticType xlSigned
	dict set TopLevelPortInterface fir_data_out BinaryPoint 27
	dict set TopLevelPortInterface fir_data_out Width 30
	dict set TopLevelPortInterface fir_data_out DatFile {fir_sysgen_fir_data_out.dat}
	dict set TopLevelPortInterface fir_data_out IconText {FIR_data_out}
	dict set TopLevelPortInterface fir_data_out Direction out
	dict set TopLevelPortInterface fir_data_out Period 1
	dict set TopLevelPortInterface fir_data_out Interface 0
	dict set TopLevelPortInterface fir_data_out InterfaceName {}
	dict set TopLevelPortInterface fir_data_out InterfaceString {DATA}
	dict set TopLevelPortInterface fir_data_out ClockDomain {fir_sysgen}
	dict set TopLevelPortInterface fir_data_out Locs {}
	dict set TopLevelPortInterface fir_data_out IOStandard {}
	dict set TopLevelPortInterface data_tready_out Name {data_tready_out}
	dict set TopLevelPortInterface data_tready_out Type Bool
	dict set TopLevelPortInterface data_tready_out ArithmeticType xlUnsigned
	dict set TopLevelPortInterface data_tready_out BinaryPoint 0
	dict set TopLevelPortInterface data_tready_out Width 1
	dict set TopLevelPortInterface data_tready_out DatFile {fir_sysgen_data_tready_out.dat}
	dict set TopLevelPortInterface data_tready_out IconText {data_tready_out}
	dict set TopLevelPortInterface data_tready_out Direction out
	dict set TopLevelPortInterface data_tready_out Period 1
	dict set TopLevelPortInterface data_tready_out Interface 0
	dict set TopLevelPortInterface data_tready_out InterfaceName {}
	dict set TopLevelPortInterface data_tready_out InterfaceString {DATA}
	dict set TopLevelPortInterface data_tready_out ClockDomain {fir_sysgen}
	dict set TopLevelPortInterface data_tready_out Locs {}
	dict set TopLevelPortInterface data_tready_out IOStandard {}
	dict set TopLevelPortInterface data_tvalid_out Name {data_tvalid_out}
	dict set TopLevelPortInterface data_tvalid_out Type Bool
	dict set TopLevelPortInterface data_tvalid_out ArithmeticType xlUnsigned
	dict set TopLevelPortInterface data_tvalid_out BinaryPoint 0
	dict set TopLevelPortInterface data_tvalid_out Width 1
	dict set TopLevelPortInterface data_tvalid_out DatFile {fir_sysgen_data_tvalid_out.dat}
	dict set TopLevelPortInterface data_tvalid_out IconText {data_tvalid_out}
	dict set TopLevelPortInterface data_tvalid_out Direction out
	dict set TopLevelPortInterface data_tvalid_out Period 1
	dict set TopLevelPortInterface data_tvalid_out Interface 0
	dict set TopLevelPortInterface data_tvalid_out InterfaceName {}
	dict set TopLevelPortInterface data_tvalid_out InterfaceString {DATA}
	dict set TopLevelPortInterface data_tvalid_out ClockDomain {fir_sysgen}
	dict set TopLevelPortInterface data_tvalid_out Locs {}
	dict set TopLevelPortInterface data_tvalid_out IOStandard {}
	dict set TopLevelPortInterface clk Name {clk}
	dict set TopLevelPortInterface clk Type -
	dict set TopLevelPortInterface clk ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clk BinaryPoint 0
	dict set TopLevelPortInterface clk Width 1
	dict set TopLevelPortInterface clk DatFile {}
	dict set TopLevelPortInterface clk Direction in
	dict set TopLevelPortInterface clk Period 1
	dict set TopLevelPortInterface clk Interface 6
	dict set TopLevelPortInterface clk InterfaceName {}
	dict set TopLevelPortInterface clk InterfaceString {CLOCK}
	dict set TopLevelPortInterface clk ClockDomain {fir_sysgen}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project