///////////////////////////////////////////////////////////////////////////////
// File:        generator.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_sequence class
///////////////////////////////////////////////////////////////////////////////

class generator extends uvm_sequence#(transaction);
//Factory
`uvm_object_utils(generator)
//Intsance
transaction tr;
//Constructor
function new(string name = "generator");
super.new(name);
endfunction
//Method
virtual task body();
  repeat(290)
begin
    tr = transaction::type_id::create("tr");
    start_item(tr);
    assert(tr.randomize()); 
    finish_item(tr);   
end
endtask
endclass