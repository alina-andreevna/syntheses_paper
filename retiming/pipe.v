module pipe (
    output o_data,
    input [7:0] i_data,
    input i_rst,
    input i_clk);

    reg [7:0] i_data_r;
    reg out;

    assign o_data = out;
    
    always @(posedge i_clk)
        if(i_rst) begin
            i_data_r <= 0;
            out <= 0;
        end else begin
            i_data_r <= i_data;
            out <= (i_data_r[0]|i_data_r[1]) & (i_data_r[2]|i_data_r[3]) &
            (i_data_r[4]|i_data_r[5]) & (i_data_r[6]|i_data_r[7]);
        end
endmodule : pipe
