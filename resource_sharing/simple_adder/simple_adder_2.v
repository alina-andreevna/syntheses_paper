module simple_adder_2 (
    output o_data,
    input i_data[0:2],
    input i_sel);
    wire temp_sum;
    assign temp_sum = i_sel ? i_data[1] : i_data[2];
    assign o_data =  i_data[0] + temp_sum;
endmodule : simple_adder_2
