function [ output_args ] = TSP( filename, mutation, popSize, iterations )
% Wrapper function for TSP Project 4
% Calls necessary functions to perform and output results of genetic
% algorithm. Heavy duty work is in tsp_ga.m

% Inputs:
% filename: Random100.tsp
% mutation: type of mutation. Options include 'swap' and 'inversion'
% popSize: Size of the population
% iterations: Number of iterations to run


% Read in coordinates
[x,y] = ReadFromSample(filename);

% Set up xy paramter: 100 x 2 matrix here
xy = [x' y']; 

% Calculate distance matrix to be used for all calculations (100 x 100)
dmat = zeros(size(xy,1));
for i = 1:size(xy,1)
    for j = 1:size(xy,1)
        dmat(i,j) = Distance(x(i),y(i),x(j),y(j));
    end
end

% Set up the rest of the parameters
numIter = iterations;
% showProg = true;
% showResult = true;

% Create userconfig struct
config = struct('xy',xy,'dmat',dmat,'popSize',popSize,'numIter',numIter,'mutation',mutation,'showProg',true,'showResult',true);
tsp_ga2(config);

end

