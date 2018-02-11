/*
  Project: RECON 2018
  Author: Jeff Lieu <lieumychuong@gmail.com>
  Description: recon_2_top level
*/

/* Note that the PORT_0_WIDTH doesn't propagate to the NIOS system */
module recon_2_top #(parameter PORT_0_WIDTH = 32) (
  input sys_clk,
  input sys_rstn,
  
  inout [       PORT_0_WIDTH-1:0] port_0_io, 
  output                          uart_0_txd,
  input                           uart_0_rxd,
  
  output          sdram_0_clk,
  output	[11:0]	sdram_0_addr,
  output	[1:0]	  sdram_0_ba,
  output		      sdram_0_cas_n,
  output		      sdram_0_cke,
	output		      sdram_0_cs_n,
	inout	  [15:0]	sdram_0_dq,
	output	[1:0]	  sdram_0_dqm,
	output		      sdram_0_ras_n,
	output		      sdram_0_we_n
  );

  wire [PORT_0_WIDTH-1:0] port_0_out; 
  wire [PORT_0_WIDTH-1:0] port_0_in; 
  wire [PORT_0_WIDTH-1:0] port_0_oe; 
  wire [PORT_0_WIDTH-1:0] port_0_opdrn; 
  wire cpu_clk, locked;
  
  /*
  PLL is put at the top to be shared across boards
  THe output of the CPU clock is required to be 80MHz
  */
  alt_pll pll(
	.areset   (~sys_rstn),
	.inclk0   (sys_clk),
	.c0       (cpu_clk),
  .c1       (sdram_0_clk),
	.locked   (locked));
  
  buttonDebouncer
  #(  /* Debounce time - Count in nanosecond */
    .pDEBOUNCE_PERIOD     (100_000_000),
    /* Clock Input period - Count in nanosecond */
    .pCLKIN_PERIOD        (20         ),
    /* Size of  button array */
    .pARRAY_SIZE          (1          ),
    /* 
      Polarity configures the edge detection which edge would cause a tick  
      Buttons are default to active low, which means a "Button Down" event is generated when the signal level fall from High to Low 
      Active high (pPOLARITY = 1) means a Button Down when the signal level changes from Low to High
    */
    .pPOLARITY            (0)) resetDebounce 
  (  
    .clk                  (sys_clk),
    .buttons              (sys_rstn), 
    .buttonState          (sys_rstn_db),  /* In Verilog, you can have an implied net declaration */
    .buttonUpTick         (),
    .buttonDwTick         ()
  );
  
  /* NIOS System - Configured and Generated by QSYS */
    recon_2 (
    .clk_clk                              (cpu_clk),               //                      clk.clk
    .recon_io_0_io_port_io_out            (port_0_out),            //       recon_io_0_io_port.io_out
    .recon_io_0_io_port_io_opdrn          (port_0_opdrn),          //                         .io_opdrn
    .recon_io_0_io_port_io_in             (port_0_in),             //                         .io_in
    .recon_io_0_io_port_io_oe             (port_0_oe),             //                         .io_oe
    .recon_timer_0_clock_tick_second      (),                      // recon_timer_0_clock_tick.second
    .recon_timer_0_clock_tick_millisecond (),                      //                         .millisecond
    .recon_timer_0_clock_tick_microsec    (),                      //                         .microsec
    .reset_reset_n                        (sys_rstn_db),           //                    reset.reset_n
    .uart_0_rxd                           (uart_0_rxd),
    .uart_0_txd                           (uart_0_txd),
    .sdram_0_addr                         (sdram_0_addr ),  								
    .sdram_0_ba                           (sdram_0_ba   ),
    .sdram_0_cas_n                        (sdram_0_cas_n),
    .sdram_0_cke                          (sdram_0_cke  ),
    .sdram_0_cs_n                         (sdram_0_cs_n ),
    .sdram_0_dq                           (sdram_0_dq   ),
    .sdram_0_dqm                          (sdram_0_dqm  ),
    .sdram_0_ras_n                        (sdram_0_ras_n),
    .sdram_0_we_n                         (sdram_0_we_n )
  );
  /* You can Insert your own Debouncer for the Button Here if required */    
  genvar IO;
  generate 
  for (IO = 0; IO<PORT_0_WIDTH;IO=IO+1) 
  begin : assign_io
    assign port_0_io[IO] = (port_0_oe[IO]==1'b0||(port_0_out[IO]==1'b1&&port_0_opdrn[IO]==1'b1))?1'bz:port_0_out[IO];
    assign port_0_in[IO] = port_0_io[IO];
  end
  endgenerate
  
  
endmodule 
