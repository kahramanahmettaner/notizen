----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2023 16:26:04
-- Design Name: 
-- Module Name: Testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Testbench is
--  Port ( );
end Testbench;

architecture Behavioral of Testbench is

    component fullAdder
    port(a,b,c_in: in std_logic;
        s,c_out: out std_logic );
    end component;
    signal a, b, c_in: std_logic := '0';
    signal s, c_out: std_logic;

begin

    uut: fullAdder port map (
        a => a, b => b, c_in => c_in, s => s, c_out => c_out
    );

    stim_proc: process
        begin
            a <= '0'; b <= '0'; c_in <= '0';
            wait for 100ns;
            
            a <= '0'; b <= '0'; c_in <= '1';
            wait for 100ns;
            
            a <= '0'; b <= '1'; c_in <= '0';
            wait for 100ns;
            
            a <= '0'; b <= '1'; c_in <= '1';
            wait for 100ns;
            
            a <= '1'; b <= '0'; c_in <= '0';
            wait for 100ns;
            
            a <= '1'; b <= '0'; c_in <= '1';
            wait for 100ns;
            
            a <= '1'; b <= '1'; c_in <= '0';
            wait for 100ns;
            
            a <= '1'; b <= '1'; c_in <= '1';
            wait for 100ns;
        end process;
    
    response_control: process
        begin
            REPORT " simulation :" SEVERITY note ;
            WAIT FOR 80 ns;
            
            ASSERT s ='0' AND c_out = '0'  REPORT " right result " SEVERITY note;
            ASSERT NOT (s ='0' AND c_out = '0') REPORT " wrong result " SEVERITY error ;
            WAIT FOR 100ns;

            ASSERT s ='1' AND c_out = '0'  REPORT " right result " SEVERITY note;
            ASSERT s ='0' OR c_out = '1' REPORT " wrong result " SEVERITY error ;
            WAIT FOR 100ns;

            ASSERT s ='1' AND c_out = '0'  REPORT " right result " SEVERITY note;
            ASSERT NOT (s ='1' AND c_out = '0') REPORT " wrong result " SEVERITY error ;
            WAIT FOR 100ns;

            ASSERT s ='0' AND c_out = '1'  REPORT " right result " SEVERITY note;
            ASSERT NOT (s ='0' AND c_out = '1') REPORT " wrong result " SEVERITY error ;
            WAIT FOR 100ns;

            ASSERT s ='1' AND c_out = '0'  REPORT " right result " SEVERITY note;
            ASSERT NOT (s ='0' AND c_out = '0') REPORT " wrong result " SEVERITY error ;
            WAIT FOR 100ns;

            ASSERT s ='0' AND c_out = '1'  REPORT " right result " SEVERITY note;
            ASSERT NOT (s ='0' AND c_out = '1') REPORT " wrong result " SEVERITY error ;
            WAIT FOR 100ns;

            ASSERT s ='0' AND c_out = '1'  REPORT " right result " SEVERITY note;
            ASSERT NOT (s ='0' AND c_out = '1') REPORT " wrong result " SEVERITY error ;
            WAIT FOR 100ns;

            ASSERT s ='1' AND c_out = '1'  REPORT " right result " SEVERITY note;
            ASSERT NOT (s ='1' AND c_out = '1') REPORT " wrong result " SEVERITY error ;
            wait;
        end process;

end Behavioral;
