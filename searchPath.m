% searchPath
%   Search the path of an agent to a target.
%
% Input:  grid: the tile grid
%         source: agent's current position
%         target: agent's target (tile or hole)
% Output: solution: struct containing the last position of the agent and
% the number of iterations
function [solution] = searchPath(grid, source, target)

    global UP;
    global DOWN;
    global LEFT;
    global RIGHT;
    global HOLE;

    UP = 1;
    DOWN = 2;
    LEFT = 3;
    RIGHT = 4;

    states_stack = {};
    evaluated_list = containers.Map(); 
    top = 1;
    
    state.position = source;
    state.previous = [];
    
    states_stack{top} = state;
    iterations = 1;
    
    while  top > 0
        
        c_state = states_stack{top};
        curr_position = c_state.position;
        
        states_stack{top} = [];
        top = top - 1;
        
        % Test if the target is found        
        if goalAchieved(curr_position, target)
            if grid(target(1),target(2)) == HOLE
                solution.position = c_state.previous;
            else
                grid(curr_position(1),curr_position(2)) = 0;
                plotGrid(grid, curr_position);
                solution.position = curr_position;
            end
            
            solution.iterations = iterations;
            break;
        else

            iterations = iterations + 1;
            plotGrid(grid, curr_position);

            % Generates possible moves for next step            
            neighbors = generateNeighbors(grid, curr_position);

            heuristic_values = zeros(size(neighbors,1),1);
            
            % Calculates heuristic values for each option
            for i=1:size(neighbors,1)
                heuristic_values(i) = manhattanDistance(neighbors(i, 1:2),target);
            end

            [val, ind] = sort(heuristic_values);

            % Test if the same move at the same position was already taken            
            for i=size(ind,1):-1:1
               next_move = [curr_position neighbors(ind(i),3)];
               if isKey(evaluated_list,num2str(next_move)) == 0
                    top = top + 1;
                    neighbor.position = neighbors(ind(i),1:2);
                    neighbor.previous = curr_position;
                    states_stack{top} = neighbor;
                    evaluated_list(num2str(next_move)) = next_move;
               end
            end
        end
    end
end

function ach = goalAchieved(source, target)
    ach = source(1) == target(1) && source(2) == target(2);
end