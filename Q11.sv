// Constraint to make array of size 5 to 10 and values in ascending order

class check;
  
  rand bit [2:0] dyn[];
  rand int size;
  
  constraint size_cons {
    size inside {[5:10]};
    dyn.size() == this.size;
  }
  
  constraint asscending_cons{
    foreach(dyn[i]){
      if(i<this.size-1)
        dyn[i]<dyn[i+1];
    }
  }
  
  function void post_randomize();
    $display("dyn: %0p", this.dyn);
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    ck = new();
    assert(ck.randomize()) else $error("FAILED");
  end
  
endmodule
