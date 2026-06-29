library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity DDS_Sig_Gen is
    port(
        ADC_Clk          : in  std_logic;
        DDS_Clk          : in  std_logic;
        reset            : in  std_logic;
        ADC_Data_In      : in  std_logic_vector(7 downto 0); 
        ADC_data_valid   : out std_logic;  
        ADC_Data_In_out  : out std_logic_vector(7 downto 0)  
    ); 
end DDS_Sig_Gen;

architecture Behavioral of DDS_Sig_Gen is

--------------------------------------------------------------------
-- ADC/Decimation signals
--------------------------------------------------------------------
signal ADC_Data_In_sync1 : std_logic_vector(7 downto 0) := (others => '0');
signal adc_toggle        : std_logic := '0';
signal decim_cnt         : unsigned(8 downto 0) := (others => '0');

--------------------------------------------------------------------
-- DDS interface signals
--------------------------------------------------------------------
signal s_axis_phase_tvalid_sig  : std_logic := '1';
signal s_axis_phase_tdata_sig   : std_logic_vector(31 downto 0) := (others => '0');
signal m_axis_data_tvalid_sig   : std_logic;
signal DDS_data_tdata           : std_logic_vector(7 downto 0); 

--------------------------------------------------------------------
-- Sweep parameters (31-bit phase increment)
--------------------------------------------------------------------
constant PH_INC_STEP   : unsigned(30 downto 0) := to_unsigned(1074, 31);
constant MAX_STEP      : integer := 401;
constant DWELL_COUNT   : integer := 2000000;  -- 1ms @ 200MHz

--------------------------------------------------------------------
-- Sweep registers
--------------------------------------------------------------------
signal dwell_counter   : integer range 0 to DWELL_COUNT - 1 := 0;
signal step_count      : integer range 1 to MAX_STEP        := 1;
signal current_ph_inc  : unsigned(30 downto 0)              := PH_INC_STEP;

--------------------------------------------------------------------
-- Components
--------------------------------------------------------------------
COMPONENT dds_compiler_0
  PORT (
    aclk                : IN  STD_LOGIC;
    s_axis_phase_tvalid : IN  STD_LOGIC;
    s_axis_phase_tdata  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid  : OUT STD_LOGIC;
    m_axis_data_tdata   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

begin

--------------------------------------------------------------------
-- DDS instance
--------------------------------------------------------------------
DDS_Sweep : dds_compiler_0
port map (
    aclk                => DDS_Clk,
    s_axis_phase_tvalid => s_axis_phase_tvalid_sig,
    s_axis_phase_tdata  => s_axis_phase_tdata_sig,
    m_axis_data_tvalid  => m_axis_data_tvalid_sig,
    m_axis_data_tdata   => DDS_data_tdata
);

--------------------------------------------------------------------
-- Decimation process: 200MHz / 400 = 500KHz output rate
--------------------------------------------------------------------
process(DDS_Clk, reset)
begin
    if reset = '1' then
        ADC_Data_In_sync1 <= (others => '0');
        decim_cnt         <= (others => '0');
        adc_toggle        <= '0';

    elsif rising_edge(DDS_Clk) then

        if decim_cnt = to_unsigned(399, decim_cnt'length) then
            decim_cnt         <= (others => '0');
            ADC_Data_In_sync1 <= DDS_data_tdata;  -- sample DDS output
            adc_toggle        <= not adc_toggle;   -- toggle = new sample event
        else
            decim_cnt <= decim_cnt + 1;
        end if;

    end if;
end process; 

ADC_Data_In_out <= ADC_Data_In_sync1;
ADC_data_valid  <= adc_toggle;

--------------------------------------------------------------------
-- Sweep generator
--------------------------------------------------------------------
process(DDS_Clk, reset)
begin
    if reset = '1' then
        dwell_counter           <= 0;
        step_count              <= 1;
        current_ph_inc          <= PH_INC_STEP;
        s_axis_phase_tvalid_sig <= '1';                                   -- always high
        s_axis_phase_tdata_sig  <= std_logic_vector(resize(PH_INC_STEP, 32));  -- preload first frequency

    elsif rising_edge(DDS_Clk) then

        -- tvalid stays HIGH always
        s_axis_phase_tvalid_sig <= '1';

        if dwell_counter = DWELL_COUNT - 1 then
            dwell_counter <= 0;

            if step_count = MAX_STEP then
                -- sweep restart: reset phase and frequency
                step_count             <= 1;
                current_ph_inc         <= PH_INC_STEP;
                s_axis_phase_tdata_sig <= (others => '0');  -- send zero phase to reset DDS phase accumulator
            else
                -- normal step: send NEXT frequency
                step_count             <= step_count + 1;
                current_ph_inc         <= current_ph_inc + PH_INC_STEP;
                s_axis_phase_tdata_sig <= std_logic_vector(
                    resize(current_ph_inc + PH_INC_STEP, 32));  -- send next value not current
            end if;

        else
            dwell_counter <= dwell_counter + 1;
            -- keep sending current frequency during dwell
            s_axis_phase_tdata_sig <= std_logic_vector(resize(current_ph_inc, 32));
        end if;

    end if;
end process;

end Behavioral;