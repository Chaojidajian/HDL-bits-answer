module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
 	reg [1:0] state, next_state;
    reg [23:0] out;
    parameter A=0,B=1,C=2,D=3;
    always@(*)begin
        case(state)
            A: begin
                if(in[3]==1) next_state=B;
                else next_state=A;
            end
            B: begin
                next_state=C;
            end
            C: begin
                next_state=D;
            end
            D: begin
                if(in[3]==1) next_state=B;
                else next_state=A;
            end
           
        endcase
    end
    reg [1:0] prev;
    reg [7:0] in_p;
    always@(posedge clk)begin
        if(reset)begin 
            state<=A;
        	prev<=state;
        	in_p<=0;
        end
        else begin
            state<=next_state;
        	prev<=state;
        	in_p<=in;
        end
    end
	always@(*)begin
        case(state)
            A: begin
                if(in[3]==1) out[23:16]=in;
            end
            B: begin
                if(prev==D&&in_p[3] == 1)begin
               		out[15:8]=in;
                    out[23:16]=in_p;
                end
                else out[15:8]=in;

            end
            C: begin
                out[7:0]=in;
            end
            D: begin
              ;
            end

        endcase
    end

    assign out_bytes = (done == 1)? out:'bx;
    assign done=(state==D)?1:0;
    


endmodule
