//Constraint to draw print the pattern 0102030405

class check;
  
  rand bit [2:0] a;
  static int iter = 0;
  static int count = 1;
  
  constraint a_cons {
    if(iter%2 == 0)
      a == 0;
    else
      a == count;	
  }
  
  function void post_randomize();
    if(iter%2==0) begin
      iter++;
    end
    else begin
      iter++;
      count++;
    end	
    $display("a: %0d", this.a);
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    ck = new();
    repeat(10) begin
      assert(ck.randomize()) else $error("ERROR");
    end
  end
  
endmodule
