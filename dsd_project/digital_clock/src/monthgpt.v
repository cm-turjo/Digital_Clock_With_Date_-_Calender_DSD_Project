module month(
    input clk,               // Clock input
    input load,              // Load control signal
    input clear,             // Clear signal to reset the counter
    input enable,            // Enable signal for the counter
    input [3:0] data,        // 4-bit input data for loading values (1-12)
    output reg [3:0] month,  // 4-bit counter for months (1-12)
    output [3:0] databus     // 4-bit output data bus
);

// Internal wires for control signals
wire [3:0] restart, en, ld;
assign restart = {4{month[3] && month[2] && (~month[1]) && (~month[0])}}; // 12 in binary
assign en = {4{enable}};
assign ld = {4{load}};

// Initialize the month counter to 1
initial begin
    month = 4'h1;
end

// Sequential logic for the month counter
always @ (posedge clk or posedge clear) begin
    month <= (clear) ? 4'h1 : ((~restart) & (month + 1) & (~ld) | (ld & data));
end

// Output the month value to the databus when enabled
assign databus = en & month;

endmodule
