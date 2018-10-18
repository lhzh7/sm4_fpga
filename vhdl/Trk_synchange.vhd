----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/16 10:21:09
-- Design Name: 
-- Module Name: Trk_synchange - Behavioral
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

entity Trk_synchange is
  Port ( trkdata_in     :  in  std_logic_vector(31 downto 0);
         trkdata_out    :  out std_logic_vector(31 downto 0));
end Trk_synchange;

architecture Behavioral of Trk_synchange is

   component Lrk_change is
   Port ( lrkdata_in    :  in  std_logic_vector(31 downto 0);
         lrkdata_out   :  out std_logic_vector(31 downto 0));
   end component;

   component t_change is
   Port ( 
   t_datain   :  in std_logic_vector(31 downto 0);
   t_dataout  : out std_logic_vector(31 downto 0));
   end component;
   
   signal int_Trkvar  : std_logic_vector(31 downto 0);
   
begin

   trk_t_change :t_change
   Port map( 
   t_datain   => trkdata_in,
   t_dataout  => int_Trkvar);


   trk_lrk_change: Lrk_change 
   Port map ( lrkdata_in    =>int_Trkvar,
         lrkdata_out   =>trkdata_out);


end Behavioral;
