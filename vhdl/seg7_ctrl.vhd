library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seg7_ctrl is
    port (
        clk             : in std_logic;
        rst             : in std_logic; 

        dig0_7seg_i     : in std_logic_vector(7 downto 0);
        dig1_7seg_i     : in std_logic_vector(7 downto 0);
        dig2_7seg_i     : in std_logic_vector(7 downto 0);
        -- dig_select_i    : in std_logic_vector(1 downto 0);
   
        seg7_ca_o       : out std_logic_vector(7 downto 0);
        seg7_an_o       : out std_logic_vector(2 downto 0)
        );
end seg7_ctrl;

architecture rtl of seg7_ctrl is

    signal cnt : unsigned(19 downto 0);
    signal hex: std_logic_vector(7 downto 0);  -- hexadecimal digit
	signal intAn: std_logic_vector(2 downto 0); -- internal signal representing anode data


begin

    seg7_an_o <= intAn ; 
    seg7_ca_o <= hex ; 

    clockDivider: process(clk)
    begin
        if rst='1'then
            cnt<=(others=>'0');     
        elsif clk'event and clk = '1' then
            cnt <= cnt + 1;
        end if;
    end process clockDivider;

    -- Anode Select
   with cnt(19 downto 17) select -- 100MHz/2^20 = 95.3Hz
   intAn <=    
      "110" when "000",
      "101" when "001",
      "011" when others; 

       -- Digit Select
   with cnt(19 downto 17) select -- 100MHz/2^20 = 95.3Hz
   hex <=      
      dig0_7seg_i when "000",
      dig1_7seg_i when "001",
      dig2_7seg_i when others;

end architecture;