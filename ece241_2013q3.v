//this is incorrect not sure about why
module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg state,next_state;
    parameter [3:0]A=0,B=1,C=2,D=3,E=4,F=5;
    always@(*)begin
        case(state)
            A:if(s==3'b001)begin
             	next_state=B;
            end
            else begin
                next_state=A;
            end
            B:if(s==3'b011)begin
                next_state=C;
            end
            else if(s==3'b001) begin
                next_state=B;
            end
            else begin
                next_state=A;
            end
            C:if(s==3'b111)begin
                next_state=D;
            end
            else if(s==3'b011)begin
                next_state=C;
            end
            else begin
                next_state=F;
            end
            D:if(s==3'b111)begin
                next_state=D;
            end
            else begin
                next_state=E;
            end
            E:if(s==3'b111)begin
                 next_state=D;
            end
            else if(s==3'b011)begin
                next_state=E;
            end
            else begin
                next_state=F;
            end
            F:if(s==3'b011)begin
                next_state=C;
            end 
            else if(s==3'b001)begin
                next_state=F;
            end
            else begin
                next_state=A;
            end
			endcase
        end
    always@(posedge clk)begin
        if(reset)
           state<=A;
        else
           state<=next_state;
    end
    assign fr1=(state==D)?0:1;
    assign fr2=(state==C||state==D||state==E)?0:1;
    assign fr3=(state==A)?1:0;
    assign dfr=(state==A||state==E||state==F)?1:0;

endmodule

