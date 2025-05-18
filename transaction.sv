///////////////////////////////////////////////////////////////////////////////
// File:        transaction.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_sequence_item class
///////////////////////////////////////////////////////////////////////////////
class transaction extends uvm_sequence_item;
  rand bit [3:0] a;
  rand bit [3:0] b;
  bit [7:0] c;

  `uvm_object_utils(transaction)

  function new(string name = "transaction");
    super.new(name);
  endfunction

  function void do_copy(uvm_object rhs);
    transaction rhs_;
    if (!$cast(rhs_, rhs))
      `uvm_fatal("COPY", "Failed to cast rhs");
    a = rhs_.a;
    b = rhs_.b;
    c = rhs_.c;
  endfunction

  function string convert2string();
    return $sformatf("a=%0d b=%0d c=%0d", a, b, c);
  endfunction

  // Constraints 
 // constraint c1 { a != 0; }
  //constraint c2 { b != 0; }
  constraint a_in_range { a inside {[0:15]}; }
  constraint b_in_range { b inside {[0:15]}; }
endclass
