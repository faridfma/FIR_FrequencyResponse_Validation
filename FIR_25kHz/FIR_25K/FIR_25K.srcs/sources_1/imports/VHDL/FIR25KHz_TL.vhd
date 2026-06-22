library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;



entity FIR_TopLevel is
port (
   clk         : in  std_logic; 
   reset       : in  std_logic;              
   
   fir_valid   : out std_logic; 
   fir_out     : out std_logic_vector(15 downto 0)
); 
end FIR_TopLevel;

architecture Behavioral of FIR_TopLevel is

 
signal clk100MHz          : std_logic; 
signal clockcounter       : integer range 0 to 199 := 0;
signal clk_div            : STD_LOGIC := '0';

signal DDS_data_tvalid_out : std_logic := '0'; 
signal DDS_data_tdata_out  : std_logic_vector(15 DOWNTO 0); 

signal FIR_sample_valid_in     : std_logic := '0';       -- Sample valid input signal
signal s_axis_data_tready_Sig  : STD_LOGIC;
signal m_axis_data_tvalid_Sig  : STD_LOGIC;
signal m_axis_data_tdata_Sig   : STD_LOGIC_VECTOR(39 DOWNTO 0); 
signal FIR_data_in             : std_logic_vector(15 DOWNTO 0); 


component clk_wiz_0
port
 (
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;


component DDS_Sweep
port (
   clk             : in std_logic := '0';  --system cock running at 399.68MHz
   reset           : in std_logic; 

   DDS_data_tvalid : OUT STD_LOGIC;
   DDS_data_tdata  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
); 
end component;

COMPONENT fir_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
  );
END COMPONENT;
  
  

begin

PLL: clk_wiz_0
   port map (     
   clk_out1 => clk100MHz,
   clk_in1 => clk   --100MHz
 );
 

DDS_Inst: DDS_Sweep
port map(
   clk             => clk100MHz, 
   reset           => reset,

   DDS_data_tvalid => DDS_data_tvalid_out, 
   DDS_data_tdata  => DDS_data_tdata_out
); 

FIR_IPcore: fir_compiler_0
  PORT MAP (
    aclk => clk100MHz,
    s_axis_data_tvalid => FIR_sample_valid_in,
    s_axis_data_tready => s_axis_data_tready_Sig,
    s_axis_data_tdata => FIR_data_in,
    m_axis_data_tvalid => m_axis_data_tvalid_Sig,
    m_axis_data_tdata => m_axis_data_tdata_Sig
  );

fir_out <= m_axis_data_tdata_Sig(37 downto 22); 
fir_valid <= m_axis_data_tvalid_Sig; 


process(clk100MHz, reset)

begin
    if (reset = '1') then
        clockcounter <= 0;
        FIR_sample_valid_in <= '0';

    elsif rising_edge(clk100MHz) then

        if (clockcounter = 199) then
            FIR_sample_valid_in <= '1';   -- pulse HIGH for 1 cycle
            FIR_data_in <= DDS_data_tdata_out; 
            clockcounter <= 0;
        else
            FIR_sample_valid_in <= '0';
            clockcounter <= clockcounter + 1;
        end if;

    end if;

end process;


end Behavioral;