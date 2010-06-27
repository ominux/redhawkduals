/*

This software/hardware design was originally created by Peter Jamieson
jamiespa@muohio.edu  http://www.users.muohio.edu/jamiespa/

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

*/ 
module seg7(in,out);

input [3:0]in;
output [6:0]out; // a, b, c, d, e, f, g
wire [6:0]out; // a, b, c, d, e, f, g

assign out[0] = int_out[6];
assign out[1] = int_out[5];
assign out[2] = int_out[4];
assign out[3] = int_out[3];
assign out[4] = int_out[2];
assign out[5] = int_out[1];
assign out[6] = int_out[0];

reg [6:0]int_out;

// HEX out - rewire DE2
//  ---a---
// |       |
// f       b
// |       |
//  ---g---
// |       |
// e       c
// |       |
//  ---d---


// HEX int_out
//  ---a---
// |       |
// f       b
// |       |
//  ---g---
// |       |
// e       c
// |       |
//  ---d---

always @(in)
begin
	case (in)	    // abcdefg
		4'h0: int_out = 7'b0000001;
		4'h1: int_out = 7'b1001111;
		4'h2: int_out = 7'b0010010;
		4'h3: int_out = 7'b0000110;
		4'h4: int_out = 7'b1001100;
		4'h5: int_out = 7'b0100100;
		4'h6: int_out = 7'b0100000;
		4'h7: int_out = 7'b0001111;
		4'h8: int_out = 7'b0000000;
		4'h9: int_out = 7'b0000100;
		4'ha: int_out = 7'b0001000;
		4'hb: int_out = 7'b1100000;
		4'hc: int_out = 7'b0110001;
		4'hd: int_out = 7'b1000010;
		4'he: int_out = 7'b0110000;
		4'hf: int_out = 7'b0111000;
	endcase
end

endmodule
