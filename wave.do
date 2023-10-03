onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/rst
add wave -noupdate /testbench/ADC_SCLK
add wave -noupdate /testbench/ADC_CS_N
add wave -noupdate /testbench/ADC_DOUT
add wave -noupdate /testbench/ADC_DIN
add wave -noupdate /testbench/pwm_out
add wave -noupdate /testbench/u_top/CH0
add wave -noupdate /testbench/u_top/CH1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {325019867 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1048576 ns}
