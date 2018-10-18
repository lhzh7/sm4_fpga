/*******************lijingchao*********************
   本模块实现F函数，F函数为SM4加密系统的轮函数，总共
   运行32次。
   输入数据：Fdata_in0/1/2/3  32位。
   输出数据：Fdata_out0/1/2/3 32位。
**************************************************/
module F_function(//input
                    F_begin,F_opcode,F_clk,Fdata_in0,Fdata_in1,Fdata_in2,Fdata_in3,rk1,rk2,count_in,
                  //output
                    count_out,Fdata_out0,Fdata_out1,Fdata_out2,Fdata_out3);
input F_clk;   //F函数模块输入的时钟信号。
input[0:5]  count_in; //加密轮数计数信号输入。
input[0:31] Fdata_in0,Fdata_in1,Fdata_in2,Fdata_in3; //F函数模块输入128位数据，分割为4个32位字。
input[0:31] rk1,rk2;  //输入的轮密钥32位，rk1位加密时采用的轮密钥，rk2为解密时采用的轮密钥。


input F_opcode,F_begin; //控制操作码，F_begin为1时开始加密或解密，F_begin为0时不工作输出高阻Z，
                        //F_opcode为加解密选通信号，F_opcode为1时加密，选用rk1，F_opcode为0是解密选用rk2。


output[0:5]  count_out; //加密轮数计数信号输出。
output[0:31] Fdata_out0,Fdata_out1,Fdata_out2,Fdata_out3; //轮函数的输出，128位数据，分割为4个32位字。

/////////////////////寄存器型变量声明//////////////////////////
reg[0:5] count_out; 
reg[0:31] Fdata_out0,Fdata_out1,Fdata_out2,Fdata_out3;
/////////////////////线网型变量声明////////////////////////////
wire[0:31] int_Fvar1,int_Fvar2;  //F函数中声明的中间线网型变量。
  
//三选一数据选择器，通过两个控制操作码，选择输入的数据，F_begin为1时启动加解密系统，为0时输出高阻态。F_opcode为1时采用加密轮密钥rk1，
//F_opcode为0时采用解密轮密钥rk2。
assign int_Fvar1=(F_begin==1'b1)?((F_opcode)?(Fdata_in1^Fdata_in2^Fdata_in3^rk1):(Fdata_in1^Fdata_in2^Fdata_in3^rk2)):32'bz;
//T变换的实例化，选择后输出的数据，为T变换的输入。
T_synchange F_T_synchange(int_Fvar1,int_Fvar2);   

//时序模块，上升沿有效，加解密系统在F_begin信号为1时启动，0字输出(Fdata_out0)为1(Fdata_in1)字输入，1字输出为2字输入，
//2字输出为3字输入，3字输出为0字输入与T变换输出变量int_Fvar2的异或，同时此轮的输出为下一轮的输入，这是构成流水线的基
//础。F_begin为0时系统停止，输出为高电平。
always @(posedge  F_clk)
        if(F_begin==1'b1)
            begin
           Fdata_out0<=Fdata_in1;     
	        Fdata_out1<=Fdata_in2;     
	        Fdata_out2<=Fdata_in3;     
	        Fdata_out3<=int_Fvar2^Fdata_in0; 
	        count_out<=count_in+1;   //加密轮数的统计。
            end
        else
            begin
           Fdata_out0<=32'bz;     
	        Fdata_out1<=32'bz;     
	        Fdata_out2<=32'bz;     
	        Fdata_out3<=32'bz;
	        count_out<=0;
            end
             
endmodule
