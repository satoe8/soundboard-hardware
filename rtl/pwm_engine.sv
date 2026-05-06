module pwm_engine (
    input  logic clk,         // 100MHz Basys 3 Clock
    input  logic [7:0] sample,// 8-bit PCM data
    output logic pwm_out
);
    logic [7:0] counter = 0;

    always_ff @(posedge clk) begin
        counter <= counter + 1;
        pwm_out <= (sample > counter) ? 1'b1 : 1'b0;
    end
endmodule
