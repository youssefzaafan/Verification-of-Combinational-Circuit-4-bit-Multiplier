///////////////////////////////////////////////////////////////////////////////
// File:        monitor.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: uvm_monitor class
///////////////////////////////////////////////////////////////////////////////
class monitor extends uvm_monitor;
`uvm_component_utils(monitor)

//Instance
uvm_analysis_port#(transaction) send;
//uvm_analysis_port #(transaction) send_sub;

virtual mul_if vif;
transaction tr;
//Constructor 
function new (string name = "monitor",uvm_component parent );
super.new(name,parent);
endfunction

//build Phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
tr = transaction::type_id::create("tr");
send =new("send",this);
//send_sub = new("send_sub",this);
if(!uvm_config_db#(virtual mul_if)::get(this,"","vif",vif))
`uvm_error("MON","Unable to acess vif")
endfunction
//Run Phase
virtual task run_phase(uvm_phase phase);
forever begin
    #20
    tr.a = vif.a;
    tr.b = vif.b;
    tr.c = vif.c;
    `uvm_info("MON",$sformatf("a = %0d, b = %0d , c = %0d",tr.a,tr.b,tr.c),UVM_LOW)
    send.write(tr);
    //send_sub.write(tr);
end
endtask
endclass