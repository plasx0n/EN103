library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity score_counter is
    port (
        clk : in std_logic;
        rst : in std_logic;
        enable : in std_logic; 

        score_o : out std_logic_vector(3 downto 0)

        );
end score_counter;

architecture rtl of score_counter is

    signal score : unsigned(3 downto 0) ; 

begin

    score_o <= std_logic_vector(score) ; 

    SC_PROC : process(clk, rst)
    begin
        if rst = '1' then
            score <= (others=>'0'); 
        elsif rising_edge(clk) then
            if enable='1' then 
                score <= score + 1 ; 
            end if; 
        end if;
    end process;

end architecture;