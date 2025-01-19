module hour(
    input clk,              // Clock input
    input load,             // Load control signal
    input clear,            // Clear signal to reset the counter
    input enable,           // Enable signal for the counter
    input [5:0] data,       // 6-bit input data for loading values
    output reg [5:0] hour,  // 6-bit counter for hours (0-23)
    output [5:0] databus    // 6-bit output data bus
);

// Internal wires for control signals
wire [5:0] restart, en, ld;
assign restart = {6{hour[5] && (~hour[4]) && hour[3] && hour[2] && hour[1] && hour[0]}}; // 23 in binary
assign en = {6{enable}};
assign ld = {6{load}};

// Initialize the hour counter to 0
initial begin
    hour = 6'h0;
end

// Sequential logic for the hour counter
always @ (posedge clk or posedge clear) begin
    hour <= (clear) ? 6'h0 : ((~restart) & (hour + 1) & (~ld) | (ld & data));
end

// Output the hour value to the databus when enabled
assign databus = en & hour;

endmodule
