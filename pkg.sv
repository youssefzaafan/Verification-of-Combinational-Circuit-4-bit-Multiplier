///////////////////////////////////////////////////////////////////////////////
// File:        pkg.sv
// Author:      Youssef Zaafan Atya
// Date:        2025-05-18
// Description: onwed uvm pkage
///////////////////////////////////////////////////////////////////////////////
`include "uvm_macros.svh"

package pkg;
	import uvm_pkg::*;
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "subscriber.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"
endpackage