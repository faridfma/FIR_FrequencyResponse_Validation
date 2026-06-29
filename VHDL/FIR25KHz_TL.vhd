library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;



entity FIR_TopLevel is
port (
   clk         : in  std_logic; 
   reset       : in  std_logic;
   
   ADC_Clk_10MHz : out std_logic; 
   ADC_Data_In   : in std_logic_vector(7 downto 0); 
              
   Dac_out       : out std_logic_vector(11 downto 0); 
   ChipSeclect_n : out STD_LOGIC; 
   WriteEnable   : out STD_LOGIC

); 
end FIR_TopLevel;

architecture Behavioral of FIR_TopLevel is

signal clockcounter       : integer range 0 to 399 := 0;
signal clk_div            : STD_LOGIC := '0';

signal DDS_data_tvalid_out : std_logic := '0'; 
signal DDS_data_tdata_out  : std_logic_vector(15 DOWNTO 0); 

signal FIR_sample_valid_in     : std_logic := '0';       -- Sample valid input signal
signal s_axis_data_tready_Sig  : STD_LOGIC;
signal FIR_data_out_valid  : STD_LOGIC;
signal FIR_tdata_out           : STD_LOGIC_VECTOR(31 DOWNTO 0); 
signal FIR_data_in             : std_logic_vector(7 DOWNTO 0); 
 
signal ADC_Data_Out_IntSig     : std_logic_vector(7 DOWNTO 0);
signal FIR_in                  : std_logic_vector(7 DOWNTO 0);  

signal DACcounter              : integer range 0 to 19 := 0; 
signal DAC_in_pulse            : std_logic := '0'; 
signal ChipSeclect_n_sig       : std_logic := '0';  
signal WriteEnable_IntSig      : std_logic := '0';
signal Dac_Out_Sig             : std_logic_vector(11 DOWNTO 0);
signal Dac_Out_temp            : std_logic_vector(11 DOWNTO 0);
signal FIR_OutScaled           : std_logic_vector(11 DOWNTO 0);
signal state                   : integer := 0; 

signal clk100MHz : STD_LOGIC;
signal clk200MHz : STD_LOGIC;
signal clk10MHz  : STD_LOGIC;

signal Cos_5KHz_Waveform : STD_LOGIC_VECTOR(7 downto 0);
signal Cos_1MHz_Waveform : STD_LOGIC_VECTOR(7 downto 0);
signal Mixed_Signal      : STD_LOGIC_VECTOR(8 downto 0); 
signal Cos_5KHz_tvalid   : STD_LOGIC;
signal Cos_1MHz_tvalid   : STD_LOGIC; 

signal fir_data_sync1 : std_logic_vector(31 downto 0) := (others => '0');
signal fir_data_sync2 : std_logic_vector(31 downto 0) := (others => '0');

signal adc_sync1          : std_logic := '0';  -- 200MHz sync stage 1
signal adc_sync2          : std_logic := '0';  -- 200MHz sync stage 2
signal adc_sync2_prev     : std_logic := '0';  -- for edge detection
signal ADC_data_valid_Sig : std_logic := '0'; 
signal FIR_in_Sync        : std_logic_vector(7 downto 0);
signal state_counter      : integer range 0 to 9 := 0;  -- 20 cycles of 200MHz = 100ns = 1 cycle of 10MHz
signal valid_flag         : std_logic := '0'; 
signal valid_flag_clear   : std_logic := '0'; 


