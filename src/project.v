/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_dennistrue_glhf (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Instantiate clk_submodule
  clk_submodule clk_go (
    .clk(clk),
    .rst_n(rst_n),
    .go_clk(go_clk),
    .sw_on(sw_on)
  );

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = assign uo_out = {6'b0, go_clk, sw_on};  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

endmodule
