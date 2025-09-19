// Unique value between 99 and 100
class check;
  
  rand int val;
  real out;
  
  constraint val_cons {
    val inside {[990:1000]};
  }
  
  function void post_randomize();
    out = val/10.0;
    $display("out:%0f", this.out);
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    repeat(5) begin
      ck = new();
      assert(ck.randomize()) else $error("FAILED");
    end
    $finish();
  end
  
endmodule
