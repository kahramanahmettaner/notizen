----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2023 15:40:51
-- Design Name: 
-- Module Name: led_TB - Behavioral
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

entity led_TB is
--  Port ( );
end led_TB;

architecture Behavioral of led_TB is

COMPONENT led
PORT(   a : in STD_LOGIC;
        b : in STD_LOGIC;
        clk : in STD_LOGIC;
        l1 : out STD_LOGIC;
        l2 : out STD_LOGIC;
        l3 : out STD_LOGIC );
END COMPONENT;

signal a : std_logic := '0';
signal b : std_logic := '0';
signal clk : std_logic := '0';
signal l1 : std_logic;
signal l2 : std_logic;
signal l3 : std_logic;

constant clk_period : time :=  8 ns;

begin

    uut: led PORT MAP (
    a => a,
    b => b,
    clk => clk,
    l1 => l1,
    l2 => l2,
    l3 => l3
    );
 
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    
    stim_proc: process
    begin
        wait for 2000000000ns;
        a <= '1';
        b <= '1';
        wait for 2000000000ns;
        a <= '1';
        b <= '0';
        wait for 2000000000ns;
        a <= '0';
        b <= '1';
        wait for 2000000000ns;
        a <= '0';
        b <= '0';
        wait;
    end process;
    
    
end Behavioral;
