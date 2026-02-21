`timescale 1ns/1ps

module traffic_tb;

    reg clk;
    reg rst;
    reg emergency;
    reg pedestrian;

    wire [1:0] state;
    wire red;
    wire green;
    wire yellow;

    // Instantiate DUT
    traffic_controller uut (
        .clk(clk),
        .rst(rst),
        .emergency(emergency),
        .pedestrian(pedestrian),
        .state(state),
        .red(red),
        .green(green),
        .yellow(yellow)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, traffic_tb);

        clk = 0;
        rst = 1;
        emergency = 0;
        pedestrian = 0;

        #20 rst = 0;

        // Normal cycle
        #300;

        // Pedestrian trigger
        pedestrian = 1;
        #20;
        pedestrian = 0;

        #300;

        // Emergency trigger
        emergency = 1;
        #20;
        emergency = 0;

        #300;

        $finish;
    end

endmodule
