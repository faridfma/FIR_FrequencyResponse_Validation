This Vivado project is for a LIVE video I posted on YouTube here: https://www.youtube.com/watch?v=2GTG1b6WEZ8&t=2s

The video tile is:
FIR 25KHz Frequency Response Validation on FPGA | 0–40 kHz Sweep | Spartan-7

Simulation can predict filter performance—but how closely does a real FPGA implementation match the expected frequency response?

In this demonstration, I am performing a live 0–40 kHz frequency sweep. The sweep is incremented each time with a 100 Hz and each frequency lasts 10 ms. The whole sweeps takes 4 seconds to complete. 

I am experimentally validating the frequency response of my 25 KHz bandwidth FIR filter implemented on a Xilinx Spartan-7 FPGA.

To observe the filter behavior across multiple domains, the validation includes:
📈 Time-domain analysis using an oscilloscope
📊 Frequency-domain analysis using a spectrum analyzer
🔍 Internal FPGA visibility using Integrated Logic Analyzer (ILA)
📊 Output via a DAC reconstruction

Signal chain:

🎛️ Function Generator for AC sweep in Test1 and DDS for AC sweep in Test2

→ ADC1173 Sampling

→ FIR Processing, and DSS on Spartan-7 FPGA

→ DAC Reconstruction

→ Scope + ILA + Spectrum Analyzer

The goal of this project is to move beyond simulation and demonstrate practical DSP validation directly on hardware.

If you enjoy hands-on FPGA, DSP, SDR, and real hardware implementations, consider following and subscribing to support the channel and future demonstrations.

References: 
1. https://www.youtube.com/watch?v=9c4JbE6ZaM4&t=550s

2. https://www.youtube.com/watch?v=6nKnMCRH5zM&t=11s

3. https://embeddeddesign.org/frequency-sweep-from-1-500-khz-with-dds-ip-core/

4. https://embeddeddesign.org/infinite-impulse-filter-design-for-75khz-on-fpga/

I’d also love to hear your thoughts and feedback on the setup and results.

#FPGA #DSP #FIR #DigitalSignalProcessing #Xilinx #Spartan7 #Vivado #EmbeddedSystems #SDR #SignalProcessing
