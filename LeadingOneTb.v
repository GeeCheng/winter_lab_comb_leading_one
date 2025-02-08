`include "LeadingOne.v"
`define PERIOD 10

module LeadingOneTb;

  /////////////////////////
  // Signal Declarations //
  /////////////////////////
  reg  [8:0] number_i;
  reg        clk_i;
  wire [3:0] index_o;

  ///////////////////////
  // DUT Instantiation //
  ///////////////////////
  LeadingOne U_LeadingOne(
    .number_i(number_i),
    .index_o (index_o)
  );

  ////////////////////////////
  // Variables for File I/O //
  ////////////////////////////
  integer error = 0;
  integer file;
  integer expected;
  integer status;

  //////////////////////
  // Clock Generation //
  //////////////////////
  initial clk_i = 0;
  always #(`PERIOD) clk_i = ~clk_i; // 10ns clock period

  ////////////////////////
  // Main Test Sequence //
  ////////////////////////
  initial begin

    ///////////////////////////////////////////
    // Open answer file and check for errors //
    ///////////////////////////////////////////
    $dumpfile("LeadingOneTb.vcd");
    $dumpvars(0, LeadingOneTb);

    file = $fopen("answer.txt", "r");
    if (file == 0) begin
      $display("Error: could not open file");
      $finish;
    end

    ///////////////////
    // Test Sequence //
    ///////////////////
    for (integer i = 9'd0; i <= 9'b111111111; i = i + 1) begin
      number_i = i;
      @(posedge clk_i);
      status = $fscanf(file, "%d\n", expected);
      if (status == 0) begin
        $display("Error: could not read from file");
        error = error + 1;
      end
      if (index_o !== expected) begin
        $display("Error: expected %d, got %d", expected, index_o);
        error = error + 1;
      end
    end

    //////////////////
    // Test Summary //
    //////////////////
    if (error == 0) begin
      $display("All tests passed");
    end else begin
      $display("Error: %d tests failed", error);
    end

    $finish;
  end

endmodule
