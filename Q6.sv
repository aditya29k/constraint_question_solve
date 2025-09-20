// Constraint for two random variable such that they do not match with each other

class check;
  
  rand byte unsigned a, b;
  
  constraint not_match_cons{
    a != b;
  }
  
  function void post_randomize();
    $display("a:%0d, b:%0d", this.a, this.b);
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    ck = new();
    assert(ck.randomize()) else $error("FAILED");
  end
  
endmodule
