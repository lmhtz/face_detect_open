// Copyright (c) 2018  LulinChen, All Rights Reserved
// AUTHOR : 	LulinChen
// AUTHOR'S EMAIL : lulinchen@aliyun.com 
// Release history
// VERSION Date AUTHOR DESCRIPTION

`ifndef	INC_GLOBAL
`define	INC_GLOBAL

`ifdef TIMESCALE_PS	
	`timescale 1ps/1ps
	`define TIME_COEFF		1000
`else
	`timescale 1ns/1ps
	`define TIME_COEFF		1
`endif

`define DRAW_2PIXEL_WIDE

`define 	MAX_PT  128

`define W_AFRAMEBUF 17
`define FRAME_BUF_LINE 512
`define W_FRAME_COL 8
`define W_FRAME_ROW 8


`ifdef SIMULATION_FREQ_133MHZ
	`define	CLK_PERIOD_DIV2			(3.750*`TIME_COEFF) 		// 133.3 MHz
`elsif SIMULATION_FREQ_333MHZ
	`define	CLK_PERIOD_DIV2			(1.500*`TIME_COEFF) 		// 333.3 MHz
`elsif SIMULATION_FREQ_200MHZ
	`define	CLK_PERIOD_DIV2			(2.500*`TIME_COEFF) 		// 200.0 MHz
`elsif SIMULATION_FREQ_300MHZ
	`define	CLK_PERIOD_DIV2			(1.670*`TIME_COEFF) 		// 300MHz
`elsif SIMULATION_FREQ_275MHZ
	`define	CLK_PERIOD_DIV2			(1.800*`TIME_COEFF) 		// 275MHz
`elsif SIMULATION_FREQ_250MHZ
	`define	CLK_PERIOD_DIV2			(2.000*`TIME_COEFF) 		// 250MHz	
`else
	`define	CLK_PERIOD_DIV2			(2.500*`TIME_COEFF) 		// 200.0 MHz
`endif 	
`define	CLOCK_PERIOD		(  2 * `CLK_PERIOD_DIV2)
`define	RESET_DELAY			(200 * `CLOCK_PERIOD   )


`define MAX_PIC_WIDTH	2048
// in 8x8 size
`define W_PWInMbs 	 8 - 1  //   1280x720
`define W_PHInMbs 	 8 - 1  // 


`define W_PWInMbsM1		 `W_PWInMbs
`define W_PHInMbsM1		 `W_PHInMbs

`define	W_PICMBS	(`W_PWInMbs + `W_PHInMbs + 1)

`define W_PW	`W_PWInMbs+3     // 11-1 
`define W_PH	`W_PHInMbs+3	 // 11-1





`define W1                 7
`define W2                15
`define W3                23
`define W4                31
`define W5                39
`define W6                47
`define W7                55
`define W8                63
`define W9                71
`define W10               79
`define W11               87
`define W12               95
`define W13              103
`define W14              111
`define W15              119
`define W16              127
`define W17              135
`define W18              143
`define W19              151
`define W20              159
`define W21              167
`define W22              175
`define W23              183
`define W24              191
`define W25              199
`define W26              207
`define W27              215
`define W28              223
`define W29              231
`define W30              239
`define W31              247
`define W32              255
`define W48              383
`define W64              511
`define W63              503
`define W71				 567
`define W72				 575
`define W78				 623
`define W79				 631	
`define W80			     639
`define W128            1023
`define W256            2047
`define W512            4095

`define W1P                 (`W1  + 1)          // P = Plus1
`define W2P                 (`W2  + 1)
`define W3P                 (`W3  + 1)
`define W4P                 (`W4  + 1)
`define W5P                 (`W5  + 1)
`define W6P                 (`W6  + 1)
`define W7P                 (`W7  + 1)
`define W8P                 (`W8  + 1)
`define W9P                 (`W9  + 1)
`define W10P                (`W10 + 1)
`define W11P                (`W11 + 1)
`define W12P                (`W12 + 1)
`define W13P                (`W13 + 1)
`define W14P                (`W14 + 1)
`define W15P                (`W15 + 1)
`define W16P                (`W16 + 1)
`define W17P                (`W17 + 1)
`define W18P                (`W18 + 1)
`define W19P                (`W19 + 1)
`define W20P                (`W20 + 1)
`define W32P                (`W32 + 1)
`define W48P                (`W48 + 1)
`define W64P                (`W64 + 1)

 
`define W_SIZE		   24   // windows  size

`define TATAL_WEAK_STAGES		   2913   // windows  size

`define WII                (`W1 + 10)   // integral image data width  according to subwindow size 24x24 10bit
`define WSII               (`W1 + `W1P + 10)   // squared integral image data width  according to subwindow size 24x24 10bit
`define W_VAR              (`W1 + `W1P + 10)   // variant data width
`define W_TREE             13   // right_tree  left_tree data width
`define W_ACC              21   // right_tree  left_tree data width
`define STAGE_N            25   // right_tree  left_tree data width
`define W_WEIGHT		   14
`define W_WEAK_TH		   12
`define W_STRONG_TH		   11

`define W_CAMD_I  `W2
`define BD_OFFSET						0 



`define RST_CAM				!rstn_cam

`ifdef SIMULATING
	`define RST          !rstn
	`define ZST          1'b0
	`define ZST_CAM			1'b0
	`define CLK_RST_EDGE posedge clk
	`define CLK_EDGE     posedge clk
	`define RST_EDGE
	`define RST_EDGE_CAM	or negedge rstn_cam
	`define RESET_ACTIVE 1'b0
	`define RESET_IDLE   1'b1
`elsif FPGA_0_XILINX
	`define RST          !rstn
	`define ZST          1'b0
	`define ZST_CAM			1'b0
	`define CLK_RST_EDGE posedge clk
	`define CLK_EDGE     posedge clk
	`define RST_EDGE
	`define RST_EDGE_CAM 	
	`define RESET_ACTIVE 1'b0
	`define RESET_IDLE   1'b1
`else
	`define RST          !rstn
	`define ZST          !rstn
	`define ZST_CAM			!rstn_cam
	`define CLK_RST_EDGE posedge clk or negedge rstn
	`define CLK_EDGE     posedge clk
	`define RST_EDGE    
	`define RST_EDGE_CAM	or negedge rstn_cam
	`define RESET_ACTIVE 1'b0
	`define RESET_IDLE   1'b1
`endif

`endif