----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/16 17:14:57
-- Design Name: 
-- Module Name: T_synchange - Behavioral
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

entity T_synchange is
  Port (tdata_in     :  in  std_logic_vector(31 downto 0);
        tdata_out    :  out std_logic_vector(31 downto 0));
end T_synchange;

architecture Behavioral of T_synchange is

   component L_change is
   Port ( ldata_in    :  in  std_logic_vector(31 downto 0);
         ldata_out   :  out std_logic_vector(31 downto 0));
   end component;

   component t_change is
   Port ( 
   t_datain   :  in std_logic_vector(31 downto 0);
   t_dataout  : out std_logic_vector(31 downto 0));
   end component;

   signal int_Tvar  : std_logic_vector(31 downto 0);
begin

t_t_change:t_change
   Port map( 
      t_datain   => tdata_in,
      t_dataout  => int_Tvar);


t_l_change: L_change 
Port map ( ldata_in    =>int_Tvar,
      ldata_out   =>tdata_out);

end Behavioral;
