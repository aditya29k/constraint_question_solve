// Derive odd numbers within range of 10 to 30 using sv constraint

class check;
  
  rand bit [4:0] val;
  
  constraint val_range {
    val inside {[11:29]};
  }
  constraint val_odd {
    val%2 == 1;
  }
  
  function void post_randomize();
    $display("val:%0d", this.val);
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    ck = new();
    repeat(10) ck.randomize();
  end
  
endmodule
