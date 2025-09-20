// Constraint for generating random value for var1 [7:0] within 50, var2 [7:0] with non repeated value in every randmomization

class check;
  
  rand bit [7:0] var1;
  rand bit [7:0] var2;
  
  bit [7:0] queue[$];
  
  constraint var1_cons {
    var1 < 50;
  }
  
  function bit in_queue;
    input bit [7:0] var2;
    begin
      foreach(queue[j]) begin
        if(var2 == queue[j]) return 1;
      end
      return 0;
    end
  endfunction
  
  constraint var2_cons {
    !(in_queue(var2));
  }
  
  function void post_randomize();
    $display("var1: %0d, var2: %0d", this.var1, this.var2);
    queue.push_front(var2);
  endfunction
  
endclass
module tb;
  
  check ck;
  
  initial begin
    ck = new();
    ck.var2_cons.constraint_mode(0);
    assert(ck.randomize()) else $error("FAILED");
    ck.var2_cons.constraint_mode(1);
    repeat(10) assert(ck.randomize()) else $error("FAILED");
  end
  
endmodule
