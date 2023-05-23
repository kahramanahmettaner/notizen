----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2023 15:24:22
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
    component nand2
    port( a,b: in std_logic;
        x: out std_logic);
    end component;
    signal a, b: std_logic := '0';
    signal x: std_logic := '0';
begin
    UUT: nand2 port map ( a => a, b => b, x => x);
    
    stim_proc: process
        begin
            a <= '0'; b <= '0';
            wait for 100ns;
            a <= '0'; b <= '1';
            wait for 100ns;
            a <= '1'; b <= '0';
            wait for 100ns;
            a <= '1'; b <= '1';
            wait for 100ns;
        end process;
        
    response_control: process
        begin
        
            REPORT " simulation :" SEVERITY note ;
            WAIT FOR 5 ns;
            
            ASSERT x='1' REPORT " wrong result " SEVERITY error ;
            ASSERT x='0' REPORT " right result " SEVERITY note ;
            WAIT FOR 100ns;
            
            ASSERT x='1' REPORT " wrong result " SEVERITY error ;
            ASSERT x='0' REPORT " right result " SEVERITY note ;
            WAIT FOR 100ns;
            
            ASSERT x='1' REPORT " wrong result " SEVERITY error ;
            ASSERT x='0' REPORT " right result " SEVERITY note ;
            WAIT FOR 100ns;
            
            ASSERT x='0' REPORT " wrong result " SEVERITY error ;
            ASSERT x='1' REPORT " right result " SEVERITY note ;
            wait;
        end process;

end Behavioral;
