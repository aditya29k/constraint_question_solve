// Divisibility by 5

class check;
  
  rand int unsigned value;
  
  constraint value_cons {
    value%5 == 0;
  }
  
  function void post_randomize();
    $display("Value: %0d", this.value);
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    ck = new();
    repeat(10) begin
      ck.randomize();
    end
  end
  
endmodule
