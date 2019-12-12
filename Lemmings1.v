module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        if(bump_left&&bump_right)begin
            next_state=(state==LEFT)?RIGHT:LEFT;
        end
        else if(bump_left)begin
            next_state=RIGHT;
        end
        else if(bump_right)begin
            next_state=LEFT;
        end
        else begin
            next_state=state;
        end
            
    end

    always @(posedge clk, posedge areset) begin
        if(areset)begin
            state<=LEFT;
        end
        else begin
            state<=next_state;
        end
    end

    // Output logic
    assign walk_left = (state == LEFT)?1:0;
    assign walk_right = (state == RIGHT)?1:0;

endmodule

