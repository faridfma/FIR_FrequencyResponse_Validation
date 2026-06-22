onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fir_25KHz_opt

do {wave.do}

view wave
view structure
view signals

do {fir_25KHz.udo}

run -all

quit -force
