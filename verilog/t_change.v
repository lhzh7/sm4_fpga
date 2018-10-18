/*******************lijingchao*********************
   本模块实现t变换，实际为4个并行的S盒变换，完成32位
   的S盒变换。
   输入数据: tdata_in  32位。
   输出数据: tdata_out 32位。
***************************************************/
module t_change(//input
                tdata_in,
                //output
                tdata_out);
input    [0:31]   tdata_in;
output   [0:31]   tdata_out;

S_BOX t_sbox1(tdata_in[24:31],tdata_out[24:31]);  //S盒模块实例化1。
S_BOX t_sbox2(tdata_in[16:23],tdata_out[16:23]);  //S盒模块实例化2。
S_BOX t_sbox3(tdata_in[8:15],tdata_out[8:15]);    //S盒模块实例化3。
S_BOX t_sbox4(tdata_in[0:7],tdata_out[0:7]);      //S盒模块实例化4。

endmodule