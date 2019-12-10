module top_module(
    input clk,
    input in,
    input reset,
    output out); //
	parameter A=0,B=1,C=2,D=3;
    // State transition logic
    reg [1:0]state,next_state;
    always@(*)begin
        case(state)
            A:next_state=(in==0)?A:B;
            B:next_state=(in==0)?C:B;
            C:next_state=(in==0)?A:D;
            D:next_state=(in==0)?C:B;
        endcase
    end
    
    always@(posedge clk )begin
        if(reset)begin
            state<=A;
        end
        else begin
   		 state<=next_state;
        end
    end
    // State flip-flops with asynchronous reset
	assign out = (state == D) ? 1 : 0;
    // Output logic
    

endmodule


