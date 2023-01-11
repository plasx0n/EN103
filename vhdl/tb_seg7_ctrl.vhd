library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_seg7_ctrl is
end tb_seg7_ctrl;

architecture rtl of tb_seg7_ctrl is

    component seg7_ctrl is
        port (
            clk             : in std_logic;
            rst             : in std_logic; 
    
            dig0_7seg_i     : in std_logic_vector(7 downto 0);
            dig1_7seg_i     : in std_logic_vector(7 downto 0);
            dig2_7seg_i     : in std_logic_vector(7 downto 0);
            seg7_ca_o       : out std_logic_vector(7 downto 0);
            seg7_an_o       : out std_logic_vector(2 downto 0)
            );
    end component;

        signal s_clk,s_rst : std_logic :='0' ; 
        signal s_dig0,s_dig1,s_dig2 : std_logic_vector(7 downto 0);

begin

    s_rst <= '1','0' after 20 ns ; 
    s_clk <= not s_clk after 10 ns ; 
    s_dig0 <=x"09" ; 
    s_dig1 <=x"04" ; 
    s_dig2 <=x"07" ; 

    inst_uut : seg7_ctrl
    port map(
        clk => s_clk,
        rst => s_rst,

        dig0_7seg_i => s_dig0,
        dig1_7seg_i => s_dig1,
        dig2_7seg_i => s_dig2,
        seg7_ca_o => open,
        seg7_an_o => open 
    );


end architecture;