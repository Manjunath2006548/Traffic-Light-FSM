`timescale 1ns/1ps

module traffic_controller(
    input  wire clk,
    input  wire rst,
    input  wire emergency,
    input  wire pedestrian,
    output reg  [1:0] state,
    output wire red,
    output wire green,
    output wire yellow
);

    // State encoding
    localparam RED    = 2'b00;
    localparam GREEN  = 2'b01;
    localparam YELLOW = 2'b10;

    reg [7:0] count;
    reg [1:0] next_state;

    // ==========================
    // State Register (Sequential)
    // ==========================
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RED;
            count <= 0;
        end
        else begin
            state <= next_state;

            if (state != next_state)
                count <= 0;
            else
                count <= count + 1;
        end
    end

    // ==========================
    // Next-State Logic
    // ==========================
    always @(*) begin
        next_state = state;  // default stay

        case (state)

            RED: begin
                if (count >= 20)
                    next_state = GREEN;
            end

            GREEN: begin
                if (emergency)
                    next_state = RED;
                else if (pedestrian)
                    next_state = YELLOW;
                else if (count >= 20)
                    next_state = YELLOW;
            end

            YELLOW: begin
                if (count >= 10)
                    next_state = RED;
            end

            default: next_state = RED;

        endcase
    end

    // ==========================
    // Output Logic
    // ==========================
    assign red    = (state == RED);
    assign green  = (state == GREEN);
    assign yellow = (state == YELLOW);

endmodule
