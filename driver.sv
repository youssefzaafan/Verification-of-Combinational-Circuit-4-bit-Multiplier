///////////////////////////////////////////////////////////////////////////////
// File:        driver.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_driver class
///////////////////////////////////////////////////////////////////////////////
class driver extends uvm_driver#(transaction);
`uvm_component_utils(driver)
//Constructor
function new(string name = "driver", uvm_component parent );
super.new(name,parent);
endfunction

//intances
transaction tr;
virtual mul_if vif;

//Build Phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);

if(!uvm_config_db#(virtual mul_if)::get(this,"","vif",vif))
`uvm_error("DRV","Unable to get vif from config_db")

endfunction
//Run phase 
virtual task run_phase(uvm_phase phase);
tr = transaction::type_id::create("tr");
forever begin
    //get transaction from sequencer
    seq_item_port.get_next_item(tr);
    //drive transaction on interface
    vif.a=tr.a;
    vif.b=tr.b;
    `uvm_info ("DRV",$sformatf("a = %0d, b = %0d , c = %0d",tr.a,tr.b,tr.c),UVM_LOW)
    seq_item_port.item_done();
#20;
end
endtask
endclass