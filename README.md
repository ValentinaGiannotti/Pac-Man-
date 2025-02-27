# Pac-Man vs. MATLAB

## Table of Contents
- [Abstract](#abstract)
- [Introduction](#introduction)
- [Features](#features)
- [Algorithm Overview](#algorithm-overview)
- [Simulation Results](#simulation-results)
- [Future Improvements](#future-improvements)
- [Contributors](#contributors)

## Abstract
This project presents an optimized version of Pac-Man implemented in MATLAB, utilizing advanced control algorithms for decision-making. The game is modeled as a pursuit-evasion problem where Pac-Man must both collect rewards and evade a randomly moving ghost. Our approach leverages **Model Predictive Control (MPC)** and the **Traveling Salesman Algorithm (TSP)** to optimize Pac-Man's movements. When Pac-Man is at a safe distance from the ghost, he follows an optimal path to collect all available rewards using TSP. If the ghost comes within a critical distance, an MPC-based escape strategy is employed to maximize Pac-Man’s distance from the ghost while still prioritizing reward collection. The project demonstrates how control strategies can be applied to dynamic game environments, providing insights into optimization techniques in artificial intelligence and control engineering.

## Introduction
Pac-Man is a classic arcade game that has been widely studied in artificial intelligence and control research due to its complex, multi-objective environment. In this project, we developed a MATLAB-based Pac-Man simulation that exploits **matrix representations** for efficient state tracking and movement calculations. Our version of the game consists of a **7x17 matrix maze**, where Pac-Man and a single ghost navigate the environment based on predefined rules.

Pac-Man’s decision-making process is governed by two primary strategies:
- **Reward Optimization**: If the distance from the ghost is greater than a predefined threshold, Pac-Man follows an optimal path using the **Traveling Salesman Algorithm (TSP)** to collect all available pills efficiently.
- **Escape Strategy**: When the ghost is within a critical range, Pac-Man applies **Model Predictive Control (MPC)** to determine the best escape route while still attempting to collect as many rewards as possible.

The ghost follows a **random movement pattern**, ensuring unpredictability and increasing the challenge. Our implementation provides a **scalable** and **modular** MATLAB framework that can be adapted for further enhancements, including additional ghosts, different maze configurations, and more complex decision algorithms.

This project serves as an educational tool for exploring **optimization techniques, artificial intelligence, and control theory** within a simple but engaging game environment. The MATLAB implementation is available in this repository, along with simulation results and detailed documentation of the algorithms used.

## Features
- **Matrix-based environment**: The maze is represented as a 7x17 matrix, where different values correspond to walls, pills, Pac-Man, and the ghost.
- **Dual decision-making strategy**:
  - **Reward Collection Mode**: Pac-Man follows an optimal path to collect all pills using **TSP** when he is at a safe distance from the ghost.
  - **Escape Strategy**: If the ghost is too close, **MPC** is applied to determine the best escape path while prioritizing rewards.
- **Random Ghost Movement**: The ghost follows a randomized movement pattern to add unpredictability to the game.
- **MATLAB Implementation**: The project is fully implemented in MATLAB, leveraging optimization toolboxes for decision-making.


## Algorithm Overview
### Model Predictive Control (MPC)
- MPC optimizes Pac-Man’s movement by maximizing the distance from the ghost while still targeting pills.
- The controller applies an optimization function at each step, considering a finite prediction horizon.
- Uses **YALMIP** for constraint handling and optimization.

### Traveling Salesman Problem (TSP)
- When Pac-Man is in a safe state, **TSP** is solved to determine the shortest path covering all pills.
- MATLAB’s built-in solvers are used to compute the optimal order of movement.

## Simulation Results
- The project has been tested with various parameters, consistently achieving high success rates using the chosen **MPC** and **TSP** weights.
 
![Pac-Man Simulation](https://github.com/ValentinaGiannotti/Pac-Man-/blob/main/pac-man-simulation.gif)



## Future Improvements
- Implementing additional ghosts with unique movement patterns.
- Introducing dynamic difficulty adjustments.
- Expanding the maze to larger, more complex layouts.

## Contributors
- **Andrea Morghen**
- **Antonio Gargiulo**
- **Valentina Giannotti**
- **Emmanuel Grimaldi**




