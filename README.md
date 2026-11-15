# Automotive 12V Battery & Starting System Simulation

> **MATLAB & Simulink Engineering Project** — Project 001  
> **Author:** Sajid Mohammed  
> **Date:** November 2026

---

## 📌 Project Overview

This project investigates the electrical behaviour of an automotive 12V battery under various loading conditions, simulating the voltage drop that occurs when supplying current to a starter motor. Using MATLAB for mathematical modelling and graphical analysis, and Simulink for time-domain simulation, the project demonstrates fundamental automotive electrical principles and practical system modelling techniques.

The simulation models a 12.6 V battery with internal resistance supplying a starter motor load, calculating terminal voltage using the relationship:

$$V_{\text{terminal}} = V_{\text{initial}} - (I \cdot R_{\text{internal}})$$

---

## 🎯 Project Objectives

- Investigate how electrical current and internal resistance affect terminal voltage of a 12V automotive battery
- Develop MATLAB scripts to calculate voltage drops and compare different battery conditions
- Create Simulink models to simulate a battery supplying a starter motor load
- Observe time-varying terminal voltage when electrical loads switch on/off
- Build foundational understanding of automotive electrical systems and mathematical modelling

---

## 🛠 Software Used

| Tool | Version | Purpose |
|------|---------|---------|
| **MATLAB** | R2024a+ | Numerical calculations, plotting, data analysis |
| **Simulink** | R2024a+ | Time-domain simulation of battery starting system |
| **Simscape Electrical** | (via Simulink) | Electrical component blocks |

---

## ⚡ Electrical Theory and Equations

### Core Equation

The terminal voltage of a battery under load is governed by:

$$V_{\text{terminal}} = V_{\text{initial}} - I \cdot R_{\text{internal}}$$

Where:
- $V_{\text{terminal}}$ — Voltage at battery terminals (V)
- $V_{\text{initial}}$ — Open-circuit battery voltage (V)
- $I$ — Electrical current drawn by load (A)
- $R_{\text{internal}}$ — Battery internal resistance (Ω)

### Initial Simulation Parameters

| Parameter | Value |
|-----------|-------|
| Initial Battery Voltage | 12.6 V |
| Internal Resistance | 0.015 Ω |
| Starter Motor Current | 150 A |

**Calculated Results:**
- Voltage Drop: $150 \times 0.015 = 2.25\ \text{V}$
- Terminal Voltage: $12.6 - 2.25 = 10.35\ \text{V}$

---

## 📊 MATLAB Experiments

The MATLAB script (`MATLAB/Automotive_Battery_Simulation.m`) performs four progressive experiments:

### Experiment 1: Effect of Electrical Current
- Current varied from 0 A to 200 A (step: 10 A)
- Initial voltage: 12.6 V, Internal resistance: 0.015 Ω
- **Result:** Linear decrease in terminal voltage as current increases

### Experiment 2: Comparison of Internal Resistance
Three battery conditions compared at constant 12.6 V:

| Battery Condition | Internal Resistance | Terminal Voltage at 150 A |
|-------------------|---------------------|---------------------------|
| Low Resistance | 0.010 Ω | 11.10 V |
| Medium Resistance | 0.020 Ω | 9.60 V |
| High Resistance | 0.030 Ω | 8.10 V |

### Experiment 3: Effect of Initial Battery Voltage
- Internal resistance fixed at 0.015 Ω
- Initial voltages: 12.6 V, 12.2 V, 11.8 V
- **Result:** Parallel curves — same slope (rate of voltage drop), different intercepts

### Experiment 4: Combined Battery Conditions
Three realistic battery scenarios:

| Battery | Initial Voltage | Internal Resistance | Terminal Voltage at 150 A |
|---------|-----------------|---------------------|---------------------------|
| A (New) | 12.6 V | 0.010 Ω | 11.10 V |
| B (Aged) | 12.2 V | 0.020 Ω | 9.20 V |
| C (Degraded) | 11.8 V | 0.030 Ω | 7.30 V |

**Key Finding:** Battery C (highest resistance + lowest voltage) suffers the greatest voltage drop.

---

## 🔧 Simulink Model Description

**Model File:** `Simulink/Automotive_Battery_Model.slx`

### Model Architecture

| Block | Function | Configuration |
|-------|----------|---------------|
| **Constant** | Initial battery voltage | 12.6 V |
| **Step / Pulse Generator** | Starter motor current load | Step: 150 A at t=1s; Pulse: 150 A, 5s period, 40% width |
| **Gain** | Internal resistance | 0.015 Ω |
| **Sum** | Terminal voltage calculation | $V_{\text{terminal}} = V_{\text{initial}} - I \cdot R$ |
| **Scope** | Voltage vs. time display | Shows transient response |
| **Display** | Numerical output | Real-time voltage value |

### Simulation Scenarios

#### 4.1 Starter Motor Simulation (Step Input)
- Step block activates 150 A load at t = 1 second
- Terminal voltage drops from 12.6 V → 10.35 V
- Verified with Display block (10.35 V) and Scope (transient response)

