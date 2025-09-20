// Write a constraint for 4 bit dynamic array. The size of array should be between 15 to 2-. There should be even number in odd locations and odd number in even locations

class check;
  
  rand bit [3:0] arr[];
  rand byte unsigned size;
  
  constraint arr_size{
    size inside {[15:20]};
  }
  
  constraint loc_cons{
    foreach(arr[i]){
      if(i%2==0)
        arr[i]%2 == 1;
      else
        arr[i]%2 == 0;
    }
  }
  
  function void post_randomize();
    $display("arr:%0p", this.arr);
  endfunction
 
endclass

module tb;
  
  check ck;
  
  initial begin
    ck = new();
    ck.loc_cons.constraint_mode(0);
    assert(ck.randomize()) else $error("FAILED");
    $display("size: %0d",ck.size);
    ck.arr = new[ck.size];
    ck.loc_cons.constraint_mode(1);
    assert(ck.randomize()) else $error("FAILED");
  end
  
endmodule
