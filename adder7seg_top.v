module adder7seg_top(
    input  wire        clk,     // 100 MHz
    input  wire [15:0] sw,      // SW[3:0]=A, SW[7:4]=B
    output wire [6:0]  seg,     // a..g (active-low)
    output wire        dp,      // decimal point (active-low)
    output wire [3:0]  an       // an[0]=rightmost (active-low)
);
    // Inputs from switches
    wire [3:0] A   = sw[3:0];
    wire [3:0] B   = sw[7:4];

    wire [3:0] SUM;
    wire       CO;
    adder4_cla u_adder (
        .A (A),
        .B (B),
        .CI(1'b0),
        .SUM(SUM),
        .CO (CO)
    );

    // 5-bit sum 0..31
    wire [4:0] SUM5 = {CO, SUM};

    // Binary to BCD (tens, ones)
    wire [3:0] tens, ones;
    bin5_to_bcd u_b2b(
        .bin (SUM5),
        .tens(tens),
        .ones(ones)
    );

    // Two-digit scan
    seven_seg_mux u_mux(
        .clk     (clk),
        .ones_bcd(ones),
        .tens_bcd(tens),
        .an      (an),
        .seg     (seg),
        .dp      (dp)
    );
endmodule
