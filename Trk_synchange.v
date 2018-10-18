/*******************lijingchao*********************
   本模块实现rk的T变换，与明文加密的T变化一样，只是
   其中的L变换有些不同。   
   输出数据：Trkdata_in  32位。
   输入数据：Trkdata_out 32位。
**************************************************/
module Trk_synchange(//input
                      Trkdata_in,
                      //output
                      Trkdata_out);
input   [0:31]   Trkdata_in;
output  [0:31]   Trkdata_out;

wire[0:31] int_Trkvar;  //T变换的中间线网型变量声明，连接t变换的输出与Lrk变换的输入。

	     t_change Trk_t_change(Trkdata_in,int_Trkvar);      //t变换的实例化。
        Lrk_change Trk_Lrk_change(int_Trkvar,Trkdata_out); //Lrk变换的实例化。

endmodule