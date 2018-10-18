/*******************lijingchao*********************
   本模块实现T变换，T变换是t变换与L变换的综合，即对
   输入数据进行t变换，然后在对t变换的输出数据进行L变
   换，得到最终的输出数据。
   输入数据：Tdata_in  32位。
   输出数据：Tdata_out 32位。
**************************************************/
module T_synchange(//input
                    Tdata_in,
                    //output
                    Tdata_out);
input[0:31] Tdata_in;
output[0:31] Tdata_out;

wire[0:31] int_Tvar;   //线网型的中间变量，连接t变换的输出与L变换的输入。

t_change T_t_change(Tdata_in,int_Tvar);  //t变换的实例化模块。
L_change T_L_change(int_Tvar,Tdata_out); //L变换的实例化模块。

endmodule