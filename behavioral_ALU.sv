`timescale 1ns / 1ns
module behavioral_ALU (
    input [15:0] inA,
    inB,
    input inC,
    input [2:0] opc,
    output logic [15:0] outW,
    output logic zer,
    neg
);

  always @(inA, inB, inC, opc) begin
    outW = 0;
    neg  = 0;
    zer  = 0;
    case (opc)
      0: outW = ~inA + 1;
      1: outW = inA + 1;
      2: outW = inA + inB + inC;
      3: outW = inA + {inB[15], inB[15:1]};
      4: outW = inA & inB;
      5: outW = inA | inB;
      6: outW = {inA[7:0], inB[7:0]};
      7: outW = 0;
      default: outW = 0;
    endcase

    neg = (outW[15]);
    zer = (outW == 0);
  end

endmodule
