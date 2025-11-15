`timescale 1ns/1ps

module processor_tb;
  // parameters (match your DUT)
  parameter WIDTH = 32;
  parameter MEM_FILE = "program.hex"; // <-- edit this to point to your .hex file
  parameter CLK_PERIOD = 10;          // ns, 100 MHz
  parameter TIMEOUT_CYCLES = 20000;   // stop simulation after this many cycles

  // DUT I/O nets
  reg  clock = 0;
  reg  reset = 1;
  reg  memEn = 0;
  reg  [WIDTH-1:0] memData = 0;
  reg  [WIDTH-1:0] memAddr = 0;
  wire [WIDTH-1:0] gp, a7, a0;

  // Instantiate DUT (explicit port connections)
  processor #(.WIDTH(WIDTH)) dut (
    .clock(clock),
    .reset(reset),
    .memEn(memEn),
    .memData(memData),
    .memAddr(memAddr),
    .gp(gp),
    .a7(a7),
    .a0(a0)
  );

  integer i;

  // Simple clock
  always #(CLK_PERIOD/2) clock = ~clock;

  // Load memory, pulse reset, then let it run
  initial begin

    // Preload memory inside DUT.
    // IMPORTANT: your file must be the output from /programs/convert.py
    #1;
    $display("[%0t] Loading memory from %s ...", $time, MEM_FILE);
    $readmemh(MEM_FILE, dut.mainMemory);

    // Initialize all registers to 0
    for (i = 0; i < 32; i = i + 1)
        dut.registers[i] = 32'b0;
    // --------------------------------

    // Keep reset asserted for two clock edges
    reset = 1;
    repeat (2) @(posedge clock);
    reset = 0;
    $display("[%0t] Released reset, processor running.", $time);
  end

endmodule