#### 4.2 Pulsed Load Simulation (Pulse Generator)
- Pulse Generator: 150 A amplitude, 5 s period, 40% pulse width, 1 s phase delay
- **Load ON:** Terminal voltage = 10.35 V
- **Load OFF:** Terminal voltage returns to 12.6 V
- Demonstrates voltage recovery when current ceases

#### 4.3 Reduced Load Comparison
- Pulse amplitude changed to 100 A
- Terminal voltage during pulse: 11.10 V
- Confirms lower current → smaller voltage drop (constant resistance)

---

## 📈 Results and Findings

### MATLAB vs Simulink Validation

| Current | Voltage Drop (MATLAB) | Terminal Voltage (MATLAB) | Terminal Voltage (Simulink) | Match |
|---------|----------------------|---------------------------|----------------------------|-------|
| 100 A | 1.50 V | 11.10 V | 11.10 V | ✅ |
| 150 A | 2.25 V | 10.35 V | 10.35 V | ✅ |

### Key Conclusions

1. **Voltage drop is directly proportional to current** — Doubling current doubles voltage drop (Ohm's Law)
2. **Internal resistance critically impacts starting capability** — A degraded battery (0.030 Ω) drops to 7.30 V at 150 A, potentially below starter motor minimum
3. **Simulink time-domain simulation matches steady-state MATLAB calculations** — Validates modelling approach
4. **Pulsed loads show dynamic voltage recovery** — Voltage returns to open-circuit value when load disconnects

---

## 🖼 Screenshots

### MATLAB Generated Plots

| Image | Description |
|-------|-------------|
| `Images/Automotive Battery Voltage Under Load.png` | Terminal voltage vs. current (0–200 A) for single battery condition |
| `Images/Comparison of Battery Internal Resistance.png` | Three curves comparing low/medium/high internal resistance |
| `Images/Effect of Initial Battery.png` | Parallel curves showing effect of different initial voltages |
| `Images/Comparison of Three Battery Conditions.png` | Combined comparison of three realistic battery states |

### Simulink Model & Scope Results

| Image | Description |
|-------|-------------|
| `Images/Simulink with Step block.jpg` | Simulink model with Step block for starter motor simulation |
| `Images/Simulink with Pulse generator.jpg` | Simulink model with Pulse Generator for cyclic loading |
| `Images/Scope Results.jpg` | Scope output showing voltage transients during pulsed operation |

---

## ⚠️ Limitations

- **Constant internal resistance** — Real batteries exhibit resistance changes with temperature, state of charge, and age
- **Simplified electrical model** — Uses basic Ohm's Law; does not model electrochemical dynamics
- **No temperature effects** — Battery performance varies significantly with temperature
- **Ideal starter motor model** — Real motors have inductance, back-EMF, and non-linear characteristics
- **No state-of-charge tracking** — Voltage does not decrease as battery discharges over time
- **Theoretical results only** — Not validated against physical battery measurements

---

## 🚀 Future Improvements

- [ ] Add temperature-dependent internal resistance model
- [ ] Implement state-of-charge (SoC) estimation with voltage lookup tables
- [ ] Model starter motor as R-L circuit with back-EMF
- [ ] Add battery ageing effects (capacity fade, resistance growth)
- [ ] Include alternator charging model for complete electrical system
- [ ] Validate against experimental data from physical 12V battery tests
- [ ] Extend to 48V mild-hybrid battery systems
- [ ] Add Simulink dashboard for interactive parameter tuning

---

## 📁 Repository Structure

```
automotive-battery-simulation/
├── MATLAB/
│   └── Automotive_Battery_Simulation.m    # Main MATLAB analysis script
├── Simulink/
│   └── Automotive_Battery_Model.slx       # Simulink battery starting model
├── Images/
│   ├── Automotive Battery Voltage Under Load.png
│   ├── Comparison of Battery Internal Resistance.png
│   ├── Comparison of Three Battery Conditions.png
│   ├── Effect of Initial Battery.png
│   ├── Scope Results.jpg
│   ├── Simulink with Pulse generator.jpg
│   └── Simulink with Step block.jpg
├── Report/
│   └── Project 1 Automotive 12V Battery.pdf  # Full technical report
└── README.md
```

---

## ▶️ How to Run

### MATLAB Analysis
```matlab
% Open MATLAB and run:
run('MATLAB/Automotive_Battery_Simulation.m')
```

### Simulink Model
1. Open MATLAB
2. Navigate to `Simulink/` directory
3. Open `Automotive_Battery_Model.slx`
4. Press **Run** to simulate
5. Open **Scope** block to view voltage transients

---

## 📄 License

This project is for educational and portfolio demonstration purposes.

---

## 👤 Author

**Sajid Mohammed**  
*Engineering Student / Automotive Systems Enthusiast*  
November 2026

---

*This project demonstrates practical application of electrical circuit theory, MATLAB numerical computing, and Simulink modelling for automotive engineering education.*