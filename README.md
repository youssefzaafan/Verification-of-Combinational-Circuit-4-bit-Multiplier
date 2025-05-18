# UVM-Based Verification Project for a Multiplier Design

📌 Overview

This project demonstrates a complete **UVM (Universal Verification Methodology)** testbench developed to verify the functionality of a simple **4-bit multiplier** design. It includes structured SystemVerilog components such as driver, monitor, scoreboard, agent, environment, and a functional coverage collector using a subscriber class.

The goal of this project is to show strong understanding of UVM methodology, transaction-level modeling, constrained random stimulus generation, functional coverage, and self-checking verification environments.

---

🧠 Design Under Test (DUT)

The DUT is a simple 4-bit multiplier that takes two 4-bit inputs `a` and `b` and produces an 8-bit output `c` 

---

🧪 Testbench Architecture

The testbench follows UVM methodology and includes the following components:

- transaction.sv: Defines the transaction class with randomizable fields `a`, `b` and calculated field `c`.
- generator.sv: Implements a sequence that generates random stimulus to be executed by the driver.
- driver.sv: Drives transactions to the DUT inputs.
- monitor.sv: Monitors DUT I/O and sends transactions to scoreboard and coverage.
- scoreboard.sv: Compares actual DUT output with expected output (`a * b`).
- subscriber.sv: Implements a coverage class using a covergroup with bins for input combinations.
- agent.sv: Encapsulates driver and monitor.
- env.sv: Instantiates the agent, scoreboard, subscriber, and connects the sequencer to the test.
- sequence.sv: Generates random stimuli using UVM sequences.
- test.sv: Top-level UVM test that starts sequences and reports results.
- TB.sv: Connects the DUT to the testbench and launches simulation.

---

✅ Functional Coverage

Functional coverage is collected on the input values `a` and `b` using a **covergroup** inside the `subscriber` component. The coverage model tracks:

- All values of `a` from 0 to 15
- All values of `b` from 0 to 15

Coverage is reported in the `final_phase()` of the subscriber.

---

💻 Tools Used

- Language: SystemVerilog
- Verification Methodology**: UVM (Universal Verification Methodology)
- Simulator: Synopsys VCS 2023
- Editor: [VS Code](https://code.visualstudio.com/) / any preferred editor

---

📂 File Structure

├── Design.sv
├── transaction.sv
├── generator.sv
├── driver.sv
├── monitor.sv
├── scoreboard.sv
├── subscriber.sv
├── agent.sv
├── env.sv
├── sequence.sv
├── test.sv
├── TB.sv
└── README.md


---

🚀 How to Run

[EDA Playground link](https://www.edaplayground.com/x/ANe_)

---

📈 Example Output

UVM_INFO subscriber.sv(28) @ 5800: uvm_test_top.env.sub [SUB] Received transaction a=7 b=9 c=63
UVM_INFO /apps/vcsmx/vcs/U-2023.03-SP2//etc/uvm-1.2/src/base/uvm_objection.svh(1276) @ 5800: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
UVM_INFO subscriber.sv(38) @ 5800: uvm_test_top.env.sub [SUB] Coverage a = 100.00%, b = 100.00%
--- UVM Report Summary ---

** Report counts by severity
UVM_INFO : 1164
UVM_WARNING :    0
UVM_ERROR :    0
UVM_FATAL :    0
** Report counts by id
[DRV]   290
[MON]   290
[RNTST]     1
[SCO]   290
[SUB]   291
[TEST_DONE]     1
[UVM/RELNOTES]     1
