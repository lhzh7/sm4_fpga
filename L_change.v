/*******************lijingchao*********************
  本模块实现L变换，将输入的源数据，与循环左移2位，10
  位，18位，24位后的数据进行依次异或得到输出数据。
  输入数据: Ldata_in  32位
  输出数据: Ldata_out 32位
**************************************************/
module L_change(Ldata_in,Ldata_out);

input    [0:31]   Ldata_in;
output   [0:31]   Ldata_out;
	
assign   Ldata_out=Ldata_in^{Ldata_in[2:31],Ldata_in[0:1]}^{Ldata_in[10:31],Ldata_in[0:9]}^{Ldata_in[18:31],Ldata_in[0:17]}^{Ldata_in[24:31],Ldata_in[0:23]};
         //源数据与变换后的数据进行异或运算。
endmodule