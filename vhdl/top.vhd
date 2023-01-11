library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    port (
        clk : in std_logic;
        rst : in std_logic
    );
end top;

architecture rtl of top is


    component seg7_ctrl is
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
    end component;

    component counter_enable is
        port (
            rst             : in std_logic;
            clk             : in std_logic;
            counter_value   : out std_logic_vector(3 downto 0)
        );
    end component ;

    component rand_dig_register is
        port (
            clk : in std_logic;
            rst : in std_logic;
            load    : in std_logic;
            reg_i   : in std_logic_vector(3 downto 0); 
            reg_o   :out std_logic_vector(3 downto 0)
        );
    end component;

    component dig_register is
        port (
            clk : in std_logic;
            rst : in std_logic;
            load    : in std_logic;
            init    : in std_logic;
            reg_i   : in std_logic_vector(3 downto 0); 
            reg_o   :out std_logic_vector(3 downto 0)
        );
    end component;

    component score_counter is
        port (
            clk : in std_logic;
            rst : in std_logic;
            enable : in std_logic; 
    
            score_o : out std_logic_vector(3 downto 0)
    
            );
    end component;

    component fsm is 
        port (
            clk :                   in std_logic;
            rst :                   in std_logic;
            i_btnc :                in std_logic;
            i_btnd :                in std_logic;
            comp_valid_i        :   in std_logic; 
    
            rand_dig_load       :   out std_logic;
            dig0_reg_load       :   out std_logic;
            dig1_reg_load       :   out std_logic;
    
            dig0_init   :           out std_logic;
            dig1_init   :           out std_logic; 
    
            score_count_enab    :   out std_logic 
    
        );
    end component; 



begin



end architecture;