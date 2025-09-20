// Program using dynamic array
// 1. array1 : no of elements should be in between 30 to 40
// 2. array2 : sum of all elements < 100
// 3. array3 : sum of all elements > 100

class check;
  
  rand int unsigned dyn1[], dyn2[], dyn3[];
  rand int size;
  
  constraint dyn1_cons {
    size inside {[30:40]};
  }
  
  constraint dyn2_cons {
    dyn2.sum()<100;
  }
  
  constraint dyn3_cons {
    dyn3.sum()>100;
  }
  
  function void post_randomize();
    dyn1 = new[size];
    $display("dyn1.size(): %0d, dyn2.sum(): %0d, dyn3.sum(): %0d", dyn1.size(), dyn2.sum(), dyn3.sum());
  endfunction
  
endclass

module tb;
  
  check ck;
  
  initial begin
    ck = new();
    ck.dyn2 = new[10];
    ck.dyn3 = new[15];
    assert(ck.randomize()) else $error("FAILED");
  end
  
endmodule
