module top_module (
    input clk,
    input x,
    output z
); 
    reg [2:0] flip=3'b0;
    assign z=~(flip[2]|flip[1]|flip[0]);
    always@(posedge clk)begin
        flip[0]<=x^flip[0];
        flip[1]<=x&(~flip[1]);
        flip[2]<=x|(~flip[2]);
    end
endmodule
