module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter A=0,B1=1,B2=2,B3=3, B4=4,B5=5,B6=6,B7=7,B8=8,B9=9,C=10,D=11;
    reg [3:0] state, next_state;
    always @(*)begin
        case(state)
            A:begin
                if(in==0)next_state=B1;
                else next_state=A;
            end
            B1:begin
                next_state=B2;
            end
            B2:begin
                next_state=B3;
            end
            B3:begin
                next_state=B4;
            end
            B4:begin
                next_state=B5;
            end
            B5:begin
                next_state=B6;
            end
            B6:begin
                next_state=B7;
            end
            B7:begin
                next_state=B8;
            end
            B8:begin
                next_state=B9;
            end
            B9:begin
                if(in==0)next_state=D;
                else next_state=C;
            end
            C:begin
                if(in==1)next_state=A;
                else next_state=B1;
            end
            D:begin
                if(in==1)next_state=A;
                else next_state=D;
            end
        endcase
    end
    
    always@(posedge clk)begin
        if(reset) state<=A;
        else state<=next_state;
    end
    
    assign done=(state==C)?1:0;
                
            
endmodule
