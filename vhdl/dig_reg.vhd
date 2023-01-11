library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dig_register is
    port (
        clk : in std_logic;
        rst : in std_logic;
        load    : in std_logic;
        init    : in std_logic;
        reg_i   : in std_logic_vector(3 downto 0); 
        reg_o   :out std_logic_vector(3 downto 0)
    );
end dig_register;

architecture rtl of dig_register is

    signal reg : std_logic_vector(3 downto 0); 

begin

    REGISTER_PROC : process(clk, rst)
    begin
        if rst = '1' then
            reg <=(others=>'0'); 
        elsif rising_edge(clk) then
            if(init='1')then
                reg<=(others=>'0');
            else if(load<='1')then
                    reg<=reg_i; 
                end if; 
            end if; 
        end if;
    end process;

    reg_o <= reg ; 

end architecture;