module top_level (
    input  logic clk,           // Pin W5
    input  logic [3:0] btn,     // Pins U18, T18, W19, T17
    output logic audio_out      // Pin J1 (PMOD Header)
);
    logic [3:0] clean_btns;
    logic [7:0] current_sample;
    logic [15:0] addr;

    // Instantiate Debouncers for 4 buttons
    genvar i;
    generate
        for (i=0; i<4; i++) begin : debounce_gen
            debouncer db (.clk(clk), .btn_in(btn[i]), .btn_out(clean_btns[i]));
        end
    endgenerate

    // ROM to store audio data (8-bit samples)
    // In a real build, you'd use a .mem file here
    logic [7:0] sound_rom [0:65535]; 
    initial $readmemh("sounds.mem", sound_rom);

    // Simple FSM: If button pressed, increment address through sample range
    always_ff @(posedge clk) begin
        if (|clean_btns) addr <= addr + 1; // Simplistic play logic
        current_sample <= sound_rom[addr];
    end

    pwm_engine dac (
        .clk(clk),
        .sample(current_sample),
        .pwm_out(audio_out)
    );
endmodule
