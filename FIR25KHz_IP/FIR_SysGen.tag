{
  'setup' => {
    'Delay' => 1.09700000000,
    'Destination' => 'FIR_SysGen/FIR_25KHz_BW',
    'Destination_Clock' => 'clk',
    'Levels_of_Logic' => 0,
    'Logic_Delay' => 0.45100000000,
    'Path_Constraints' => 'create_clock -name clk -period 5 [get_ports clk]',
    'Routing_Delay' => 0.64600000000,
    'Slack' => 2.65500000000,
    'Source' => 'FIR_SysGen/FIR_25KHz_BW',
    'Source_Clock' => 'clk',
    'fields' => 'Slack,Delay,Logic_Delay,Routing_Delay,Levels_of_Logic,Source,Destination,Source_Clock,Destination_Clock,Path_Constraints'
  },
  'types' => 'setup'
}
