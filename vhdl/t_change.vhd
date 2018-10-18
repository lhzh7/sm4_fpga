----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/16 10:13:30
-- Design Name: 
-- Module Name: t_change - Behavioral
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

entity t_change is
  Port ( 
  t_datain   :  in std_logic_vector(31 downto 0);
  t_dataout  : out std_logic_vector(31 downto 0)
  );
end t_change;

architecture Behavioral of t_change is

   component sm4_sbox is
    Port ( sin : in STD_LOGIC_VECTOR (7 downto 0);
           sout : out STD_LOGIC_VECTOR (7 downto 0));
   end component;

begin

  t_sbox0:sm4_sbox port map
  (
  sin => t_datain(31 downto 24),
  sout => t_dataout(31 downto 24)
  );

  
    t_sbox1:sm4_sbox port map
  (
  sin => t_datain(23 downto 16),
  sout => t_dataout(23 downto 16)
  );
  
    t_sbox2:sm4_sbox port map
  (
  sin => t_datain(15 downto 8),
  sout => t_dataout(15 downto 8)
  );
  
    t_sbox3:sm4_sbox port map
  (
  sin => t_datain(7 downto 0),
  sout => t_dataout(7 downto 0)
  );
end Behavioral;
