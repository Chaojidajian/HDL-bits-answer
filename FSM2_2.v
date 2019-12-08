// Note the Verilog-1995 module declaration syntax here:
module top_module(
    input clk,
    input reset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out);

    // Fill in state name declarations
	parameter OFF=0,ON=1;

    always @(posedge clk) begin

        if(reset)present_state<=OFF;
            else present_state<=next_state;
            // Fill in reset logic
    end
    always @(*)begin
        case(present_state)
            OFF:next_state=(j==1?ON:OFF);
            ON:next_state=(k==1?OFF:ON);
                          endcase
                          end
    assign out=(present_state==OFF)?0:1;

endmodule


