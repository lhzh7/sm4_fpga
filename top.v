module top(
              top_clk,top_rst,top_opcode,key,top_datain,last,handshake,
              top_dataout,top_rk_complete,top_data_complete);

input top_clk,top_rst,last,handshake;  
input[0:1] top_opcode;  
input[0:127] top_datain;
input[0:127] key;       



output top_rk_complete,top_data_complete;  
                                          
output[0:127] top_dataout;                 


wire top_keybegin,top_databegin,top_en,SM4_opcode,last,handshake; 
wire[0:4] top_keyaddr;                             
wire[0:127] top_datain;                             
wire[0:31] top_rk,x1,x2,x3,x4;                 

wire[0:5] count1,count2,count3,count4,count5,count6,count7,count8,count9,
          count10,count11,count12,count13,count14,count15,count16,count17,count18,count19,
          count20,count21,count22,count23,count24,count25,count26,count27,count28,count29,
          count30,count31,count32;

wire[0:31] top_out0,top_out1,top_out2,top_out3,top_out4,top_out5,top_out6,top_out7,top_out8,
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
           top_out125,top_out126,top_out127;
          
reg[0:31] rk0,rk1,rk2,rk3,rk4,rk5,rk6,rk7,rk8,rk9,
          rk10,rk11,rk12,rk13,rk14,rk15,rk16,rk17,rk18,rk19,
          rk20,rk21,rk22,rk23,rk24,rk25,rk26,rk27,rk28,rk29,
          rk30,rk31;
reg[0:5] count0;  
reg top_data_complete;
reg[0:127] top_dataout;
rk_top top_ck_top(top_clk,top_rst,top_keybegin,key,last,handshake,top_rk,top_keyaddr,top_en,top_rk_complete);

