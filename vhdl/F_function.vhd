----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/16 17:31:17
-- Design Name: 
-- Module Name: F_function - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity F_function is
    Port (
       F_begin  :  in std_logic;
       F_opcode :  in std_logic;
       F_clk    :  in std_logic;
       Fdata_in0 : in std_logic_vector(31 downto 0);
       Fdata_in1 : in std_logic_vector(31 downto 0);
       Fdata_in2 : in std_logic_vector(31 downto 0);
       Fdata_in3 : in std_logic_vector(31 downto 0);
       rk1 : in std_logic_vector(31 downto 0);
       rk2 : in std_logic_vector(31 downto 0);
       count_in : in std_logic_vector(5 downto 0);
       count_out : out std_logic_vector(5 downto 0);
       Fdata_out0 : out std_logic_vector(31 downto 0);
       Fdata_out1 : out std_logic_vector(31 downto 0);
       Fdata_out2 : out std_logic_vector(31 downto 0);
       Fdata_out3 : out std_logic_vector(31 downto 0));
end F_function;

architecture Behavioral of F_function is

  component T_synchange is
  Port (tdata_in     :  in  std_logic_vector(31 downto 0);
        tdata_out    :  out std_logic_vector(31 downto 0));
end component;

   signal int_Fvar1,int_Fvar2  : std_logic_vector(31 downto 0);
   
   signal endata_in : std_logic_vector(31 downto 0);
   signal dedata_in : std_logic_vector(31 downto 0);
   signal Fdata_in : std_logic_vector(31 downto 0);
   
begin
   
   endata_in<=Fdata_in1 xor Fdata_in2 xor Fdata_in3 xor rk1;
   dedata_in<=Fdata_in1 xor Fdata_in2 xor Fdata_in3 xor rk2;
   
   Fdata_in<=endata_in when F_opcode='1' else dedata_in;
   int_Fvar1<=Fdata_in when F_begin='1' else (others=>'Z');
   
F_T_synchange:   T_synchange port map
   (tdata_in => int_Fvar1,
    tdata_out => int_Fvar2);  
    
    process (F_clk)
    begin
       if rising_edge(F_clk) then
            if(F_begin='1') then
                Fdata_out0<=Fdata_in1;     
                Fdata_out1<=Fdata_in2;     
                Fdata_out2<=Fdata_in3;     
                Fdata_out3<=int_Fvar2 xor Fdata_in0; 
                count_out<=count_in+'1';  
            else
               
                Fdata_out0<=(others=>'Z');     
                Fdata_out1<=(others=>'Z');     
                Fdata_out2<=(others=>'Z');     
                Fdata_out3<=(others=>'Z');
                count_out<=(others=>'0');
            end if;
         end if;
      end process;

end Behavioral;
