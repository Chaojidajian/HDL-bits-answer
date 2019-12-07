module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin  
        if(in==0&&state==A)begin
            next_state<=B;
        end
        else if(in==0&&state==B)begin
            next_state<=A;
        end
        
        else if(in==1&&state==B)begin
            next_state<=B;
        end
        else begin
            next_state<=A;
        end
    end

    always @(posedge clk, posedge areset) begin
        if(areset)begin
           state<=B;
        end
        else begin
            state<=next_state;
        end
    end
        assign out=(state==A?0:1);

endmodule
