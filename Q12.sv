// Constraint 0-100 range 70% and for 101-255 range 30%

class check0;
  
  rand bit [7:0] val;
  
  constraint val_cons {
    val dist {[0:100] := 7, [101:255] := 3};
  }
  
endclass

// Without using inside value in range 34-43

class check1;
  
  rand bit [5:0] a;
  
  constraint val_cons {
    a>33;
    a<44;
  }
  
endclass

// 32 bit number with one bit set(donot use $countones)

class check2;
  
  rand bit [31:0] val;
  rand bit [4:0] i;
  
  constraint i_cons {
    i inside {[0:31]};
  }
  
  constraint val_cons {
    foreach(val[j])
      if(j != i)
        val[j] == 1'b0;
      else
        val[j] == 1'b1; // or we can use 2**size in post
  }
  
endclass

module tb;
  
  check2 ck;
  
  initial begin
    ck = new();
    if(ck.randomize()) $display("value:%0b", ck.val);
  end
  
endmodule
