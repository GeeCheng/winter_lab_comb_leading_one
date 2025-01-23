`include "LeadingOne.v"

module LeadingOneTb;
  reg  [8:0] a;
  wire [3:0] index;

  LeadingOne U_LeadingOne(
    .a(a),
    .index(index)
  );

  integer error = 0;
  integer file;
  integer expected;
  integer status;

  initial begin
    $dumpfile("LeadingOneTb.vcd");
    $dumpvars(0, LeadingOneTb);

    file = $fopen("answer.txt", "r");
    if (file == 0) begin
      $display("Error: could not open file");
      $finish;
    end

    for (integer i = 9'd0; i <= 9'b111111111; i = i + 1) begin
      a = i;
      #10;
      status = $fscanf(file, "%d\n", expected);
      if (status == 0) begin
        $display("Error: could not read from file");
        error = error + 1;
      end
      if (index !== expected) begin
        $display("Error: expected %d, got %d", expected, index);
        error = error + 1;
      end
    end

    if (error == 0) begin
      $display("All tests passed");
    end else begin
      $display("Error: %d tests failed", error);
    end

    $finish;
  end

endmodule
