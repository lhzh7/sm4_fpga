/*******************lijingchao*********************
  本模块实现轮密钥rk的L变换，与明文加密的L变换很相似，
  只是循环移位的次数、位数不同。循环移位2次，一次左移
  13位，一次左移23位。
  输入数据: Lrkdata_in  32位。
  输出数据: Lrkdata_out 32位。
***************************************************/
module Lrk_change(//input
                    Lrkdata_in,
                    //output
                    Lrkdata_out);
input[0:31] Lrkdata_in;
output[0:31] Lrkdata_out;
  
assign Lrkdata_out=Lrkdata_in^{Lrkdata_in[13:31],Lrkdata_in[0:12]}^{Lrkdata_in[23:31],Lrkdata_in[0:22]};
                        //L变换的运算，将输入的源数据与其循环左移13位，循环左移23位的数据进行异或运算的到输出值。
endmodule