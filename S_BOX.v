/*******************lijingchao*********************
   本模块实现S盒变换功能。
   输入数据: sdata_in  8位。
   输出数据: sdata_out 8位。
***************************************************/
module S_BOX(//input
              sdata_in,
              //output
              sdata_out);

input    [0:7]    sdata_in;
output   [0:7]    sdata_out;

reg      [0:7]    sdata_out;
  
always 
  @(sdata_in)
  case(sdata_in)     //S盒变换映射表，16*16共256组数据。
                8'h00  :  sdata_out=8'hd6;   8'h01  :  sdata_out=8'h90;   8'h02  :  sdata_out=8'he9;   8'h03  :  sdata_out=8'hfe;   
                8'h04  :  sdata_out=8'hcc;   8'h05  :  sdata_out=8'he1;   8'h06  :  sdata_out=8'h3d;   8'h07  :  sdata_out=8'hb7;   
                8'h08  :  sdata_out=8'h16;   8'h09  :  sdata_out=8'hb6;   8'h0a  :  sdata_out=8'h14;   8'h0b  :  sdata_out=8'hc2;
                8'h0c  :  sdata_out=8'h28;   8'h0d  :  sdata_out=8'hfb;   8'h0e  :  sdata_out=8'h2c;   8'h0f  :  sdata_out=8'h05;

                8'h10  :  sdata_out=8'h2b;   8'h11  :  sdata_out=8'h67;   8'h12  :  sdata_out=8'h9a;   8'h13  :  sdata_out=8'h76;   
                8'h14  :  sdata_out=8'h2a;   8'h15  :  sdata_out=8'hbe;   8'h16  :  sdata_out=8'h04;   8'h17  :  sdata_out=8'hc3;   
                8'h18  :  sdata_out=8'haa;   8'h19  :  sdata_out=8'h44;   8'h1a  :  sdata_out=8'h13;   8'h1b  :  sdata_out=8'h26;
                8'h1c  :  sdata_out=8'h49;   8'h1d  :  sdata_out=8'h86;   8'h1e  :  sdata_out=8'h06;   8'h1f  :  sdata_out=8'h99;

                8'h20  :  sdata_out=8'h9c;   8'h21  :  sdata_out=8'h42;   8'h22  :  sdata_out=8'h50;   8'h23  :  sdata_out=8'hf4;   
                8'h24  :  sdata_out=8'h91;   8'h25  :  sdata_out=8'hef;   8'h26  :  sdata_out=8'h98;   8'h27  :  sdata_out=8'h7a;   
                8'h28  :  sdata_out=8'h33;   8'h29  :  sdata_out=8'h54;   8'h2a  :  sdata_out=8'h0b;   8'h2b  :  sdata_out=8'h43;
                8'h2c  :  sdata_out=8'hed;   8'h2d  :  sdata_out=8'hcf;   8'h2e  :  sdata_out=8'hac;   8'h2f  :  sdata_out=8'h62;

                8'h30  :  sdata_out=8'he4;   8'h31  :  sdata_out=8'hb3;   8'h32  :  sdata_out=8'h1c;   8'h33  :  sdata_out=8'ha9;   
                8'h34  :  sdata_out=8'hc9;   8'h35  :  sdata_out=8'h08;   8'h36  :  sdata_out=8'he8;   8'h37  :  sdata_out=8'h95;   
                8'h38  :  sdata_out=8'h80;   8'h39  :  sdata_out=8'hdf;   8'h3a  :  sdata_out=8'h94;   8'h3b  :  sdata_out=8'hfa;
                8'h3c  :  sdata_out=8'h75;   8'h3d  :  sdata_out=8'h8f;   8'h3e  :  sdata_out=8'h3f;   8'h3f  :  sdata_out=8'ha6;

                8'h40  :  sdata_out=8'h47;   8'h41  :  sdata_out=8'h07;   8'h42  :  sdata_out=8'ha7;   8'h43  :  sdata_out=8'hfc;   
                8'h44  :  sdata_out=8'hf3;   8'h45  :  sdata_out=8'h73;   8'h46  :  sdata_out=8'h17;   8'h47  :  sdata_out=8'hba;   
                8'h48  :  sdata_out=8'h83;   8'h49  :  sdata_out=8'h59;   8'h4a  :  sdata_out=8'h3c;   8'h4b  :  sdata_out=8'h19;
                8'h4c  :  sdata_out=8'he6;   8'h4d  :  sdata_out=8'h85;   8'h4e  :  sdata_out=8'h4f;   8'h4f  :  sdata_out=8'ha8;

                8'h50  :  sdata_out=8'h68;   8'h51  :  sdata_out=8'h6b;   8'h52  :  sdata_out=8'h81;   8'h53  :  sdata_out=8'hb2;   
                8'h54  :  sdata_out=8'h71;   8'h55  :  sdata_out=8'h64;   8'h56  :  sdata_out=8'hda;   8'h57  :  sdata_out=8'h8b;   
                8'h58  :  sdata_out=8'hf8;   8'h59  :  sdata_out=8'heb;   8'h5a  :  sdata_out=8'h0f;   8'h5b  :  sdata_out=8'h4b;
                8'h5c  :  sdata_out=8'h70;   8'h5d  :  sdata_out=8'h56;   8'h5e  :  sdata_out=8'h9d;   8'h5f  :  sdata_out=8'h35;

                8'h60  :  sdata_out=8'h1e;   8'h61  :  sdata_out=8'h24;   8'h62  :  sdata_out=8'h0e;   8'h63  :  sdata_out=8'h5e;   
                8'h64  :  sdata_out=8'h63;   8'h65  :  sdata_out=8'h58;   8'h66  :  sdata_out=8'hd1;   8'h67  :  sdata_out=8'ha2;   
                8'h68  :  sdata_out=8'h25;   8'h69  :  sdata_out=8'h22;   8'h6a  :  sdata_out=8'h7c;   8'h6b  :  sdata_out=8'h3b;
                8'h6c  :  sdata_out=8'h01;   8'h6d  :  sdata_out=8'h21;   8'h6e  :  sdata_out=8'h78;   8'h6f  :  sdata_out=8'h87;

                8'h70  :  sdata_out=8'hd4;   8'h71  :  sdata_out=8'h00;   8'h72  :  sdata_out=8'h46;   8'h73  :  sdata_out=8'h57;   
                8'h74  :  sdata_out=8'h9f;   8'h75  :  sdata_out=8'hd3;   8'h76  :  sdata_out=8'h27;   8'h77  :  sdata_out=8'h52;   
                8'h78  :  sdata_out=8'h4c;   8'h79  :  sdata_out=8'h36;   8'h7a  :  sdata_out=8'h02;   8'h7b  :  sdata_out=8'he7;
                8'h7c  :  sdata_out=8'ha0;   8'h7d  :  sdata_out=8'hc4;   8'h7e  :  sdata_out=8'hc8;   8'h7f  :  sdata_out=8'h9e;

                8'h80  :  sdata_out=8'hea;   8'h81  :  sdata_out=8'hbf;   8'h82  :  sdata_out=8'h8a;   8'h83  :  sdata_out=8'hd2;   
                8'h84  :  sdata_out=8'h40;   8'h85  :  sdata_out=8'hc7;   8'h86  :  sdata_out=8'h38;   8'h87  :  sdata_out=8'hb5;   
                8'h88  :  sdata_out=8'ha3;   8'h89  :  sdata_out=8'hf7;   8'h8a  :  sdata_out=8'hf2;   8'h8b  :  sdata_out=8'hce;
                8'h8c  :  sdata_out=8'hf9;   8'h8d  :  sdata_out=8'h61;   8'h8e  :  sdata_out=8'h15;   8'h8f  :  sdata_out=8'ha1;

                8'h90  :  sdata_out=8'he0;   8'h91  :  sdata_out=8'hae;   8'h92  :  sdata_out=8'h5d;   8'h93  :  sdata_out=8'ha4;   
                8'h94  :  sdata_out=8'h9b;   8'h95  :  sdata_out=8'h34;   8'h96  :  sdata_out=8'h1a;   8'h97  :  sdata_out=8'h55;   
                8'h98  :  sdata_out=8'had;   8'h99  :  sdata_out=8'h93;   8'h9a  :  sdata_out=8'h32;   8'h9b  :  sdata_out=8'h30;
                8'h9c  :  sdata_out=8'hf5;   8'h9d  :  sdata_out=8'h8c;   8'h9e  :  sdata_out=8'hb1;   8'h9f  :  sdata_out=8'he3;


                8'ha0  :  sdata_out=8'h1d;   8'ha1  :  sdata_out=8'hf6;   8'ha2  :  sdata_out=8'he2;   8'ha3  :  sdata_out=8'h2e;   
                8'ha4  :  sdata_out=8'h82;   8'ha5  :  sdata_out=8'h66;   8'ha6  :  sdata_out=8'hca;   8'ha7  :  sdata_out=8'h60;   
                8'ha8  :  sdata_out=8'hc0;   8'ha9  :  sdata_out=8'h29;   8'haa  :  sdata_out=8'h23;   8'hab  :  sdata_out=8'hab;
                8'hac  :  sdata_out=8'h0d;   8'had  :  sdata_out=8'h53;   8'hae  :  sdata_out=8'h4e;   8'haf  :  sdata_out=8'h6f;

                8'hb0  :  sdata_out=8'hd5;   8'hb1  :  sdata_out=8'hdb;   8'hb2  :  sdata_out=8'h37;   8'hb3  :  sdata_out=8'h45;   
                8'hb4  :  sdata_out=8'hde;   8'hb5  :  sdata_out=8'hfd;   8'hb6  :  sdata_out=8'h8e;   8'hb7  :  sdata_out=8'h2f;   
                8'hb8  :  sdata_out=8'h03;   8'hb9  :  sdata_out=8'hff;   8'hba  :  sdata_out=8'h6a;   8'hbb  :  sdata_out=8'h72;
                8'hbc  :  sdata_out=8'h6d;   8'hbd  :  sdata_out=8'h6c;   8'hbe  :  sdata_out=8'h5b;   8'hbf  :  sdata_out=8'h51;

                8'hc0  :  sdata_out=8'h8d;   8'hc1  :  sdata_out=8'h1b;   8'hc2  :  sdata_out=8'haf;   8'hc3  :  sdata_out=8'h92;   
                8'hc4  :  sdata_out=8'hbb;   8'hc5  :  sdata_out=8'hdd;   8'hc6  :  sdata_out=8'hbc;   8'hc7  :  sdata_out=8'h7f;   
                8'hc8  :  sdata_out=8'h11;   8'hc9  :  sdata_out=8'hd9;   8'hca  :  sdata_out=8'h5c;   8'hcb  :  sdata_out=8'h41;
                8'hcc  :  sdata_out=8'h1f;   8'hcd  :  sdata_out=8'h10;   8'hce  :  sdata_out=8'h5a;   8'hcf  :  sdata_out=8'hd8;

                8'hd0  :  sdata_out=8'h0a;   8'hd1  :  sdata_out=8'hc1;   8'hd2  :  sdata_out=8'h31;   8'hd3  :  sdata_out=8'h88;   
                8'hd4  :  sdata_out=8'ha5;   8'hd5  :  sdata_out=8'hcd;   8'hd6  :  sdata_out=8'h7b;   8'hd7  :  sdata_out=8'hbd;   
                8'hd8  :  sdata_out=8'h2d;   8'hd9  :  sdata_out=8'h74;   8'hda  :  sdata_out=8'hd0;   8'hdb  :  sdata_out=8'h12;
                8'hdc  :  sdata_out=8'hb8;   8'hdd  :  sdata_out=8'he5;   8'hde  :  sdata_out=8'hb4;   8'hdf  :  sdata_out=8'hb0;

                8'he0  :  sdata_out=8'h89;   8'he1  :  sdata_out=8'h69;   8'he2  :  sdata_out=8'h97;   8'he3  :  sdata_out=8'h4a;   
                8'he4  :  sdata_out=8'h0c;   8'he5  :  sdata_out=8'h96;   8'he6  :  sdata_out=8'h77;   8'he7  :  sdata_out=8'h7e;   
                8'he8  :  sdata_out=8'h65;   8'he9  :  sdata_out=8'hb9;   8'hea  :  sdata_out=8'hf1;   8'heb  :  sdata_out=8'h09;
                8'hec  :  sdata_out=8'hc5;   8'hed  :  sdata_out=8'h6e;   8'hee  :  sdata_out=8'hc6;   8'hef  :  sdata_out=8'h84;

                8'hf0  :  sdata_out=8'h18;   8'hf1  :  sdata_out=8'hf0;   8'hf2  :  sdata_out=8'h7d;   8'hf3  :  sdata_out=8'hec;   
                8'hf4  :  sdata_out=8'h3a;   8'hf5  :  sdata_out=8'hdc;   8'hf6  :  sdata_out=8'h4d;   8'hf7  :  sdata_out=8'h20;   
                8'hf8  :  sdata_out=8'h79;   8'hf9  :  sdata_out=8'hee;   8'hfa  :  sdata_out=8'h5f;   8'hfb  :  sdata_out=8'h3e;
                8'hfc  :  sdata_out=8'hd7;   8'hfd  :  sdata_out=8'hcb;   8'hfe  :  sdata_out=8'h39;   8'hff  :  sdata_out=8'h48;
  endcase
endmodule

