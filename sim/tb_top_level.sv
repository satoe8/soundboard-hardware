`timescale 1ns / 1ps

module tb_top_level();
    // Signal declarations
    logic clk;
    logic [3:0] btn;
    logic audio_out;

    // Instantiate Unit Under Test (UUT)
    top_level uut (
        .clk(clk),
        .btn(btn),
        .audio_out(audio_out)
    );

    // Clock generation: 100MHz (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        btn = 4'b0000;

        // Wait for global reset/initialization
        #100;

        // Simulate pressing Button 0
        $display("Simulating Button 0 press...");
        btn[0] = 1;
        #2000000; // Hold for 2ms to pass debouncer logic
        btn[0] = 0;

        // Observe waveform behavior
        #500000;
        
        $display("Simulation complete. Check waveforms for PWM activity.");
        $finish;
    end

    // Monitor for Waveform Analysis (GTKWave/Vivado)
    initial begin
        $dumpfile("simulation.vcd");
        $dumpvars(0, tb_top_level);
    end
endmodule