always @(posedge top_clk)              
          if(top_en==1'b1)
             case(top_keyaddr)
                5'b00000: rk0<=top_rk;
		            5'b00001: rk1<=top_rk;
		            5'b00010: rk2<=top_rk;
		            5'b00011: rk3<=top_rk;
		            5'b00100: rk4<=top_rk;
		            5'b00101: rk5<=top_rk;
		            5'b00110: rk6<=top_rk;
		            5'b00111: rk7<=top_rk;
		            5'b01000: rk8<=top_rk;
		            5'b01001: rk9<=top_rk;
		            5'b01010: rk10<=top_rk;
		            5'b01011: rk11<=top_rk;
		            5'b01100: rk12<=top_rk;
		            5'b01101: rk13<=top_rk;
		            5'b01110: rk14<=top_rk;
		            5'b01111: rk15<=top_rk;
		            5'b10000: rk16<=top_rk;
		            5'b10001: rk17<=top_rk;
		            5'b10010: rk18<=top_rk;
		            5'b10011: rk19<=top_rk;
		            5'b10100: rk20<=top_rk;
		            5'b10101: rk21<=top_rk;
		            5'b10110: rk22<=top_rk;
		            5'b10111: rk23<=top_rk;
		            5'b11000: rk24<=top_rk;
		            5'b11001: rk25<=top_rk;
		            5'b11010: rk26<=top_rk;
		            5'b11011: rk27<=top_rk;
		            5'b11100: rk28<=top_rk;
		            5'b11101: rk29<=top_rk;
		            5'b11110: rk30<=top_rk;
		            5'b11111: rk31<=top_rk;
              endcase    
      
  
assign x1=top_datain[0:31];
assign x2=top_datain[32:63];
assign x3=top_datain[64:95];   
assign x4=top_datain[96:127];


assign top_keybegin=(top_opcode==2'b00)?1:0;
assign top_databegin=(top_opcode==2'b01||top_opcode==2'b11)?1:0;
assign SM4_opcode=(top_opcode==2'b01)?1:0;  
  




F_function F_function0(top_databegin,SM4_opcode,top_clk,x1,x2,x3,x4,rk0,rk31,count0,count1,top_out0,top_out1,top_out2,top_out3);
F_function F_function1(top_databegin,SM4_opcode,top_clk,top_out0,top_out1,top_out2,top_out3,rk1,rk30,count1,count2,top_out4,top_out5,top_out6,top_out7);
F_function F_function2(top_databegin,SM4_opcode,top_clk,top_out4,top_out5,top_out6,top_out7,rk2,rk29,count2,count3,top_out8,top_out9,top_out10,top_out11);
F_function F_function3(top_databegin,SM4_opcode,top_clk,top_out8,top_out9,top_out10,top_out11,rk3,rk28,count3,count4,top_out12,top_out13,top_out14,top_out15);
F_function F_function4(top_databegin,SM4_opcode,top_clk,top_out12,top_out13,top_out14,top_out15,rk4,rk27,count4,count5,top_out16,top_out17,top_out18,top_out19);
F_function F_function5(top_databegin,SM4_opcode,top_clk,top_out16,top_out17,top_out18,top_out19,rk5,rk26,count5,count6,top_out20,top_out21,top_out22,top_out23);
F_function F_function6(top_databegin,SM4_opcode,top_clk,top_out20,top_out21,top_out22,top_out23,rk6,rk25,count6,count7,top_out24,top_out25,top_out26,top_out27);
F_function F_function7(top_databegin,SM4_opcode,top_clk,top_out24,top_out25,top_out26,top_out27,rk7,rk24,count7,count8,top_out28,top_out29,top_out30,top_out31);
F_function F_function8(top_databegin,SM4_opcode,top_clk,top_out28,top_out29,top_out30,top_out31,rk8,rk23,count8,count9,top_out32,top_out33,top_out34,top_out35);
F_function F_function9(top_databegin,SM4_opcode,top_clk,top_out32,top_out33,top_out34,top_out35,rk9,rk22,count9,count10,top_out36,top_out37,top_out38,top_out39);
F_function F_function10(top_databegin,SM4_opcode,top_clk,top_out36,top_out37,top_out38,top_out39,rk10,rk21,count10,count11,top_out40,top_out41,top_out42,top_out43);
F_function F_function11(top_databegin,SM4_opcode,top_clk,top_out40,top_out41,top_out42,top_out43,rk11,rk20,count11,count12,top_out44,top_out45,top_out46,top_out47);
F_function F_function12(top_databegin,SM4_opcode,top_clk,top_out44,top_out45,top_out46,top_out47,rk12,rk19,count12,count13,top_out48,top_out49,top_out50,top_out51);
F_function F_function13(top_databegin,SM4_opcode,top_clk,top_out48,top_out49,top_out50,top_out51,rk13,rk18,count13,count14,top_out52,top_out53,top_out54,top_out55);
F_function F_function14(top_databegin,SM4_opcode,top_clk,top_out52,top_out53,top_out54,top_out55,rk14,rk17,count14,count15,top_out56,top_out57,top_out58,top_out59);
F_function F_function15(top_databegin,SM4_opcode,top_clk,top_out56,top_out57,top_out58,top_out59,rk15,rk16,count15,count16,top_out60,top_out61,top_out62,top_out63);
F_function F_function16(top_databegin,SM4_opcode,top_clk,top_out60,top_out61,top_out62,top_out63,rk16,rk15,count16,count17,top_out64,top_out65,top_out66,top_out67);
F_function F_function17(top_databegin,SM4_opcode,top_clk,top_out64,top_out65,top_out66,top_out67,rk17,rk14,count17,count18,top_out68,top_out69,top_out70,top_out71);
F_function F_function18(top_databegin,SM4_opcode,top_clk,top_out68,top_out69,top_out70,top_out71,rk18,rk13,count18,count19,top_out72,top_out73,top_out74,top_out75);
F_function F_function19(top_databegin,SM4_opcode,top_clk,top_out72,top_out73,top_out74,top_out75,rk19,rk12,count19,count20,top_out76,top_out77,top_out78,top_out79);
F_function F_function20(top_databegin,SM4_opcode,top_clk,top_out76,top_out77,top_out78,top_out79,rk20,rk11,count20,count21,top_out80,top_out81,top_out82,top_out83);
F_function F_function21(top_databegin,SM4_opcode,top_clk,top_out80,top_out81,top_out82,top_out83,rk21,rk10,count21,count22,top_out84,top_out85,top_out86,top_out87);
F_function F_function22(top_databegin,SM4_opcode,top_clk,top_out84,top_out85,top_out86,top_out87,rk22,rk9,count22,count23,top_out88,top_out89,top_out90,top_out91);
F_function F_function23(top_databegin,SM4_opcode,top_clk,top_out88,top_out89,top_out90,top_out91,rk23,rk8,count23,count24,top_out92,top_out93,top_out94,top_out95);
F_function F_function24(top_databegin,SM4_opcode,top_clk,top_out92,top_out93,top_out94,top_out95,rk24,rk7,count24,count25,top_out96,top_out97,top_out98,top_out99);
F_function F_function25(top_databegin,SM4_opcode,top_clk,top_out96,top_out97,top_out98,top_out99,rk25,rk6,count25,count26,top_out100,top_out101,top_out102,top_out103);
F_function F_function26(top_databegin,SM4_opcode,top_clk,top_out100,top_out101,top_out102,top_out103,rk26,rk5,count26,count27,top_out104,top_out105,top_out106,top_out107);
F_function F_function27(top_databegin,SM4_opcode,top_clk,top_out104,top_out105,top_out106,top_out107,rk27,rk4,count27,count28,top_out108,top_out109,top_out110,top_out111);
F_function F_function28(top_databegin,SM4_opcode,top_clk,top_out108,top_out109,top_out110,top_out111,rk28,rk3,count28,count29,top_out112,top_out113,top_out114,top_out115);
F_function F_function29(top_databegin,SM4_opcode,top_clk,top_out112,top_out113,top_out114,top_out115,rk29,rk2,count29,count30,top_out116,top_out117,top_out118,top_out119);
F_function F_function30(top_databegin,SM4_opcode,top_clk,top_out116,top_out117,top_out118,top_out119,rk30,rk1,count30,count31,top_out120,top_out121,top_out122,top_out123);
F_function F_function31(top_databegin,SM4_opcode,top_clk,top_out120,top_out121,top_out122,top_out123,rk31,rk0,count31,count32,top_out124,top_out125,top_out126,top_out127);


always@(posedge top_clk)
    if(top_databegin==1'b0)
    begin
      top_data_complete<=1'b0;
      top_dataout<=128'hz;
      count0<=0;
		/*count1<=0;
		count2<=0;
		count3<=0;
		count4<=0;
		count5<=0;
		count6<=0;
		count7<=0;
		count8<=0;
		count9<=0;
		count10<=0;
		count11<=0;
		count12<=0;
		count13<=0;
		count14<=0;
		count15<=0;
		count16<=0;
		count17<=0;
		count18<=0;
		count19<=0;
		count20<=0;
		count21<=0;
		count22<=0;
		count23<=0;
		count24<=0;
		count25<=0;
		count26<=0;
		count27<=0;
		count28<=0;
		count29<=0;
		count30<=0;
		count31<=0;
		count32<=0;*/
    end
    else 
    begin
      if(count32==32)
        begin
        top_dataout<={top_out127,top_out126,top_out125,top_out124};
        top_data_complete<=1'b1;
        end
    end  
       
endmodule
