function [solution] = searchPath(grid, source, target)
    ListStates = containers.Map();

    curr_position = source;
    while ~goalAchieved(curr_position, target)
        neighbors = generateNeighbors(grid, position);
        
        heuristic_values = zeros(neighbors,1);
        
        for i=1:size(neighbors,1)
            heuristic_values(i) = manhattan_distance(neighbors(i),target);
        end
        
        [val, ind] = sort(heuristic_values);
    end
    
    solution = 1;
end

function ach = goalAchieved(source, target)
    ach = source(1) == target(1) && source(2) == target(2);
end