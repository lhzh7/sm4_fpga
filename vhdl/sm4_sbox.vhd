----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/11 15:45:51
-- Design Name: sm4
-- Module Name: sm4_sbox - Behavioral
-- Project Name: sm4
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

entity sm4_sbox is
    Port ( sin : in STD_LOGIC_VECTOR (7 downto 0);
           sout : out STD_LOGIC_VECTOR (7 downto 0));
end sm4_sbox;

architecture Behavioral of sm4_sbox is

begin
process(sin)
begin
   case(sin) is
      when x"00" => sout<=x"d6";
      when x"01" => sout<=x"90";
      when x"02" => sout<=x"e9";
      when x"03" => sout<=x"fe";
      when x"04" => sout<=x"cc";
      when x"05" => sout<=x"e1";
      when x"06" => sout<=x"3d";
      when x"07" => sout<=x"b7";      
      when x"08" => sout<=x"16";
      when x"09" => sout<=x"b6";
      when x"0a" => sout<=x"14";
      when x"0b" => sout<=x"c2";
      when x"0c" => sout<=x"28";
      when x"0d" => sout<=x"fb";
      when x"0e" => sout<=x"2c";
      when x"0f" => sout<=x"05";        

      when x"10" => sout<=x"2b";
      when x"11" => sout<=x"67";
      when x"12" => sout<=x"9a";
      when x"13" => sout<=x"76";
      when x"14" => sout<=x"2a";
      when x"15" => sout<=x"be";
      when x"16" => sout<=x"04";
      when x"17" => sout<=x"c3";      
      when x"18" => sout<=x"aa";
      when x"19" => sout<=x"44";
      when x"1a" => sout<=x"13";
      when x"1b" => sout<=x"26";
      when x"1c" => sout<=x"49";
      when x"1d" => sout<=x"86";
      when x"1e" => sout<=x"06";
      when x"1f" => sout<=x"99"; 
      
      when x"20" => sout<=x"9c";
      when x"21" => sout<=x"42";
      when x"22" => sout<=x"50";
      when x"23" => sout<=x"f4";
      when x"24" => sout<=x"91";
      when x"25" => sout<=x"ef";
      when x"26" => sout<=x"98";
      when x"27" => sout<=x"7a";      
      when x"28" => sout<=x"33";
      when x"29" => sout<=x"54";
      when x"2a" => sout<=x"0b";
      when x"2b" => sout<=x"43";
      when x"2c" => sout<=x"ed";
      when x"2d" => sout<=x"cf";
      when x"2e" => sout<=x"ac";
      when x"2f" => sout<=x"62";              
      
      when x"30" => sout<=x"e4";
      when x"31" => sout<=x"b3";
      when x"32" => sout<=x"1c";
      when x"33" => sout<=x"a9";
      when x"34" => sout<=x"c9";
      when x"35" => sout<=x"08";
      when x"36" => sout<=x"e8";
      when x"37" => sout<=x"95";      
      when x"38" => sout<=x"80";
      when x"39" => sout<=x"df";
      when x"3a" => sout<=x"94";
      when x"3b" => sout<=x"fa";
      when x"3c" => sout<=x"75";
      when x"3d" => sout<=x"8f";
      when x"3e" => sout<=x"3f";
      when x"3f" => sout<=x"a6";      
      
      when x"40" => sout<=x"47";
      when x"41" => sout<=x"07";
      when x"42" => sout<=x"a7";
      when x"43" => sout<=x"fc";
      when x"44" => sout<=x"f3";
      when x"45" => sout<=x"73";
      when x"46" => sout<=x"17";
      when x"47" => sout<=x"ba";      
      when x"48" => sout<=x"83";
      when x"49" => sout<=x"59";
      when x"4a" => sout<=x"3c";
      when x"4b" => sout<=x"19";
      when x"4c" => sout<=x"e6";
      when x"4d" => sout<=x"85";
      when x"4e" => sout<=x"4f";
      when x"4f" => sout<=x"a8"; 
      
      when x"50" => sout<=x"68";
      when x"51" => sout<=x"6b";
      when x"52" => sout<=x"81";
      when x"53" => sout<=x"b2";
      when x"54" => sout<=x"71";
      when x"55" => sout<=x"64";
      when x"56" => sout<=x"da";
      when x"57" => sout<=x"8b";      
      when x"58" => sout<=x"f8";
      when x"59" => sout<=x"eb";
      when x"5a" => sout<=x"0f";
      when x"5b" => sout<=x"4b";
      when x"5c" => sout<=x"70";
      when x"5d" => sout<=x"56";
      when x"5e" => sout<=x"9d";
      when x"5f" => sout<=x"35";       

      when x"60" => sout<=x"1e";
      when x"61" => sout<=x"24";
      when x"62" => sout<=x"0e";
      when x"63" => sout<=x"5e";
      when x"64" => sout<=x"63";
      when x"65" => sout<=x"58";
      when x"66" => sout<=x"d1";
      when x"67" => sout<=x"a2";      
      when x"68" => sout<=x"25";
      when x"69" => sout<=x"22";
      when x"6a" => sout<=x"7c";
      when x"6b" => sout<=x"3b";
      when x"6c" => sout<=x"01";
      when x"6d" => sout<=x"21";
      when x"6e" => sout<=x"78";
      when x"6f" => sout<=x"87";  
 
      when x"70" => sout<=x"d4";
      when x"71" => sout<=x"00";
      when x"72" => sout<=x"46";
      when x"73" => sout<=x"57";
      when x"74" => sout<=x"9f";
      when x"75" => sout<=x"d3";
      when x"76" => sout<=x"27";
      when x"77" => sout<=x"52";      
      when x"78" => sout<=x"4c";
      when x"79" => sout<=x"36";
      when x"7a" => sout<=x"02";
      when x"7b" => sout<=x"e7";
      when x"7c" => sout<=x"a0";
      when x"7d" => sout<=x"c4";
      when x"7e" => sout<=x"c8";
      when x"7f" => sout<=x"9e";        

      when x"80" => sout<=x"ea";
      when x"81" => sout<=x"bf";
      when x"82" => sout<=x"8a";
      when x"83" => sout<=x"d2";
      when x"84" => sout<=x"40";
      when x"85" => sout<=x"c7";
      when x"86" => sout<=x"38";
      when x"87" => sout<=x"b5";      
      when x"88" => sout<=x"a3";
      when x"89" => sout<=x"f7";
      when x"8a" => sout<=x"f2";
      when x"8b" => sout<=x"ce";
      when x"8c" => sout<=x"f9";
      when x"8d" => sout<=x"61";
      when x"8e" => sout<=x"15";
      when x"8f" => sout<=x"a1";        

      when x"90" => sout<=x"e0";
      when x"91" => sout<=x"ae";
      when x"92" => sout<=x"5d";
      when x"93" => sout<=x"a4";
      when x"94" => sout<=x"9b";
      when x"95" => sout<=x"34";
      when x"96" => sout<=x"1a";
      when x"97" => sout<=x"55";      
      when x"98" => sout<=x"ad";
      when x"99" => sout<=x"93";
      when x"9a" => sout<=x"32";
      when x"9b" => sout<=x"30";
      when x"9c" => sout<=x"f5";
      when x"9d" => sout<=x"8c";
      when x"9e" => sout<=x"b1";
      when x"9f" => sout<=x"e3"; 
      
      when x"a0" => sout<=x"1d";
      when x"a1" => sout<=x"f6";
      when x"a2" => sout<=x"e2";
      when x"a3" => sout<=x"2e";
      when x"a4" => sout<=x"82";
      when x"a5" => sout<=x"66";
      when x"a6" => sout<=x"ca";
      when x"a7" => sout<=x"60";      
      when x"a8" => sout<=x"c0";
      when x"a9" => sout<=x"29";
      when x"aa" => sout<=x"23";
      when x"ab" => sout<=x"ab";
      when x"ac" => sout<=x"0d";
      when x"ad" => sout<=x"53";
      when x"ae" => sout<=x"4e";
      when x"af" => sout<=x"6f";              
      
      when x"b0" => sout<=x"d5";
      when x"b1" => sout<=x"db";
      when x"b2" => sout<=x"37";
      when x"b3" => sout<=x"45";
      when x"b4" => sout<=x"de";
      when x"b5" => sout<=x"fd";
      when x"b6" => sout<=x"8e";
      when x"b7" => sout<=x"2f";      
      when x"b8" => sout<=x"03";
      when x"b9" => sout<=x"ff";
      when x"ba" => sout<=x"6a";
      when x"bb" => sout<=x"72";
      when x"bc" => sout<=x"6d";
      when x"bd" => sout<=x"6c";
      when x"be" => sout<=x"5b";
      when x"bf" => sout<=x"51";      
      
      when x"c0" => sout<=x"8d";
      when x"c1" => sout<=x"1b";
      when x"c2" => sout<=x"af";
      when x"c3" => sout<=x"92";
      when x"c4" => sout<=x"bb";
      when x"c5" => sout<=x"dd";
      when x"c6" => sout<=x"bc";
      when x"c7" => sout<=x"7f";      
      when x"c8" => sout<=x"11";
      when x"c9" => sout<=x"d9";
      when x"ca" => sout<=x"5c";
      when x"cb" => sout<=x"41";
      when x"cc" => sout<=x"1f";
      when x"cd" => sout<=x"10";
      when x"ce" => sout<=x"5a";
      when x"cf" => sout<=x"d8"; 
      
      when x"d0" => sout<=x"0a";
      when x"d1" => sout<=x"c1";
      when x"d2" => sout<=x"31";
      when x"d3" => sout<=x"88";
      when x"d4" => sout<=x"a5";
      when x"d5" => sout<=x"cd";
      when x"d6" => sout<=x"7b";
      when x"d7" => sout<=x"bd";      
      when x"d8" => sout<=x"2d";
      when x"d9" => sout<=x"74";
      when x"da" => sout<=x"d0";
      when x"db" => sout<=x"12";
      when x"dc" => sout<=x"b8";
      when x"dd" => sout<=x"e5";
      when x"de" => sout<=x"b4";
      when x"df" => sout<=x"b0";       

      when x"e0" => sout<=x"89";
      when x"e1" => sout<=x"69";
      when x"e2" => sout<=x"97";
      when x"e3" => sout<=x"4a";
      when x"e4" => sout<=x"0c";
      when x"e5" => sout<=x"96";
      when x"e6" => sout<=x"77";
      when x"e7" => sout<=x"7e";      
      when x"e8" => sout<=x"65";
      when x"e9" => sout<=x"b9";
      when x"ea" => sout<=x"f1";
      when x"eb" => sout<=x"09";
      when x"ec" => sout<=x"c5";
      when x"ed" => sout<=x"6e";
      when x"ee" => sout<=x"c6";
      when x"ef" => sout<=x"84";  
 
      when x"f0" => sout<=x"18";
      when x"f1" => sout<=x"f0";
      when x"f2" => sout<=x"7d";
      when x"f3" => sout<=x"ec";
      when x"f4" => sout<=x"3a";
      when x"f5" => sout<=x"dc";
      when x"f6" => sout<=x"4d";
      when x"f7" => sout<=x"20";      
      when x"f8" => sout<=x"79";
      when x"f9" => sout<=x"ee";
      when x"fa" => sout<=x"5f";
      when x"fb" => sout<=x"3e";
      when x"fc" => sout<=x"d7";
      when x"fd" => sout<=x"cb";
      when x"fe" => sout<=x"39";
      when x"ff" => sout<=x"48";
      when others => sout<=x"00";
      end case;
   end process;   
      
end Behavioral;
