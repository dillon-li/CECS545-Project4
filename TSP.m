function [ output_args ] = TSP( filename, iterations )
% Wrapper function for TSP Project 4
% Calls necessary functions to perform and output results of genetic
% algorithm. Heavy duty work is in tsp_ga.m

% Read in coordinates
[x,y] = ReadFromSample(filename);

% Set up xy paramter: 100 x 2 matrix here
xy = [x' y']; 

% Population size
popSize = size(xy,1);

% Calculate distance matrix to be used for all calculations (100 x 100)
dmat = zeros(size(xy,1));
for i = 1:popSize
    for j = 1:popSize
        dmat(i,j) = Distance(x(i),y(i),x(j),y(j));
    end
end

% Set up the rest of the parameters
numIter = iterations;
% showProg = true;
% showResult = true;

% Create userconfig struct
config = struct('xy',xy,'dmat',dmat,'popSize',200,'numIter',numIter,'showProg',true,'showResult',true);
tsp_ga(config);

end

