module simple_adder (
    output o_data,
    input i_data[0:2],
    input i_sel);
    assign o_data =  i_sel ? i_data[0] + i_data[1] : i_data[0] + i_data[2];
endmodule : simple_adder
