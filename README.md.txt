# 🚦 Traffic Light Controller using FSM (SystemVerilog)

## 📌 Overview
This project implements a Traffic Light Controller using a Finite State Machine (FSM) in SystemVerilog.

The controller cycles through:
- RED
- GREEN
- YELLOW

Additional features:
- 🚑 Emergency vehicle override (Highest Priority)
- 🚶 Pedestrian crossing request
- Synchronous design
- Verified using waveform simulation

---

## 🏗 FSM Design

State Encoding:
- 00 → RED
- 01 → GREEN
- 10 → YELLOW

Transition Sequence:
RED → GREEN → YELLOW → RED

Emergency overrides GREEN → RED  
Pedestrian forces GREEN → YELLOW  

---

## 📂 Project Structure

```
rtl/        → RTL Design
tb/         → Testbench
waveforms/  → Simulation waveform
docs/       → State diagram
```

---

## ▶ Simulation Steps (EDA Playground / Icarus Verilog)

1. Compile:
   ```
   iverilog -g2012 rtl/traffic_controller.sv tb/traffic_tb.sv
   ```

2. Run:
   ```
   vvp a.out
   ```

3. View waveform:
   ```
   gtkwave dump.vcd
   ```

---

## 📊 Waveform Verification

✔ Proper state transitions  
✔ Synchronous behavior  
✔ Emergency priority verified  
✔ Pedestrian logic verified  

---

## 🎯 Skills Demonstrated

- Finite State Machine (FSM) Design
- SystemVerilog RTL Coding
- Testbench Development
- Functional Verification
- Waveform Debugging
- Digital Design Concepts

---

## 👨‍💻 Author
Manjunath Bhaskar Hebbar  
B.Tech VLSI  
Presidency University, Bangalore