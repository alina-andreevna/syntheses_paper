module adder (
    output reg o_data,
    input i_data[0:2],
    input [1:0] i_sel);
    
    always @ (i_sel, i_data)
        case (i_sel)
            2'b00 : o_data <= i_data[0] + i_data[1];
            2'b01 : o_data <= i_data[0] + i_data[2];
            2'b10 : o_data <= i_data[1] + i_data[2];
            2'b11 : o_data <= i_data[0];
        endcase
endmodule : adder
