LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY tb_unsi2_7seg IS
END tb_unsi2_7seg;
 
ARCHITECTURE behavitbor OF tb_unsi2_7seg IS 

    COMPONENT unsi2_7seg
    PORT(
         digit_i : IN  std_logic_vector(3 downto 0);
         seg_o : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
   
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal seg7 : std_logic_vector(6 downto 0);
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: unsi2_7seg PORT MAP (
          digit_i => A,
          seg_o => seg7
        );

  -- Stimulus process
   stim_proc: process
   begin        
        for i in 0 to 15 loop
            A <= conv_std_logic_vector(i,4);
            wait for 50 ns;
        end loop;
      wait;
   end process;

END;