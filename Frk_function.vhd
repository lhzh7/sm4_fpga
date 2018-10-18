----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/16 10:31:59
-- Design Name: 
-- Module Name: Frk_function - Behavioral
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

entity Frk_function is
  Port ( 
        Frkdata_in0 : in std_logic_vector(31 downto 0);
        Frkdata_in1 : in std_logic_vector(31 downto 0);
        Frkdata_in2 : in std_logic_vector(31 downto 0);
        Frkdata_in3 : in std_logic_vector(31 downto 0);
        ck  :  in std_logic_vector(31 downto 0);
        Frkdata_out : out std_logic_vector(31 downto 0));
end Frk_function;

architecture Behavioral of Frk_function is
component Trk_synchange is
  Port ( trkdata_in     :  in  std_logic_vector(31 downto 0);
         trkdata_out    :  out std_logic_vector(31 downto 0));
end component;

signal  int_Frkvar1,int_Frkvar2 : std_logic_vector(31 downto 0);

begin

 int_Frkvar1<=Frkdata_in1 xor Frkdata_in2 xor Frkdata_in3 xor ck;    
 Frk_Trk_synchange :Trk_synchange
   port map
    (trkdata_in => int_Frkvar1,
    trkdata_out => int_Frkvar2);   
    
 Frkdata_out<=int_Frkvar2 xor Frkdata_in0;   
   
end Behavioral;
