----------------------------------------------------------------------------------
-- Company: Beijing Raycores Technology Co.,Ltd
-- Engineer: Liu Huizhong
-- 
-- Create Date: 2018/10/17 10:04:34
-- Design Name: sm4 encrypt and decrypt
-- Module Name: top - Behavioral
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

entity top is
  Port ( 
     top_clk   : in std_logic;
     top_rst   : in std_logic;
     last      : in std_logic;
     handshake : in std_logic;  
     top_opcode : in std_logic_vector(1 downto 0);           --00 key in  01 encypt 11 decrypt
     top_datain : in std_logic_vector(127 downto 0);
     key        : in std_logic_vector(127 downto 0);    
 
     top_rk_complete : out std_logic;
     top_data_complete : out std_logic;
     top_dataout : out std_logic_vector(127 downto 0));
end top;

architecture Behavioral of top is

   component rk_top is
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
    end component;
    
    component F_function is
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
    end component;

   signal top_keybegin,top_databegin,top_en,SM4_opcode : std_logic;
   signal top_keyaddr : std_logic_vector(4 downto 0);
   signal top_rk,x1,x2,x3,x4 : std_logic_vector(31 downto 0);                       
   signal count1,count2,count3,count4,count5,count6,count7,count8,count9,
             count10,count11,count12,count13,count14,count15,count16,count17,count18,count19,
             count20,count21,count22,count23,count24,count25,count26,count27,count28,count29,
             count30,count31,count32 : std_logic_vector(5 downto 0);  
   signal   top_out0,top_out1,top_out2,top_out3,top_out4,top_out5,top_out6,top_out7,top_out8,
            top_out9,top_out10,top_out11,top_out12,top_out13,top_out14,top_out15,top_out16,
            top_out17,top_out18,top_out19,top_out20,top_out21,top_out22,top_out23,top_out24,
            top_out25,top_out26,top_out27,top_out28,top_out29,top_out30,top_out31,top_out32,
            top_out33,top_out34,top_out35,top_out36,top_out37,top_out38,top_out39,top_out40,
            top_out41,top_out42,top_out43,top_out44,top_out45,top_out46,top_out47,top_out48,
            top_out49,top_out50,top_out51,top_out52,top_out53,top_out54,top_out55,top_out56,
            top_out57,top_out58,top_out59,top_out60,top_out61,top_out62,top_out63,top_out64,
            top_out65,top_out66,top_out67,top_out68,top_out69,top_out70,top_out71,top_out72,
            top_out73,top_out74,top_out75,top_out76,top_out77,top_out78,top_out79,top_out80,
            top_out81,top_out82,top_out83,top_out84,top_out85,top_out86,top_out87,top_out88,
            top_out89,top_out90,top_out91,top_out92,top_out93,top_out94,top_out95,top_out96,
            top_out97,top_out98,top_out99,top_out100,top_out101,top_out102,top_out103,
            top_out104,top_out105,top_out106,top_out107,top_out108,top_out109,top_out110,
            top_out111,top_out112,top_out113,top_out114,top_out115,top_out116,top_out117,
            top_out118,top_out119,top_out120,top_out121,top_out122,top_out123,top_out124,
            top_out125,top_out126,top_out127 : std_logic_vector(31 downto 0);   
            
  signal  rk0,rk1,rk2,rk3,rk4,rk5,rk6,rk7,rk8,rk9,
          rk10,rk11,rk12,rk13,rk14,rk15,rk16,rk17,rk18,rk19,
          rk20,rk21,rk22,rk23,rk24,rk25,rk26,rk27,rk28,rk29,
          rk30,rk31 : std_logic_vector(31 downto 0);   
          
  signal count0  : std_logic_vector(5 downto 0);
                

begin
   
