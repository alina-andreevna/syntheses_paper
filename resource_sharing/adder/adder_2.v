module adder_2 (
    output o_data,
    input i_data[0:2],
    input [1:0] i_sel);
    wire add_input [0:1];
    
    assign add_input[0] = (i_sel == 2) ? i_data[1] : i_data[0];
    assign add_input[1] = (i_sel == 0) ? i_data[1] : (i_sel == 3) ? 0 : i_data[2];
    assign o_data = add_input[0] + add_input[1];
endmodule : adder_2

