----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/16 17:04:50
-- Design Name: 
-- Module Name: L_change - Behavioral
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

entity L_change is
  Port ( ldata_in  :  in std_logic_vector(31 downto 0);
         ldata_out :  out std_logic_vector(31 downto 0));
end L_change;

architecture Behavioral of L_change is

signal shift_left2  : std_logic_vector(31 downto 0);
signal shift_left10  : std_logic_vector(31 downto 0);
signal shift_left18  : std_logic_vector(31 downto 0);
signal shift_left24  : std_logic_vector(31 downto 0);

begin
 
   shift_left2<=ldata_in(29 downto 0) & ldata_in(31 downto 30); --B<<<2
   shift_left10<=ldata_in(21 downto 0) & ldata_in(31 downto 22); --B<<<10
   shift_left18<=ldata_in(13 downto 0) & ldata_in(31 downto 14); --B<<<18
   shift_left24<=ldata_in(7 downto 0) & ldata_in(31 downto 8); --B<<<24
   
   ldata_out<=ldata_in xor shift_left2 xor shift_left10 xor shift_left18 xor shift_left24;  --L(B)=B xor (B<<<13) xor (B<<<23);

end Behavioral;