top_ck_top:   rk_top  port map
  (rk_top_clk => top_clk,
   rk_top_rst => top_rst,
   rk_top_begin => top_keybegin,
   MK_in => key,
   last => last,
   handshake => handshake,
   rk => top_rk ,
   rk_top_addr => top_keyaddr,
   rk_top_en => top_en,
   rk_top_complete => top_rk_complete);
   
   process (top_clk) 
   begin
      if rising_edge(top_clk) then             
         if(top_en='1') then
                case(top_keyaddr) is
                   when "00000" => rk0<=top_rk;
                   when "00001" => rk1<=top_rk;
                   when "00010" => rk2<=top_rk;
                   when "00011" => rk3<=top_rk;
                   when "00100" => rk4<=top_rk;
                   when "00101" => rk5<=top_rk;
                   when "00110" => rk6<=top_rk;
                   when "00111" => rk7<=top_rk;
                   when "01000" => rk8<=top_rk;
                   when "01001" => rk9<=top_rk;
                   when "01010" => rk10<=top_rk;
                   when "01011" => rk11<=top_rk;
                   when "01100" => rk12<=top_rk;
                   when "01101" => rk13<=top_rk;
                   when "01110" => rk14<=top_rk;
                   when "01111" => rk15<=top_rk;
                   when "10000" => rk16<=top_rk;
                   when "10001" => rk17<=top_rk;
                   when "10010" => rk18<=top_rk;
                   when "10011" => rk19<=top_rk;
                   when "10100" => rk20<=top_rk;
                   when "10101" => rk21<=top_rk;
                   when "10110" => rk22<=top_rk;
                   when "10111" => rk23<=top_rk;
                   when "11000" => rk24<=top_rk;
                   when "11001" => rk25<=top_rk;
                   when "11010" => rk26<=top_rk;
                   when "11011" => rk27<=top_rk;
                   when "11100" => rk28<=top_rk;
                   when "11101" => rk29<=top_rk;
                   when "11110" => rk30<=top_rk;
                   when "11111" => rk31<=top_rk;
                   when others=> null;
               end case;
            end if;
         end if;
     end process;
     
      x1<=top_datain(127 downto 96);
      x2<=top_datain(95 downto 64);
      x3<=top_datain(63 downto 32);   
      x4<=top_datain(31 downto 0);  
      
      top_keybegin <='1' when top_opcode="00" else '0';
      top_databegin <='1' when top_opcode="01" or top_opcode="11" else '0';
      SM4_opcode <='1' when top_opcode="01" else '0';

F_function0:F_function port map 
     (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
     Fdata_in0=>x1,Fdata_in1=>x2,Fdata_in2=>x3,Fdata_in3=>x4,
     rk1=>rk0,rk2=>rk31,count_in=>count0,count_out=>count1,
     Fdata_out0=>top_out0,Fdata_out1=>top_out1,Fdata_out2=>top_out2,Fdata_out3=>top_out3);  
     
F_function1:F_function port map 
      (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
      Fdata_in0=>top_out0,Fdata_in1=>top_out1,Fdata_in2=>top_out2,Fdata_in3=>top_out3,
      rk1=>rk1,rk2=>rk30,count_in=>count1,count_out=>count2,
      Fdata_out0=>top_out4,Fdata_out1=>top_out5,Fdata_out2=>top_out6,Fdata_out3=>top_out7); 
          
F_function2:F_function port map 
    (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
    Fdata_in0=>top_out4,Fdata_in1=>top_out5,Fdata_in2=>top_out6,Fdata_in3=>top_out7,
    rk1=>rk2,rk2=>rk29,count_in=>count2,count_out=>count3,
    Fdata_out0=>top_out8,Fdata_out1=>top_out9,Fdata_out2=>top_out10,Fdata_out3=>top_out11); 

F_function3:F_function port map 
    (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
    Fdata_in0=>top_out8,Fdata_in1=>top_out9,Fdata_in2=>top_out10,Fdata_in3=>top_out11,
    rk1=>rk3,rk2=>rk28,count_in=>count3,count_out=>count4,
    Fdata_out0=>top_out12,Fdata_out1=>top_out13,Fdata_out2=>top_out14,Fdata_out3=>top_out15); 
    
F_function4:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out12,Fdata_in1=>top_out13,Fdata_in2=>top_out14,Fdata_in3=>top_out15,
        rk1=>rk4,rk2=>rk27,count_in=>count4,count_out=>count5,
        Fdata_out0=>top_out16,Fdata_out1=>top_out17,Fdata_out2=>top_out18,Fdata_out3=>top_out19); 
        
F_function5:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out16,Fdata_in1=>top_out17,Fdata_in2=>top_out18,Fdata_in3=>top_out19,
        rk1=>rk5,rk2=>rk26,count_in=>count5,count_out=>count6,
        Fdata_out0=>top_out20,Fdata_out1=>top_out21,Fdata_out2=>top_out22,Fdata_out3=>top_out23);         
        
F_function6:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out20,Fdata_in1=>top_out21,Fdata_in2=>top_out22,Fdata_in3=>top_out23,
        rk1=>rk6,rk2=>rk25,count_in=>count6,count_out=>count7,
        Fdata_out0=>top_out24,Fdata_out1=>top_out25,Fdata_out2=>top_out26,Fdata_out3=>top_out27);          
        
F_function7:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out24,Fdata_in1=>top_out25,Fdata_in2=>top_out26,Fdata_in3=>top_out27,
        rk1=>rk7,rk2=>rk24,count_in=>count7,count_out=>count8,
        Fdata_out0=>top_out28,Fdata_out1=>top_out29,Fdata_out2=>top_out30,Fdata_out3=>top_out31);          
        
