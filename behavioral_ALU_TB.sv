`timescale 1ns / 1ns
module behavioral_ALU_TB ();
  logic [15:0] a = 0, b = 0;
  logic c = 0;
  logic [2:0] o = 7;
  wire [15:0] w, w_synth;
  wire z, n, z_synth, n_synth;
  int opcCounter;
  behavioral_ALU CUT1 (
      .inA (a),
      .inB (b),
      .inC (c),
      .opc (o),
      .outW(w),
      .zer (z),
      .neg (n)
  );
  behavioral_ALU_synth CUT2 (
      .inA (a),
      .inB (b),
      .inC (c),
      .opc (o),
      .outW(w_synth),
      .zer (z_synth),
      .neg (n_synth)
  );
  initial begin
    for (opcCounter = 0; opcCounter < 8; opcCounter = opcCounter + 1) begin
      o = opcCounter;
      repeat (5) begin
        #500 a = $random;
        #500 b = $random;
        #500 c = $random;
        #500;
      end
    end
  end
endmodule
