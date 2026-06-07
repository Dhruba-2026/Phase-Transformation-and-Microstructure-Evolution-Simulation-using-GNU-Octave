# Phase-Transformation-and-Microstructure-Evolution-Simulation-using-GNU-Octave
Independent research project on numerical simulation of phase transformation kinetics and microstructure evolution in metals using GNU Octave. Features JMAK-based modelling, TTT diagram generation, cooling analysis, and computational visualization for materials applications.

# Phase Transformation and Microstructure Evolution Simulation using GNU Octave

## Overview

This repository presents an independent computational materials science project focused on the numerical simulation of **phase transformation kinetics** and **microstructure evolution in metals** using **GNU Octave**.

The objective of this work is to model the transformation behavior of metallic materials during thermal processing by implementing the **Johnson–Mehl–Avrami–Kolmogorov (JMAK) equation**, generating transformation curves, visualizing microstructure evolution, and analyzing temperature-dependent kinetics through numerical methods.

This project was developed independently as a self-directed research initiative to strengthen knowledge in computational metallurgy and materials engineering.

## Objectives

* Simulate phase transformation kinetics using the JMAK model.
* Study the influence of temperature on transformation behavior.
* Generate approximate Time–Temperature–Transformation (TTT) characteristics.
* Visualize two-dimensional microstructure evolution.
* Calculate important transformation parameters such as t10, t50, t90, maximum transformation rate, and final phase fraction.
* Demonstrate the application of numerical methods in computational materials science.

## Software and Tools

* GNU Octave
* Numerical Methods
* Matrix-based Computation
* Scientific Visualization
* Computational Materials Science

## Repository Structure
├── README.md
├── main_phase_transformation.m        # Core simulation script
├── Research_Report.pdf                # Full technical report
├── results/                           # Simulation outputs
│   ├── phase_transformation_curve.svg
│   ├── ttt_diagram.svg
│   ├── cooling_curve.svg
│   └── microstructure_evolution.png
└── figures/                           # Additional plots and visuals

## Methodology

The simulation is based on the JMAK equation, which describes the transformed fraction X(t):

X(t)=1−exp(−kt<sup>n</Sup>)

Where:

X(t) = transformed fraction
k = temperature-dependent rate constant
n = Avrami exponent
t = time

Temperature dependence is incorporated through Arrhenius-type behavior:

k=k<sub>0</sub> exp(−Q/RT)

This enables simulation of transformation kinetics under varying thermal conditions.

## Key Features

* Numerical simulation of phase transformation kinetics
* Temperature-dependent transformation analysis
* JMAK-based transformation model
* Approximate TTT diagram generation
* Cooling curve simulation
* Two-dimensional microstructure evolution visualization
* Quantitative analysis of transformation parameters

## Results

The simulation successfully demonstrates the influence of temperature on transformation kinetics and microstructural development.

Major outputs include:

* Phase Transformation Curves
* Approximate TTT Diagram
* Cooling Curve
* Microstructure Evolution Simulation
* Quantitative Transformation Analysis

## Research Report

A detailed research report accompanies this repository, including:
* Theoretical Background
* Governing equations
* Numerical implementation details
* Simulation Methodology
* Results and discussions
* Conclusion and future scope

**File:** `Research_Report.pdf`

## Academic Relevance

This project is closely related to topics in:

* Materials Science
* Metallurgical Engineering
* Computational Materials Engineering
* Heat Treatment of Metals
* Phase Transformation Theory
* Numerical Simulation

## Future Improvements

Possible extensions of this work include:

* Integration of CALPHAD-based thermodynamic data
* Phase-field modeling
* Finite Element Method (FEM) implementation
* Machine learning for transformation prediction
* Experimental validation using real alloy systems

## Author

**Dhrubajyoti Bhattacherjee**

Mechanical Engineering Graduate

Independent Researcher in Computational Materials Science

GitHub: https://github.com/Dhruba-2026

## License

This repository is intended for educational and research purposes. Please provide appropriate attribution if this work is referenced or reused.
