----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.05.2023 16:31:27
-- Design Name: 
-- Module Name: led - Behavioral
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

entity led is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           clk : in STD_LOGIC;
           l1 : out STD_LOGIC;
           l2 : out STD_LOGIC;
           l3 : out STD_LOGIC);
end led;

architecture Behavioral of led is

signal led_blink : std_logic := '0';

-- 8ns * 62.500.000 = 0,5s
constant period_blink : integer := 62500000 ;
--constant period_blink : integer := 100;
signal count1Hz : natural range 0 to period_blink := 0;

--signal blink : std_logic := '0';

begin

    process(clk)
    begin
        if (a = '1') and (b = '1') then -- an
            l1 <= '1';
            l2 <= '1';
            l3 <= '1';
        elsif (a = '1') and (b = '0') then -- blinken
            l1 <= led_blink;
            l2 <= led_blink;
            l3 <= led_blink;
        elsif (a = '0') and (b = '1') then -- 50% leuchten (50% Duty Cycle)
            l1 <= clk;
            l2 <= clk;
            l3 <= clk;  
        else -- aus
            l1 <= '0';
            l2 <= '0';
            l3 <= '0';
        end if;
    end process;
    
    process(clk)
    begin
        if rising_edge(clk) then
            if count1Hz = (period_blink - 1) then
                led_blink <= (not led_blink);
                count1Hz <= 0;
            else
                count1Hz <= (count1Hz + 1);
            end if;
        end if;
    end process;

end Behavioral;
