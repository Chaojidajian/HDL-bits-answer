module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);	
    reg temp[31:0];
    integer i;
    always @(posedge clk) begin
        if(reset)begin
            out<=32'b0;
            for(i=0;i<32;i=i+1)begin
            	if(temp[i]!=in[i])begin
                temp[i]<=in[i];
                end
            end
        end
        else begin
            for(i=0;i<32;i=i+1)begin
                if(temp[i]==1&in[i]==0)begin
               	temp[i]<=in[i];
                    out[i]<=1'b1;
                end
                else begin
                out[i]<=out[i];
                temp[i]<=in[i];
                end
            end
        end
    end
        
	
endmodule

