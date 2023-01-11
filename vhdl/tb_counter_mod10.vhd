library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_counter_decounter_univ is
end entity tb_counter_decounter_univ;

architecture Behavioral of tb_counter_decounter_univ is
    
component counter_enable is
    port (
        rst             : in std_logic;
        clk             : in std_logic;
        counter_value   : out std_logic_vector(3 downto 0)
    );
end component; 

signal s_rst : std_logic;
signal s_clk : std_logic :='0';
signal s_counter_value : std_logic_vector(3 downto 0);

begin

s_rst           <= '1' , '0' after 123 ns;
s_clk           <= not s_clk after 10 ns; 

inst_counter : counter_enable
    port map(
        rst             =>  s_rst,
        clk             =>  s_clk,
        counter_value   =>  s_counter_value);

end architecture;
