-- has to be mod100

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_enable is
    port (
        rst             : in std_logic;
        clk             : in std_logic;
        counter_value   : out std_logic_vector(3 downto 0)
    );
end entity counter_enable;

architecture Behavioral of counter_enable is
    -- mod10
    signal count_val : unsigned(3 downto 0) ; 

begin

    counter_value_register : process(rst,clk)
    begin
        if(rst='1') then
            count_val <= (others=>'0');
        elsif (clk'event and clk ='1') then
            if(count_val=to_unsigned(9,4))then
                count_val<=(others=>'0'); 
            else 
                count_val <= count_val + 1 ; 
            end if; 
        end if; 
    end process counter_value_register;

counter_value <= std_logic_vector(count_val); 

end architecture;