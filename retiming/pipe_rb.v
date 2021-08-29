module pipe_rb (
    output o_data,
    input [7:0] i_data,
    input i_rst,
    input i_clk);

    reg [3:0] temp_data_r;
    reg out;

    assign o_data = out;
    
    always @(posedge i_clk)
        if(i_rst) begin
            temp_data_r <= 0;
            out <= 0;
        end else begin
            temp_data_r[0] <= i_data[0] | i_data[1];
            temp_data_r[1] <= i_data[2] | i_data[3];
            temp_data_r[2] <= i_data[4] | i_data[5];
            temp_data_r[3] <= i_data[6] | i_data[7];
            out <= (temp_data_r[0]) & (temp_data_r[1]) & (temp_data_r[2]) & (temp_data_r[3]);
        end
endmodule : pipe_rb
