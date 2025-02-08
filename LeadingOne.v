module LeadingOne(
  input  wire [8:0] number_i,
  output reg  [3:0] index_o
);

  /////////////////////////
  // Combinational Logic //
  /////////////////////////
  always @* begin
    if (number_i[8] == 1) begin
      index_o = 4'd8;
    end else if (number_i[7] == 1) begin
      index_o = 4'd7;
    end else if (number_i[6] == 1) begin
      index_o = 4'd6;
    end else if (number_i[5] == 1) begin
      index_o = 4'd5;
    end else if (number_i[4] == 1) begin
      index_o = 4'd4;
    end else if (number_i[3] == 1) begin
      index_o = 4'd3;
    end else if (number_i[2] == 1) begin
      index_o = 4'd2;
    end else if (number_i[1] == 1) begin
      index_o = 4'd1;
    end else if (number_i[0] == 1) begin
      index_o = 4'd0;
    end else begin
      index_o = -1;
    end
  end

endmodule
