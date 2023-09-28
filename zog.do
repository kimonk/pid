vlib pid
vmap pid pid

vlog -reportprogress 300 -work pid ./rtl/block_name11.v
vlog -reportprogress 300 -work pid ./rtl/block_name.v
vlog -reportprogress 300 -work pid ./rtl/clk_generator1.v
vlog -reportprogress 300 -work pid ./rtl/clk_generator32.v
vlog -reportprogress 300 -work pid ./rtl/clk.v
vlog -reportprogress 300 -work pid -sv ./rtl/comparator1.v
vlog -reportprogress 300 -work pid ./rtl/comp.v
vlog -reportprogress 300 -work pid ./rtl/constant.v
vlog -reportprogress 300 -work pid -sv ./rtl/iff.v
vlog -reportprogress 300 -work pid ./rtl/inputpin.v
vlog -reportprogress 300 -work pid ./rtl/pi11.v
vlog -reportprogress 300 -work pid ./rtl/pi1.v
vlog -reportprogress 300 -work pid ./rtl/pi22.v
vlog -reportprogress 300 -work pid ./rtl/pi2.v
vlog -reportprogress 300 -work pid ./rtl/pi_controller1.v
vlog -reportprogress 300 -work pid ./rtl/pi_controller2.v
vlog -reportprogress 300 -work pid ./rtl/signal_limiter2.v
vlog -reportprogress 300 -work pid ./rtl/SPIPLL.v
vlog -reportprogress 300 -work pid ./rtl/substract12.v
vlog -reportprogress 300 -work pid ./rtl/subtractor2.v
vlog -reportprogress 300 -work pid ./rtl/test123.v
vlog -reportprogress 300 -work pid ./rtl/testbench1.v
vlog -reportprogress 300 -work pid ./rtl/testbench.v
vlog -reportprogress 300 -work pid ./rtl/top.v
vlog -reportprogress 300 -work pid ./rtl/triangulwave.v
vlog -reportprogress 300 -work pid -sv ./rtl/waveform1.v

vlog -reportprogress 300 -work pid ./ip/adc_controller/synthesis/adc_controller.v
vlog -reportprogress 300 -work pid ./ip/adc_controller/synthesis/submodules/adc_controller_adc_mega_0.v
vlog -reportprogress 300 -work pid ./ip/adc_controller/synthesis/submodules/altera_up_avalon_adv_adc.v
#Start Simulation
vsim pid.top

#Add top-level signals
#do router2router_wave.do

#Run Sim
run 100us
