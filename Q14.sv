// Write a constraint to randomly generate unique prime number in array between 1 and 200, the generated prime number should have 7 at the end

class check;
  
  randc bit unsigned [7:0] value;
  
  constraint limit_cons {
    value inside {[1:200]};
  }
  
  function bit is_prime;
    input bit unsigned [7:0] value;
    begin
      if(value<2) return 0;
      for(int i = 2; i<value/2; i++) begin // i*i <= value optimized
        if(value%i == 0) return 0;
      end
      return 1;
    end
  endfunction
  
  constraint prime_cons {
    (is_prime(value));
  }
  
  constraint include_7_cons {
    value%10 == 7;
  }
  
  function void post_randomize();
    $display("value: %0d", this.value);
  endfunction
  
endclass
module tb;
  
  check ck;
  
  initial begin
    ck = new();
    assert(ck.randomize()) else $error("FAILED");
  end
  
endmodule
