/*******************lijingchao*********************
   本模块实现Frk函数，Frk函数为SM4加密系统的密钥加密
   轮函数，总共运行32次。
   输入数据：Frkdata_in0/1/2/3  32位。
   输出数据：Frkdata_out 32位。
**************************************************/
module Frk_function(Frkdata_in0,Frkdata_in1,Frkdata_in2,Frkdata_in3,ck,Frkdata_out);


input[0:31] ck,Frkdata_in0,Frkdata_in1,Frkdata_in2,Frkdata_in3;
output[0:31] Frkdata_out;

wire[31:0] int_Frkvar1,int_Frkvar2; //Frk模块的中间线网型变量。
wire[0:31] Frkdata_out; 

assign int_Frkvar1=Frkdata_in1^Frkdata_in2^Frkdata_in3^ck;    //输入字1、2、3与ck异或得到Trk变换的输入。
Trk_synchange Frk_Trk_synchange (int_Frkvar1,int_Frkvar2);   //轮密钥Trk变换的实例化。
assign Frkdata_out=int_Frkvar2^Frkdata_in0;                  //Trk变换后的输出与0字输入异或得到轮密钥输出。

endmodule
