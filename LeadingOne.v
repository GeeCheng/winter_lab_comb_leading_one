module LeadingOne(
  input  wire [8:0] a,
  output reg  [3:0] index
);

  always @* begin
    if (a[8] == 1) begin
      index = 4'd8;
    end else if (a[7] == 1) begin
      index = 4'd7;
    end else if (a[6] == 1) begin
      index = 4'd6;
    end else if (a[5] == 1) begin
      index = 4'd5;
    end else if (a[4] == 1) begin
      index = 4'd4;
    end else if (a[3] == 1) begin
      index = 4'd3;
    end else if (a[2] == 1) begin
      index = 4'd2;
    end else if (a[1] == 1) begin
      index = 4'd1;
    end else if (a[0] == 1) begin
      index = 4'd0;
    end else begin
      index = -1;
    end
  end

endmodule
