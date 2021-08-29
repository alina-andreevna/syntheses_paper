module sums #(parameter I_DATA_W = 32,
              parameter O_DATA_W = 39,
              parameter I_DATA_SIZE = 8,
              parameter O_REG_NUMBER = 5)(
    input   i_clk,
    input   [I_DATA_W-1:0]  i_data [I_DATA_SIZE],
    input   i_operation_code,
    output  [O_DATA_W-1:0]  o_data             );

    reg [I_DATA_W-1:0] i_sum [I_DATA_SIZE];

    localparam NUM_SUM = I_DATA_SIZE-1;
    wire [O_DATA_W-1:0] result [NUM_SUM];

    reg [O_DATA_W-1:0] result_shifted [O_REG_NUMBER];


    assign o_data = result_shifted[O_REG_NUMBER-1];
    assign result[0] = i_operation_code ? i_sum[0] + i_sum[1] : i_sum[0] - i_sum[1];

  
    generate
        for (genvar j=1; j<NUM_SUM; j++)
            assign result[j] = i_operation_code ? result[j-1] + i_sum[j+1] : result[j-1] - i_sum[j+1];
    endgenerate

    generate
    always @(posedge i_clk)
        for (int j=0; j<I_DATA_SIZE; j++)
            i_sum[j] <= i_data[j];
    endgenerate
    

    always @(posedge i_clk)
        result_shifted[0] <= result[NUM_SUM-1];
        
    generate
    always @(posedge i_clk)
        for (int j=1; j<O_REG_NUMBER; j++)
            result_shifted[j] <= result_shifted[j-1];
    endgenerate


endmodule : sums