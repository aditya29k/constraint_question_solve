// Constraint to generate a random variable such that it does not repeat ever and toggle within 5 bits

class check;
  
  rand byte unsigned value;
  byte unsigned queue[$];
  
  function bit in_queue;
    input byte value;
    begin
      foreach(queue[i]) begin
        if(value == queue[i]) begin
          return 1;
        end
      end
      return 0;
    end
  endfunction
  
  constraint repeat_cons{
    !(in_queue(value));
  }
  
  constraint toggle_cons{
    $countones(queue[0]^value) == 5;
  }
  
  function void post_randomize();
    queue.push_front(value);
    $display("value:%b", this.value);
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
