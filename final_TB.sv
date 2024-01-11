`timescale 1ns / 1ns
module Final_TB ();
  logic [15:0] a = 0, b = 0;
  logic c = 0;
  logic [2:0] o = 7;
  wire [15:0] w_beh, w_beh_synth, w_struc, w_struc_synth;
  wire z_beh, n_beh, z_beh_synth, n_beh_synth, n_struc, z_struc, n_struc_synth, z_struc_synth;
  int opcCounter;
  behavioral_ALU CUT1 (
      .inA (a),
      .inB (b),
      .inC (c),
      .opc (o),
      .outW(w_beh),
      .zer (z_beh),
      .neg (n_beh)
  );
  behavioral_ALU_synth CUT2 (
      .inA (a),
      .inB (b),
      .inC (c),
      .opc (o),
      .outW(w_beh_synth),
      .zer (z_beh_synth),
      .neg (n_beh_synth)
  );
  structural_ALU CUT3 (
      .inA (a),
      .inB (b),
      .inC (c),
      .opc (o),
      .outW(w_struc),
      .zer (z_struc),
      .neg (n_struc)
  );
  structural_ALU_synth CUT4 (
      .inA (a),
      .inB (b),
      .inC (c),
      .opc (o),
      .outW(w_struc_synth),
      .zer (z_struc_synth),
      .neg (n_struc_synth)
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
