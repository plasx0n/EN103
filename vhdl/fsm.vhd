library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm is
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
end fsm;

architecture rtl of fsm is

    type state is(IDLE,btnc,load_reg1,load_reg2,load_d0,load_d1,comp_mode,comp_valid,reset_fsm);
    signal cstate, nstate : state ; 
    -- signal s_comp_valid : std_logic;

begin

    SYNC_PROC : process(clk,rst)
    begin
        if rst='1' then
            cstate <= reset_fsm; 
        else
            cstate <= nstate ; 
        end if;
    end process;

    OUTPUT_PROC : process(cstate)
    begin
        case cstate is  
        
            when IDLE =>
                dig0_init <= '0' ; 
                dig1_init <= '0' ;
                
            
            when reset_fsm =>
                rand_dig_load <= '0' ; 
                dig0_reg_load <= '0' ; 
                dig1_reg_load <= '0' ; 
    
                dig0_init <= '1' ; 
                dig1_init <= '1' ;  
 
                score_count_enab <='0' ;  

            when load_reg1 => 
                rand_dig_load <= '1' ; 

            when load_reg2 => 
                rand_dig_load <= '1' ; 

            when load_d0 => 
                dig0_reg_load <= '1' ; 
                rand_dig_load <= '0' ; 

            when load_d1 =>
                dig1_reg_load <= '1' ; 
                rand_dig_load <= '0' ; 
            
            when btnc =>
                dig0_reg_load <= '0' ; 
                

            when comp_mode => 
                dig1_reg_load <= '0' ; 


            when comp_valid =>
                score_count_enab <='1' ;

            when others =>
        
        end case;
    end process;

    STATE_PROC : process(cstate,i_btnc,i_btnd,comp_valid_i)
    begin
        case cstate is
        
            when IDLE =>
                if i_btnc='1' then
                    nstate <= load_reg1 ; 
                else
                    nstate <= IDLE ; 
                end if;
        
            when load_reg1 =>
                --transitoire pour load du reg 
                nstate <= load_d0 ; 
            
            when load_reg2 =>
                nstate <= load_d1 ;

            when load_d0 => 
                nstate <= btnc ; 
            
            when load_d1 =>
                nstate <= comp_mode ; 

            when btnc => 
                if i_btnc='1' then
                    nstate <= load_reg2 ; 
                else
                    nstate <= btnc ; 
                end if;
            
            when comp_mode => 
                if comp_valid_i='1' then
                    nstate <= comp_valid ; 
                else
                    nstate <= comp_mode ; 
                end if;

            when comp_valid =>
                    nstate <= reset_fsm;

            when reset_fsm =>
                    nstate <= IDLE; 

            when others =>
        
        end case;
        
    end process;

end architecture;