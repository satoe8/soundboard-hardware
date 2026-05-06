module debouncer #(parameter COUNT_MAX = 100_000) (
    input  logic clk,
    input  logic btn_in,
    output logic btn_out
);
    logic [16:0] count;
    logic btn_reg;

    always_ff @(posedge clk) begin
        if (btn_in == btn_reg) begin
            count <= 0;
        end else begin
            count <= count + 1;
            if (count >= COUNT_MAX) begin
                btn_reg <= btn_in;
                count <= 0;
            end
        end
    end
    assign btn_out = btn_reg;
endmodule
