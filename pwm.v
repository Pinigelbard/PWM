`timescale 1ns / 1ps



module pwm(
    input clk,
    input rst,
    output reg dout
    );
    integer count;
    integer period = 100;
    reg ton;
    reg ncyc = 1'b0;
    always@(posedge clk)
    begin
    if (rst) begin
    count <= 0;
    ncyc <= 0;
    ton <= 0;
    end
    else begin
     if (count <= ton) 
     begin
    count <= count + 1;
    ncyc <= 1'b0;
    dout <= 1'b1;
    end
    else if(count < period) 
    begin
    count <= count + 1;
    dout <= 0;
    ncyc <= 1'b0;
    end
    else 
    begin
    dout <= 0;
    ncyc <= 1'b1;
    end
    end
    end
    always@(posedge clk)
    if(!rst)
    begin
    if(ton < period)
    begin
    ton = ton + 5;
    end
    else 
    begin
    ton <= 0;
    end
    end
    
endmodule