F_function8:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out28,Fdata_in1=>top_out29,Fdata_in2=>top_out30,Fdata_in3=>top_out31,
        rk1=>rk8,rk2=>rk23,count_in=>count8,count_out=>count9,
        Fdata_out0=>top_out32,Fdata_out1=>top_out33,Fdata_out2=>top_out34,Fdata_out3=>top_out35);         
        
F_function9:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out32,Fdata_in1=>top_out33,Fdata_in2=>top_out34,Fdata_in3=>top_out35,
        rk1=>rk9,rk2=>rk22,count_in=>count9,count_out=>count10,
        Fdata_out0=>top_out36,Fdata_out1=>top_out37,Fdata_out2=>top_out38,Fdata_out3=>top_out39);          
        
F_function10:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out36,Fdata_in1=>top_out37,Fdata_in2=>top_out38,Fdata_in3=>top_out39,
        rk1=>rk10,rk2=>rk21,count_in=>count10,count_out=>count11,
        Fdata_out0=>top_out40,Fdata_out1=>top_out41,Fdata_out2=>top_out42,Fdata_out3=>top_out43);        
        
F_function11:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out40,Fdata_in1=>top_out41,Fdata_in2=>top_out42,Fdata_in3=>top_out43,
        rk1=>rk11,rk2=>rk20,count_in=>count11,count_out=>count12,
        Fdata_out0=>top_out44,Fdata_out1=>top_out45,Fdata_out2=>top_out46,Fdata_out3=>top_out47);

F_function12:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out44,Fdata_in1=>top_out45,Fdata_in2=>top_out46,Fdata_in3=>top_out47,
        rk1=>rk12,rk2=>rk19,count_in=>count12,count_out=>count13,
        Fdata_out0=>top_out48,Fdata_out1=>top_out49,Fdata_out2=>top_out50,Fdata_out3=>top_out51);

F_function13:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out48,Fdata_in1=>top_out49,Fdata_in2=>top_out50,Fdata_in3=>top_out51,
        rk1=>rk13,rk2=>rk18,count_in=>count13,count_out=>count14,
        Fdata_out0=>top_out52,Fdata_out1=>top_out53,Fdata_out2=>top_out54,Fdata_out3=>top_out55);

F_function14:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out52,Fdata_in1=>top_out53,Fdata_in2=>top_out54,Fdata_in3=>top_out55,
        rk1=>rk14,rk2=>rk17,count_in=>count14,count_out=>count15,
        Fdata_out0=>top_out56,Fdata_out1=>top_out57,Fdata_out2=>top_out58,Fdata_out3=>top_out59);

F_function15:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out56,Fdata_in1=>top_out57,Fdata_in2=>top_out58,Fdata_in3=>top_out59,
        rk1=>rk15,rk2=>rk16,count_in=>count15,count_out=>count16,
        Fdata_out0=>top_out60,Fdata_out1=>top_out61,Fdata_out2=>top_out62,Fdata_out3=>top_out63);

F_function16:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out60,Fdata_in1=>top_out61,Fdata_in2=>top_out62,Fdata_in3=>top_out63,
        rk1=>rk16,rk2=>rk15,count_in=>count16,count_out=>count17,
        Fdata_out0=>top_out64,Fdata_out1=>top_out65,Fdata_out2=>top_out66,Fdata_out3=>top_out67);

F_function17:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out64,Fdata_in1=>top_out65,Fdata_in2=>top_out66,Fdata_in3=>top_out67,
        rk1=>rk17,rk2=>rk14,count_in=>count17,count_out=>count18,
        Fdata_out0=>top_out68,Fdata_out1=>top_out69,Fdata_out2=>top_out70,Fdata_out3=>top_out71);

F_function18:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out68,Fdata_in1=>top_out69,Fdata_in2=>top_out70,Fdata_in3=>top_out71,
        rk1=>rk18,rk2=>rk13,count_in=>count18,count_out=>count19,
        Fdata_out0=>top_out72,Fdata_out1=>top_out73,Fdata_out2=>top_out74,Fdata_out3=>top_out75);

F_function19:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out72,Fdata_in1=>top_out73,Fdata_in2=>top_out74,Fdata_in3=>top_out75,
        rk1=>rk19,rk2=>rk12,count_in=>count19,count_out=>count20,
        Fdata_out0=>top_out76,Fdata_out1=>top_out77,Fdata_out2=>top_out78,Fdata_out3=>top_out79);

F_function20:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out76,Fdata_in1=>top_out77,Fdata_in2=>top_out78,Fdata_in3=>top_out79,
        rk1=>rk20,rk2=>rk11,count_in=>count20,count_out=>count21,
        Fdata_out0=>top_out80,Fdata_out1=>top_out81,Fdata_out2=>top_out82,Fdata_out3=>top_out83); 

