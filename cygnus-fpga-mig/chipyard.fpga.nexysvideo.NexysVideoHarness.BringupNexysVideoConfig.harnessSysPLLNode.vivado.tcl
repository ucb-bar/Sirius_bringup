create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name \
 harnessSysPLLNode -dir $ipdir -force
set_property -dict [list \
 CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
 CONFIG.PRIM_SOURCE {No_buffer} \
 CONFIG.NUM_OUT_CLKS {3} \
 CONFIG.PRIM_IN_FREQ {100.0} \
 CONFIG.CLKIN1_JITTER_PS {50.0} \
 CONFIG.CLKOUT1_USED {true} \
 CONFIG.CLKOUT2_USED {true} \
 CONFIG.CLKOUT3_USED {true} \
 CONFIG.CLKOUT4_USED {false} \
 CONFIG.CLKOUT5_USED {false} \
 CONFIG.CLKOUT6_USED {false} \
 CONFIG.CLKOUT7_USED {false} \
 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.0} \
 CONFIG.CLKOUT1_REQUESTED_PHASE {0.0} \
 CONFIG.CLKOUT1_REQUESTED_DUTY_CYCLE {50.0} \
 CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {100.0} \
 CONFIG.CLKOUT2_REQUESTED_PHASE {0.0} \
 CONFIG.CLKOUT2_REQUESTED_DUTY_CYCLE {50.0} \
 CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {200.0} \
 CONFIG.CLKOUT3_REQUESTED_PHASE {0.0} \
 CONFIG.CLKOUT3_REQUESTED_DUTY_CYCLE {50.0} \
] [get_ips harnessSysPLLNode]
set mult [get_property CONFIG.MMCM_CLKFBOUT_MULT_F [get_ips harnessSysPLLNode]]
set div1 [get_property CONFIG.MMCM_DIVCLK_DIVIDE [get_ips harnessSysPLLNode]]
set jitter [get_property CONFIG.CLKOUT1_JITTER [get_ips harnessSysPLLNode]]
if {$jitter > 300.0} {
  puts "Output jitter $jitter ps exceeds required limit of 300.0"
  exit 1
}
set phase [get_property CONFIG.MMCM_CLKOUT0_PHASE [get_ips harnessSysPLLNode]]
if {$phase < -5.0 || $phase > 5.0} {
  puts "Achieved phase $phase degrees is outside tolerated range -5.0-5.0"
  exit 1
}
set div2 [get_property CONFIG.MMCM_CLKOUT0_DIVIDE_F [get_ips harnessSysPLLNode]]
set freq [expr { 100.0 * $mult / $div1 / $div2 }]
if {$freq < 49.5 || $freq > 50.5} {
  puts "Achieved frequency $freq MHz is outside tolerated range 49.5-50.5"
  exit 1
}
puts "Achieve frequency $freq MHz phase $phase degrees jitter $jitter ps"
set jitter [get_property CONFIG.CLKOUT2_JITTER [get_ips harnessSysPLLNode]]
if {$jitter > 300.0} {
  puts "Output jitter $jitter ps exceeds required limit of 300.0"
  exit 1
}
set phase [get_property CONFIG.MMCM_CLKOUT1_PHASE [get_ips harnessSysPLLNode]]
if {$phase < -5.0 || $phase > 5.0} {
  puts "Achieved phase $phase degrees is outside tolerated range -5.0-5.0"
  exit 1
}
set div2 [get_property CONFIG.MMCM_CLKOUT1_DIVIDE [get_ips harnessSysPLLNode]]
set freq [expr { 100.0 * $mult / $div1 / $div2 }]
if {$freq < 99.0 || $freq > 101.0} {
  puts "Achieved frequency $freq MHz is outside tolerated range 99.0-101.0"
  exit 1
}
puts "Achieve frequency $freq MHz phase $phase degrees jitter $jitter ps"
set jitter [get_property CONFIG.CLKOUT3_JITTER [get_ips harnessSysPLLNode]]
if {$jitter > 300.0} {
  puts "Output jitter $jitter ps exceeds required limit of 300.0"
  exit 1
}
set phase [get_property CONFIG.MMCM_CLKOUT2_PHASE [get_ips harnessSysPLLNode]]
if {$phase < -5.0 || $phase > 5.0} {
  puts "Achieved phase $phase degrees is outside tolerated range -5.0-5.0"
  exit 1
}
set div2 [get_property CONFIG.MMCM_CLKOUT2_DIVIDE [get_ips harnessSysPLLNode]]
set freq [expr { 100.0 * $mult / $div1 / $div2 }]
if {$freq < 198.0 || $freq > 202.0} {
  puts "Achieved frequency $freq MHz is outside tolerated range 198.0-202.0"
  exit 1
}
puts "Achieve frequency $freq MHz phase $phase degrees jitter $jitter ps"
