----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/16 11:09:01
-- Design Name: 
-- Module Name: rk_top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rk_top is
  Port ( 
     rk_top_clk  :  in std_logic;
     rk_top_rst  :  in std_logic;
     rk_top_begin : in std_logic;
     MK_in  : in std_logic_vector(127 downto 0);
     last   : in std_logic;
     handshake : in std_logic;

     rk  : out std_logic_vector(31 downto 0);
     rk_top_addr : out std_logic_vector(4 downto 0);
     rk_top_en : out std_logic;
     rk_top_complete : out std_logic );
end rk_top;

architecture Behavioral of rk_top is

component Frk_function is
  Port ( 
        Frkdata_in0 : in std_logic_vector(31 downto 0);
        Frkdata_in1 : in std_logic_vector(31 downto 0);
        Frkdata_in2 : in std_logic_vector(31 downto 0);
        Frkdata_in3 : in std_logic_vector(31 downto 0);
        ck  :  in std_logic_vector(31 downto 0);
        Frkdata_out : out std_logic_vector(31 downto 0));
end component;
   signal currentstate,nextstate   : std_logic_vector(5 downto 0);    
   signal keyin1,keyin2,keyin3,keyin4,ck : std_logic_vector(31 downto 0) :=(others=>'0');

   signal rkvar : std_logic_vector(31 downto 0);
   
   constant  idle  : std_logic_vector(5 downto 0) :="000000";
   constant  ready : std_logic_vector(5 downto 0) :="000001";
   constant  init : std_logic_vector(5 downto 0) :="000010";
   constant  getrk1 : std_logic_vector(5 downto 0) :="000011";           
   constant  getrk2 : std_logic_vector(5 downto 0) :="000100";   
   constant  getrk3 : std_logic_vector(5 downto 0) :="000101";   
   constant  getrk4 : std_logic_vector(5 downto 0) :="000110";   
   constant  getrk5 : std_logic_vector(5 downto 0) :="000111";   
   constant  getrk6 : std_logic_vector(5 downto 0) :="001000";   
   constant  getrk7 : std_logic_vector(5 downto 0) :="001001";   
   constant  getrk8 : std_logic_vector(5 downto 0) :="001010";   
   constant  getrk9 : std_logic_vector(5 downto 0) :="001011";   
   constant  getrk10 : std_logic_vector(5 downto 0) :="001100";   
   constant  getrk11 : std_logic_vector(5 downto 0) :="001101";   
   constant  getrk12 : std_logic_vector(5 downto 0) :="001110";   
   constant  getrk13 : std_logic_vector(5 downto 0) :="001111";   
   constant  getrk14 : std_logic_vector(5 downto 0) :="010000";
   constant  getrk15 : std_logic_vector(5 downto 0) :="010001";   
   constant  getrk16 : std_logic_vector(5 downto 0) :="010010";   
   constant  getrk17 : std_logic_vector(5 downto 0) :="010011";   
   constant  getrk18 : std_logic_vector(5 downto 0) :="010100";   
   constant  getrk19 : std_logic_vector(5 downto 0) :="010101";   
   constant  getrk20 : std_logic_vector(5 downto 0) :="010110";   
   constant  getrk21 : std_logic_vector(5 downto 0) :="010111";   
   constant  getrk22 : std_logic_vector(5 downto 0) :="011000";   
   constant  getrk23 : std_logic_vector(5 downto 0) :="011001";   
   constant  getrk24 : std_logic_vector(5 downto 0) :="011010";   
   constant  getrk25 : std_logic_vector(5 downto 0) :="011011"; 
   constant  getrk26 : std_logic_vector(5 downto 0) :="011100"; 
   constant  getrk27 : std_logic_vector(5 downto 0) :="011101"; 
   constant  getrk28 : std_logic_vector(5 downto 0) :="011110"; 
   constant  getrk29 : std_logic_vector(5 downto 0) :="011111"; 
   constant  getrk30 : std_logic_vector(5 downto 0) :="100000";    
   constant  getrk31 : std_logic_vector(5 downto 0) :="100001"; 
   constant  getrk32 : std_logic_vector(5 downto 0) :="100010"; 
   constant  complete : std_logic_vector(5 downto 0) :="100011"; 

   constant FK0 : std_logic_vector(31 downto 0):=x"A3B1BAC6";
   constant FK1 : std_logic_vector(31 downto 0):=x"56AA3350";
   constant FK2 : std_logic_vector(31 downto 0):=x"677D9197";
   constant FK3 : std_logic_vector(31 downto 0):=x"b27022dc";
   
   constant CK0 : std_logic_vector(31 downto 0):=x"00070e15";
   constant CK1 : std_logic_vector(31 downto 0):=x"1c232a31";
   constant CK2 : std_logic_vector(31 downto 0):=x"383f464d";
   constant CK3 : std_logic_vector(31 downto 0):=x"545b6269";
   constant CK4 : std_logic_vector(31 downto 0):=x"70777e85";
   constant CK5 : std_logic_vector(31 downto 0):=x"8c939aa1";
   constant CK6 : std_logic_vector(31 downto 0):=x"a8afb6bd";
   constant CK7 : std_logic_vector(31 downto 0):=x"c4cbd2d9";
   constant CK8 : std_logic_vector(31 downto 0):=x"e0e7eef5";
   constant CK9 : std_logic_vector(31 downto 0):=x"fc030a11";
   constant CK10 : std_logic_vector(31 downto 0):=x"181f262d";
   constant CK11 : std_logic_vector(31 downto 0):=x"343b4249";
   constant CK12 : std_logic_vector(31 downto 0):=x"50575e65";
   constant CK13 : std_logic_vector(31 downto 0):=x"6c737a81";
   constant CK14 : std_logic_vector(31 downto 0):=x"888f969d";
   constant CK15 : std_logic_vector(31 downto 0):=x"a4abb2b9";
   constant CK16 : std_logic_vector(31 downto 0):=x"c0c7ced5";
   constant CK17 : std_logic_vector(31 downto 0):=x"dce3eaf1";
   constant CK18 : std_logic_vector(31 downto 0):=x"f8ff060d";
   constant CK19 : std_logic_vector(31 downto 0):=x"141b2229";
   constant CK20 : std_logic_vector(31 downto 0):=x"30373e45";
   constant CK21 : std_logic_vector(31 downto 0):=x"4c535a61";
   constant CK22 : std_logic_vector(31 downto 0):=x"686f767d";
   constant CK23 : std_logic_vector(31 downto 0):=x"848b9299";
   constant CK24 : std_logic_vector(31 downto 0):=x"a0a7aeb5";
   constant CK25 : std_logic_vector(31 downto 0):=x"bcc3cad1";
   constant CK26 : std_logic_vector(31 downto 0):=x"d8dfe6ed";
   constant CK27 : std_logic_vector(31 downto 0):=x"f4fb0209";
   constant CK28 : std_logic_vector(31 downto 0):=x"10171e25";
   constant CK29 : std_logic_vector(31 downto 0):=x"2c333a41";
   constant CK30 : std_logic_vector(31 downto 0):=x"484f565d";
   constant CK31 : std_logic_vector(31 downto 0):=x"646b7279"; 
             
