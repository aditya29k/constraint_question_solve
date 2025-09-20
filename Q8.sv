// constraint to gnerate random variable not equal to last 5 values

class check;
  
  randc bit [3:0] a;
  bit [3:0] queue[$];
  
  function bit in_queue;
    input bit [3:0] a;
    begin
      foreach(queue[i]) begin
        if(a == queue[i]) begin
          return 1;
        end
      end
      return 0;
    end
  endfunction
  
  constraint diff_cons{
    !(in_queue(a));
  }
  
  function void post_randomize();
    
    queue.push_front(this.a);
    
    $display("Value: %0d", this.a);
    
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    
    ck = new();
    ck.constraint_mode(0);
    assert(ck.randomize()) else $error("FAILED");
    ck.constraint_mode(1);
    repeat(10) assert(ck.randomize()) else $error("FAILED");
  end
  
endmodule

// using rand i was getting error about repeatetion of value(because bit length is small): use randc for this error