F_function21:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out80,Fdata_in1=>top_out81,Fdata_in2=>top_out82,Fdata_in3=>top_out83,
        rk1=>rk21,rk2=>rk10,count_in=>count21,count_out=>count22,
        Fdata_out0=>top_out84,Fdata_out1=>top_out85,Fdata_out2=>top_out86,Fdata_out3=>top_out87);

F_function22:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out84,Fdata_in1=>top_out85,Fdata_in2=>top_out86,Fdata_in3=>top_out87,
        rk1=>rk22,rk2=>rk9,count_in=>count22,count_out=>count23,
        Fdata_out0=>top_out88,Fdata_out1=>top_out89,Fdata_out2=>top_out90,Fdata_out3=>top_out91);

F_function23:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out88,Fdata_in1=>top_out89,Fdata_in2=>top_out90,Fdata_in3=>top_out91,
        rk1=>rk23,rk2=>rk8,count_in=>count23,count_out=>count24,
        Fdata_out0=>top_out92,Fdata_out1=>top_out93,Fdata_out2=>top_out94,Fdata_out3=>top_out95);

F_function24:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out92,Fdata_in1=>top_out93,Fdata_in2=>top_out94,Fdata_in3=>top_out95,
        rk1=>rk24,rk2=>rk7,count_in=>count24,count_out=>count25,
        Fdata_out0=>top_out96,Fdata_out1=>top_out97,Fdata_out2=>top_out98,Fdata_out3=>top_out99);

F_function25:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out96,Fdata_in1=>top_out97,Fdata_in2=>top_out98,Fdata_in3=>top_out99,
        rk1=>rk25,rk2=>rk6,count_in=>count25,count_out=>count26,
        Fdata_out0=>top_out100,Fdata_out1=>top_out101,Fdata_out2=>top_out102,Fdata_out3=>top_out103); 

F_function26:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out100,Fdata_in1=>top_out101,Fdata_in2=>top_out102,Fdata_in3=>top_out103,
        rk1=>rk26,rk2=>rk5,count_in=>count26,count_out=>count27,
        Fdata_out0=>top_out104,Fdata_out1=>top_out105,Fdata_out2=>top_out106,Fdata_out3=>top_out107);

F_function27:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out104,Fdata_in1=>top_out105,Fdata_in2=>top_out106,Fdata_in3=>top_out107,
        rk1=>rk27,rk2=>rk4,count_in=>count27,count_out=>count28,
        Fdata_out0=>top_out108,Fdata_out1=>top_out109,Fdata_out2=>top_out110,Fdata_out3=>top_out111);

F_function28:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out108,Fdata_in1=>top_out109,Fdata_in2=>top_out110,Fdata_in3=>top_out111,
        rk1=>rk28,rk2=>rk3,count_in=>count28,count_out=>count29,
        Fdata_out0=>top_out112,Fdata_out1=>top_out113,Fdata_out2=>top_out114,Fdata_out3=>top_out115);

F_function29:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out112,Fdata_in1=>top_out113,Fdata_in2=>top_out114,Fdata_in3=>top_out115,
        rk1=>rk29,rk2=>rk2,count_in=>count29,count_out=>count30,
        Fdata_out0=>top_out116,Fdata_out1=>top_out117,Fdata_out2=>top_out118,Fdata_out3=>top_out119);

F_function30:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out116,Fdata_in1=>top_out117,Fdata_in2=>top_out118,Fdata_in3=>top_out119,
        rk1=>rk30,rk2=>rk1,count_in=>count30,count_out=>count31,
        Fdata_out0=>top_out120,Fdata_out1=>top_out121,Fdata_out2=>top_out122,Fdata_out3=>top_out123); 

F_function31:F_function port map 
        (F_begin =>top_databegin, F_opcode =>SM4_opcode,F_clk=>top_clk,
        Fdata_in0=>top_out120,Fdata_in1=>top_out121,Fdata_in2=>top_out122,Fdata_in3=>top_out123,
        rk1=>rk31,rk2=>rk0,count_in=>count31,count_out=>count32,
        Fdata_out0=>top_out124,Fdata_out1=>top_out125,Fdata_out2=>top_out126,Fdata_out3=>top_out127); 
        
        
        process(top_clk)
        begin
           if rising_edge(top_clk) then
              if(top_databegin='0') then
                 top_data_complete<='0';
                 top_dataout<=(others=>'Z');
                 count0<="000000";
              else 
                 if(count32="100000")then
                   top_dataout<=top_out127 & top_out126 & top_out125 & top_out124;
                   top_data_complete<='1';
                 end if;
              end if;
           end if;
        end process; 
       
end Behavioral;