begin
          
   process(rk_top_clk)
   begin
      if rising_edge(rk_top_clk) then
         if rk_top_rst='0' or last='1' then
            currentstate<=idle;
         else
            currentstate<=nextstate;
         end if;
      end if;
   end process;
   
   process (currentstate,rk_top_begin,handshake)
   begin
      case(currentstate) is
         when idle=>
            if(rk_top_begin='1' and handshake='1') then
               nextstate<=ready;
            else
               nextstate<=idle;                      
            end if;
            
         when ready=>                               
            if(rk_top_begin='1' and handshake='1') then
               nextstate<=init;
            else
               nextstate<=idle;
            end if;
         when init=>                                
                  nextstate<=getrk1;
         when getrk1=>
                  nextstate<=getrk2;             
         when getrk2=>
                  nextstate<=getrk3;
         when getrk3=>
                  nextstate<=getrk4;
         when getrk4=>
                  nextstate<=getrk5;
         when getrk5=>
                  nextstate<=getrk6;
         when getrk6=>
                  nextstate<=getrk7;
         when getrk7=>
                  nextstate<=getrk8;
         when getrk8=>
                  nextstate<=getrk9;
         when getrk9=>
                  nextstate<=getrk10;
         when getrk10=>
                  nextstate<=getrk11;
         when getrk11=>
                  nextstate<=getrk12;     
         when getrk12=>
                  nextstate<=getrk13;
         when getrk13=>
                  nextstate<=getrk14;
         when getrk14=>
                  nextstate<=getrk15;
         when getrk15=>
                  nextstate<=getrk16;
         when getrk16=>
                  nextstate<=getrk17;
         when getrk17=>
                  nextstate<=getrk18;
         when getrk18=>
                  nextstate<=getrk19;
         when getrk19=>
                  nextstate<=getrk20;
         when getrk20=>
                  nextstate<=getrk21;
         when getrk21=>
                  nextstate<=getrk22;     
         when getrk22=>
                  nextstate<=getrk23;
         when getrk23=>
                  nextstate<=getrk24;
         when getrk24=>
                  nextstate<=getrk25;
         when getrk25=>
                  nextstate<=getrk26;
         when getrk26=>
                  nextstate<=getrk27;
         when getrk27=>
                  nextstate<=getrk28;
         when getrk28=>
                  nextstate<=getrk29;
         when getrk29=>
                  nextstate<=getrk30;
         when getrk30=>
                  nextstate<=getrk31;
         when getrk31=>
                  nextstate<=getrk32;
         when getrk32=>
                  nextstate<=complete;
         when complete=>
                  nextstate<=idle;
         when others=>
                  nextstate<=idle;
      end case;
   end process;
   
   process(rk_top_clk)
   begin
      if rising_edge(rk_top_clk) then
          case(nextstate) is
             when idle=>                                             
                        rk<=(others=>'Z'); 
                        if last ='1' then 
                           rk_top_complete<='0';
                        end if;
                
             when ready=>                                                             
                         rk_top_en<='0';
                         rk_top_addr<="00000";
                         rk<=(others=>'Z'); 
                         keyin1<=MK_in(127 downto 96);
                         keyin2<=MK_in(95 downto 64);
                         keyin3<=MK_in(63 downto 32);  
                         keyin4<=MK_in(31 downto 0);
                      
             when init=>                                            
                         ck<=CK0;
                         rk_top_complete<='0';
                         keyin1<=keyin1 xor FK0;
                         keyin2<=keyin2 xor FK1;
                         keyin3<=keyin3 xor FK2;   
                         keyin4<=keyin4 xor FK3;
                 
             when getrk1=>                                         
                         rk_top_en<='1';
                         rk<=rkvar;
                         ck<=CK1;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                 
              when  getrk2=>                                       
                         rk_top_addr<="00001";
                         rk<=rkvar;
                         ck<=CK2;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
    
              when  getrk3=>   
                         rk_top_addr<="00010";
                         rk<=rkvar;
                         ck<=CK3;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
              when  getrk4=> 
                         rk_top_addr<="00011";
                         rk<=rkvar;
                         ck<=CK4;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                     
              when  getrk5=>
                         rk_top_addr<="00100";
                         rk<=rkvar;
                         ck<=CK5;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk6=>
                         rk_top_addr<="00101";
                         rk<=rkvar;
                         ck<=CK6;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
               when  getrk7=>
                      
                         rk_top_addr<="00110";
                         rk<=rkvar;
                         ck<=CK7;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk8 =>
                      
                         rk_top_addr<="00111";
                         rk<=rkvar;
                         ck<=CK8;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk9 =>
                      
                         rk_top_addr<="01000";
                         rk<=rkvar;
                         ck<=CK9;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk10 =>
                      
                         rk_top_addr<="01001";
                         rk<=rkvar;
                         ck<=CK10;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk11 =>
                      
                         rk_top_addr<="01010";
                         rk<=rkvar;
                         ck<=CK11;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                           
                when getrk12 =>
                      
                         rk_top_addr<="01011";
                         rk<=rkvar;
                         ck<=CK12;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk13 =>
                      
                         rk_top_addr<="01100";
                         rk<=rkvar;
                         ck<=CK13;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk14 =>
                      
                         rk_top_addr<="01101";
                         rk<=rkvar;
                         ck<=CK14;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk15 =>
                      
                         rk_top_addr<="01110";
                         rk<=rkvar;
                         ck<=CK15;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk16 =>
                      
                         rk_top_addr<="01111";
                         rk<=rkvar;
                         ck<=CK16;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk17 =>
                      
                         rk_top_addr<="10000";
                         rk<=rkvar;
                         ck<=CK17;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk18 =>
                      
                         rk_top_addr<="10001";
                         rk<=rkvar;
                         ck<=CK18;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk19 =>
                      
                         rk_top_addr<="10010";
                         rk<=rkvar;
                         ck<=CK19;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk20 =>
                      
                         rk_top_addr<="10011";
                         rk<=rkvar;
                         ck<=CK20;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk21 =>
                      
                         rk_top_addr<="10100";
                         rk<=rkvar;
                         ck<=CK21;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                           
                when getrk22 =>
                      
                         rk_top_addr<="10101";
                         rk<=rkvar;
                         ck<=CK22;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk23 =>
                      
                         rk_top_addr<="10110";
                         rk<=rkvar;
                         ck<=CK23;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk24 =>
                      
                         rk_top_addr<="10111";
                         rk<=rkvar;
                         ck<=CK24;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk25 =>
                      
                         rk_top_addr<="11000";
                         rk<=rkvar;
                         ck<=CK25;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk26 =>
                      
                         rk_top_addr<="11001";
                         rk<=rkvar;
                         ck<=CK26;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk27 =>
                      
                         rk_top_addr<="11010";
                         rk<=rkvar;
                         ck<=CK27;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk28 =>
                      
                         rk_top_addr<="11011";
                         rk<=rkvar;
                         ck<=CK28;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk29 =>
                      
                         rk_top_addr<="11100";
                         rk<=rkvar;
                         ck<=CK29;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk30 =>
                      
                         rk_top_addr<="11101";
                         rk<=rkvar;
                         ck<=CK30;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk31 =>
                      
                         rk_top_addr<="11110";
                         rk<=rkvar;
                         ck<=CK31;
                         keyin1<=keyin2;
                         keyin2<=keyin3;
                         keyin3<=keyin4;
                         keyin4<=rkvar;
                      
                when getrk32 =>
                      
                         rk_top_addr<="11111";
                         rk<=rkvar;
                      
                when complete =>
                      
                         rk_top_en<='0';
                         rk_top_complete<='1';               
                      
                 when others =>
                      
                         rk_top_complete<='0';
                         rk_top_en<='0';
                         rk_top_addr<="00000";
                         rk<=(others=>'Z'); 
                      
             end case;
          end if;
      end process;
      
    Frk_rk_top:  Frk_function port map
      (Frkdata_in0 => keyin1,
      Frkdata_in1 => keyin2,
      Frkdata_in2 => keyin3,
      Frkdata_in3 => keyin4,
     ck => ck,
     Frkdata_out => rkvar);             
   
end Behavioral;
