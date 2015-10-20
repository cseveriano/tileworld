function [solution] = searchPath(grid, source, target)

    global UP;
    global DOWN;
    global LEFT;
    global RIGHT;
    global AGENT;

    UP = 1;
    DOWN = 2;
    LEFT = 3;
    RIGHT = 4;

    states_queue = {};
    evaluated_list = containers.Map(); 
    head = 1;   
    states_queue{head} = source;
    iterations = 1;
    
    while head <= numel(states_queue) 
        
        curr_position = states_queue{head};
        states_queue{head} = [];
        head = head - 1;
        
        [i, j] = find(grid == AGENT);
        grid(i,j) = 0;
        grid(curr_position(1),curr_position(2)) = AGENT;
        
        if goalAchieved(curr_position, target)
            iterations
            break;
        else
            
            iterations = iterations + 1;
            
            neighbors = generateNeighbors(grid, curr_position);

            heuristic_values = zeros(size(neighbors,1),1);

            for i=1:size(neighbors,1)
                heuristic_values(i) = manhattan_distance(neighbors(i, 1:2),target);
            end

            [val, ind] = sort(heuristic_values);

            for i=1:size(ind,1)
               next_move = [curr_position neighbors(ind(i),3)];
               if isKey(evaluated_list,num2str(next_move)) == 0
                    head = head + 1;
                    states_queue{head} = neighbors(ind(i),1:2);
                    evaluated_list(num2str(next_move)) = next_move;
               end
            end
        end
    end
    
    solution = 1;
end

function ach = goalAchieved(source, target)
    ach = source(1) == target(1) && source(2) == target(2);
end