component clk_wiz_0
port
 (
  clk_out1          : out    std_logic;
  clk_out2          : out    std_logic;
  clk_out3          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

COMPONENT ila_0
PORT (
	clk    : IN STD_LOGIC;
	probe0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT  ;
 
 
COMPONENT DDS_Sig_Gen
PORT(
        ADC_Clk        : in  std_logic;
        DDS_Clk        : in  std_logic; 
        reset          : in  std_logic; 
        ADC_data_valid : out std_logic;
        ADC_Data_In    : in  std_logic_vector(7 downto 0);
        ADC_Data_In_out: out std_logic_vector(7 downto 0)  
    ); 
END COMPONENT;


COMPONENT fir_25KHz
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
  
 
begin

PLL: clk_wiz_0
   port map ( 
   clk_out1 => clk100MHz,
   clk_out2 => clk200MHz,
   clk_out3 => clk10MHz,
   clk_in1 => clk
 );


ADC_Clk_10MHz <= clk10MHz;



ILa: ila_0
PORT MAP (
	clk => clk200MHz,
	probe0 => FIR_in, 
	probe1 => FIR_OutScaled, --FIR_tdata_out(31 downto 20), 
	probe2(0) => ChipSeclect_n_sig, --FIR_data_out_valid,
	probe3(0) => FIR_sample_valid_in
);

DDS_Sweep: DDS_Sig_Gen
PORT MAP (
   ADC_Clk  => Clk10MHz,
   DDS_Clk  => Clk200MHz, 
   reset    => reset,
   ADC_data_valid => ADC_data_valid_Sig, 
   ADC_Data_In  => ADC_Data_In,
   ADC_Data_In_out => ADC_Data_Out_IntSig 
); 

FIR_IPcore:fir_25KHz
PORT MAP (
    aclk => clk200MHz,
    s_axis_data_tvalid => FIR_sample_valid_in,
    s_axis_data_tready => s_axis_data_tready_Sig,
    s_axis_data_tdata  => FIR_in,
    m_axis_data_tvalid => FIR_data_out_valid,
    m_axis_data_tdata  => FIR_tdata_out
  );


process(clk200MHz, reset)
begin
  if reset = '1' then
        FIR_in_Sync <= (others => '0'); 
        FIR_in              <= (others => '0');
        adc_sync1           <= '0';
        adc_sync2           <= '0';
        adc_sync2_prev      <= '0';
        FIR_sample_valid_in <= '0';
    elsif rising_edge(clk200MHz) then
        -- two flop for data
        FIR_in_Sync <= ADC_Data_Out_IntSig;   
        FIR_in <= FIR_in_Sync;
        
        -- two flop for valid toggle
        adc_sync1      <= ADC_data_valid_Sig;
        adc_sync2      <= adc_sync1;
        adc_sync2_prev <= adc_sync2;

        -- edge detect = new ADC data arrived
        FIR_sample_valid_in <= adc_sync2 xor adc_sync2_prev;  -- single pulse
    end if;
end process;


------------------------------------------------------------------
----This Process implements a state machine that write to the DAC
---- AD5445
------------------------------------------------------------------ 
process(clk200MHz, reset)
begin
    if reset = '1' then
        ChipSeclect_n_sig  <= '1';
        WriteEnable_IntSig <= '1';
        valid_flag_clear   <= '0'; 
        Dac_Out_Sig        <= (others => '0');
        Dac_Out_temp       <= (others => '0');
        FIR_OutScaled      <= (others => '0');
        state_counter      <= 0;
        state              <= 0;

    elsif rising_edge(clk200MHz) then

        case state is

            when 0 =>
    
                if FIR_data_out_valid = '1' then
                    
                    ChipSeclect_n_sig  <= '0';
                    WriteEnable_IntSig <= '0';
                    
                    FIR_OutScaled      <= FIR_tdata_out(31 downto 20);  -- no CDC issue, same domain!
                    
                    state_counter      <= 0;
                    state              <= 1;
                end if;

            when 1 =>                              
                    valid_flag_clear <= '0';       -- deassert clear
                    Dac_Out_temp  <= std_logic_vector(unsigned(signed(FIR_OutScaled) + to_signed(2048, 12)));
                    state         <= 2;
            when 2 =>                                  -- wait 20 cycles = 100ns
                if state_counter = 9 then
                    Dac_Out_Sig   <= Dac_Out_temp;
                    state_counter <= 0;
                    state         <= 3;
                else
                    state_counter <= state_counter + 1;
                end if;

            when 3 =>                                  -- wait 20 cycles = 100ns
                if state_counter = 9 then
                    Dac_out            <= Dac_Out_Sig;
                    ChipSeclect_n_sig  <= '1';
                    WriteEnable_IntSig <= '1';
                    state_counter      <= 0;
                    state              <= 0;
                else
                    state_counter <= state_counter + 1;
                end if;

            when others =>
                state <= 0;

        end case;
    end if;
end process;

ChipSeclect_n<= ChipSeclect_n_sig;
WriteEnable  <= WriteEnable_IntSig;

end Behavioral;