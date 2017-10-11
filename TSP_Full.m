function [ ] = TSP_Full( filename )
% Does every dataset I need it to

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
numIter = 5000;
% showProg = true;
% showResult = true;

for i = 1:2
    switch i
        case 1
            popSize = 100;
            mutation = 'inversion';
        case 2
            popSize = 1000;
            mutation = 'inversion';
        case 3
            popSize = 100;
            mutation = 'swap';
        case 4
            popSize = 1000;
            mutation = 'swap';
    end
    for j = 1:3
        % Create userconfig struct
        config = struct('xy',xy,'dmat',dmat,'popSize',popSize,'numIter',numIter,'mutation',mutation,'run',j,'showProg',true,'showResult',true);
        tic;
        result = tsp_ga2(config);
        time = toc;
        delete(findall(0,'Type','figure'));
        % Record results
        Run = j;
        Dist = result.minDist;
        runtime = time;
        numIter = result.numIter;
        if ~exist('T')
            T = table(Run,Dist,runtime,numIter);
        else
            newRow = table(Run,Dist,runtime,numIter);
            T = [T; newRow];
        end    
    end
    file = [mutation '_popSize' num2str(popSize) '.xls']; 
    writetable(T,file)
    clear T;
end


end

