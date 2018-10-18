----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/16 09:51:56
-- Design Name: 
-- Module Name: Lrk_change - Behavioral
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

entity Lrk_change is
  Port ( lrkdata_in    :  in  std_logic_vector(31 downto 0);
         lrkdata_out   :  out std_logic_vector(31 downto 0));
end Lrk_change;

architecture Behavioral of Lrk_change is

signal shift_left13  : std_logic_vector(31 downto 0);
signal shift_left23  : std_logic_vector(31 downto 0);

begin

   shift_left13<=lrkdata_in(18 downto 0) & lrkdata_in(31 downto 19); --B<<<13
   shift_left23<=lrkdata_in(8 downto 0) & lrkdata_in(31 downto 9); --B<<<23
   
   lrkdata_out<=lrkdata_in xor shift_left13 xor shift_left23;  --L(B)=B xor (B<<<13) xor (B<<<23);

end Behavioral;
