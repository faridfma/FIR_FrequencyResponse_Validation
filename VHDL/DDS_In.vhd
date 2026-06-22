library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity ADC1173_DSP is
    port(
        ADC_Clk          : in  std_logic;
        reset            : in  std_logic; 
        ADC_data_valid   : out std_logic;  
        ADC_Data_In      : in  std_logic_vector(7 downto 0);
        ADC_Data_In_out  : out std_logic_vector(7 downto 0)  
    ); 
end ADC1173_DSP;

architecture Behavioral of ADC1173_DSP is

    -- ADC synchronizer signals
    signal ADC_Data_In_sync1 : std_logic_vector(7 downto 0);
    signal ADC_Data_In_sync2 : std_logic_vector(7 downto 0);
    signal adc_toggle        : std_logic := '0';  -- toggle in 10MHz domain
    
    
    -- Decimation counter: 0 to 9 (divide by 10 ? 10MHz/10 = 1MHz)
    signal decim_cnt         : unsigned(4 downto 0) := (others => '0');
    signal decim_en          : std_logic;


begin

----------------------------------------------------------------
-- ADC input registration and decimation: 10MHz -> 500KHz
----------------------------------------------------------------
process(ADC_Clk, reset)
begin
    if reset = '1' then
       ADC_Data_In_sync1 <= (others => '0');
       ADC_Data_In_sync2 <= (others => '0');
       decim_cnt         <= (others => '0');
       adc_toggle        <= '0';  -- add this
    elsif rising_edge(ADC_Clk) then
       ADC_Data_In_sync1 <= ADC_Data_In;
        
        if decim_cnt = 19 then
          decim_cnt         <= (others => '0');  -- reset counter!
          ADC_Data_In_sync2 <= ADC_Data_In_sync1;
          adc_toggle        <= not adc_toggle; -- toggle persists into 200MHz domain
        else
          decim_cnt <= decim_cnt + 1;
        end if;
    end if;
end process; 

--removing the DC: 119 is a DC value 
ADC_Data_In_out <= std_logic_vector(signed(unsigned(ADC_Data_In_sync2))- to_signed(119, 8));
ADC_data_valid  <= adc_toggle;

-------------------------------------------------------------------
---DDS SWEEP 
-------------------------------------------------------------------  





end Behavioral;



