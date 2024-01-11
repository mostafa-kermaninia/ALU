`timescale 1ns / 1ns
module structural_ALU (
    input [15:0] inA,
    inB,
    input inC,
    input [2:0] opc,
    output logic [15:0] outW,
    output logic zer,
    neg
);

  logic [15:0] Aprim, Bprim, Cprim, multiple_result;
  assign Aprim = (opc == 3'b000) ? ~inA : inA;
  assign Bprim = (opc == 3'b000 | opc == 3'b001) ? 16'b0 : (opc == 3'b010) ? inB : {inB[15], inB[15:1]};
  assign Cprim = (opc == 3'b000 | opc == 3'b001) ? 1'b1 : (opc == 3'b010) ? inC : 1'b0;
  assign multiple_result = Aprim + Bprim + Cprim;

  always @(inA, inB, inC, opc) begin
    outW = 16'b0;
    neg  = 1'b0;
    zer  = 1'b0;
    case (opc)
      3'b000:  outW = multiple_result;
      3'b001:  outW = multiple_result;
      3'b010:  outW = multiple_result;
      3'b011:  outW = multiple_result;
      3'b100:  outW = inA & inB;
      3'b101:  outW = inA | inB;
      3'b110:  outW = {inA[7:0], inB[7:0]};
      3'b111:  outW = 16'b0;
      default: outW = 16'b0;
    endcase

    neg = (outW[15]);
    zer = (outW == 16'b0);
  end


endmodule
