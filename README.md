# TSP-Project4
Solving TSP with genetic algorithms

Use TSP.m:  
function [ result, time ] = TSP( filename, mutation, popSize, iterations )

Example call:  
`[res time] = TSP('Random100.tsp', 'inversion', 100, 2000);`

Two types of mutation: inversion, swap.
 - Inversion generally works better.
 
 Requires:
  - Matlab installation
