
module seven_seg_mux(
    input  wire       clk,       // 100 MHz
    input  wire [3:0] ones_bcd,  // rightmost digit
    input  wire [3:0] tens_bcd,  // next digit
    output reg  [3:0] an,        // active-low anodes
    output wire [6:0] seg,       // active-low segments
    output wire       dp         // active-low decimal point (kept OFF)
);
    reg [15:0] div = 16'd0;
    always @(posedge clk)
        div <= div + 16'd1;

    wire sel = div[15];  // toggles active digit 

    // Enable one digit at a time 
    always @* begin
        case (sel)
            1'b0: an = 4'b1110;   // AN0 on
            1'b1: an = 4'b1101;   // AN1 on
        endcase
    end

    wire [3:0] cur_bcd = sel ? tens_bcd : ones_bcd;

    seven_seg_decoder u_dec(
        .bcd(cur_bcd),
        .seg(seg)
    );

    assign dp = 1'b1; // OFF
endmodule

