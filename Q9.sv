// Constraint to generate 0,1,x,z randomly

class check;
  
  typedef enum {s0, s1, s2, s3} state;
  rand state val;
  logic out;
  rand bit sel;
  
  constraint sel_cons {
    sel dist {1:=20, 0:=80};
  }
  
  constraint state_cons {
    if(sel)
      val inside {s0, s1};
    else 
      val inside {s2, s3};
  }
  
  function void post_randomize();
    case(val)
      s0: out = 1'b0;
      s1: out = 1'b1;
      s2: out = 1'bx;
      s3: out = 1'bz;
    endcase
    $display("sel: %0d, val: %0s, out: %0b", this.sel, this.val, this.out);
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    ck = new();
    repeat(10) assert(ck.randomize()) else $error("FAILED"); 
  end
  
endmodule
