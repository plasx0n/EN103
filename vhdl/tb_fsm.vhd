library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ent is
end ent;

architecture rtl of ent is

    component fsm is
        port (
            clk :   in std_logic;
            rst :   in std_logic;
            i_btnc :  in std_logic;
            i_btnd :  in std_logic;
            comp_valid_i        : in std_logic; 
    
            rand_dig_load       : out std_logic;
            dig0_reg_load       : out std_logic;
            dig1_reg_load       : out std_logic;
    
            dig0_init   :out std_logic;
            dig1_init   :out std_logic; 
    
            score_count_enab    : out std_logic 
    
        );
    end component; 

signal clk,rst,i_btnc,i_btnd,comp_valid : std_logic :='0';

begin

clk <= not clk after 10 ns; 
rst <= '1' , '0' after 10 ns ; 

i_btnc <=  '0', '1' after 60 ns, '0' after 70 ns , '1' after 120 ns, '0' after 130 ns; 
comp_valid <='0','1' after 200 ns , '0' after 220 ns ; 
inst_fsm:fsm
port map(
    clk             => clk,
    rst             => rst, 
    i_btnc          => i_btnc,
    i_btnd          => i_btnd, 
    comp_valid_i    => comp_valid, 
    rand_dig_load   => open,
    dig0_reg_load   => open,
    dig1_reg_load   => open,
    dig0_init       => open,
    dig1_init       => open 
); 

end architecture;