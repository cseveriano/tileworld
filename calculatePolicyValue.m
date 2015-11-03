% calculatePolicyValue
%   Calculate policy value
%
% Input:  grid: the tile grid
%         state: agent's current position
%         action: agent's ext move
%         target: agent's target (tile or hole)
%         k_stage: iteration value, used as stop criteria
% Output: solution: struct containing the last position of the agent and
% the number of iterations
function [action_value] = calculatePolicyValue(grid, state, action, target, k_stage)
global UP;
global DOWN;
global LEFT;
global RIGHT;
global MAX_K_STAGE;

    rewards = zeros(4,1);
    values = zeros(4,1);
    probs = zeros(4,1);
    discount = 0.9;
    
    % Test all movements as neighbors, if possible
    if canMoveUp(grid, state)
        next_state = [state(1)-1 state(2)];
        rewards(UP) = calculateReward(state, next_state, target);
        
        if k_stage < MAX_K_STAGE
           
           neighbors = generateNeighbors(grid, next_state);
           act_vals = zeros(size(neighbors,1),1);
           
           for i=1:size(neighbors,1)
               act_vals(i) = calculatePolicyValue(grid, next_state, neighbors(i, 3), target, k_stage+1);
           end
           
           values(UP) = max(act_vals);
        end
    else
        rewards(UP) = -1;
    end
    
    if canMoveDown(grid, state)
        next_state = [state(1)+1 state(2)];
        rewards(DOWN) = calculateReward(state, next_state, target);
        
        if k_stage < MAX_K_STAGE
           
           neighbors = generateNeighbors(grid, next_state);
           act_vals = zeros(size(neighbors,1),1);
           
           for i=1:size(neighbors,1)
               act_vals(i) = calculatePolicyValue(grid, next_state, neighbors(i, 3), target, k_stage+1);
           end
           
           values(DOWN) = max(act_vals);
        end
    else
        rewards(DOWN) = -1;
    end

    
    if canMoveLeft(grid, state)
        next_state = [state(1) state(2)-1];
        rewards(LEFT) = calculateReward(state, next_state, target);
        
        if k_stage < MAX_K_STAGE
           
           neighbors = generateNeighbors(grid, next_state);
           act_vals = zeros(size(neighbors,1),1);
           
           for i=1:size(neighbors,1)
               act_vals(i) = calculatePolicyValue(grid, next_state, neighbors(i, 3), target, k_stage+1);
           end
           
           values(LEFT) = max(act_vals);
        end
    else
        rewards(LEFT) = -1;
    end
    
    if canMoveRight(grid, state)
        next_state = [state(1) state(2)+1];
        rewards(RIGHT) = calculateReward(state, next_state, target);
        
        if k_stage < MAX_K_STAGE
           
           neighbors = generateNeighbors(grid, next_state);
           act_vals = zeros(size(neighbors,1),1);
           
           for i=1:size(neighbors,1)
               act_vals(i) = calculatePolicyValue(grid, next_state, neighbors(i, 3), target, k_stage+1);
           end
           
           values(RIGHT) = max(act_vals);
        end
    else
        rewards(RIGHT) = -1;
    end

    probs(:) = 0.1;
    probs(action) = 0.7;
    
    action_value = 0;
    for i=1:4
       action_value =  action_value + probs(i)*rewards(i) + discount * values(i);
    end
end

function [reward] = calculateReward(state, next_state, target)
    if next_state == target
       reward = 10; 
    else
        reward = manhattanDistance(state, target) - manhattanDistance(next_state, target);
    end
end

function [cm] = canMoveUp(grid, position)
global WALL;
cm = (position(1) > 1  && grid(position(1)-1, position(2)) ~= WALL); 
end

function [cm] = canMoveDown(grid, position)
global WALL;
n = size(grid, 1);
cm = (position(1) < n && grid(position(1)+1, position(2)) ~= WALL);
end

function [cm] = canMoveLeft(grid, position)
global WALL;
cm = (position(2) > 1 && grid(position(1), position(2)-1) ~= WALL);
end

function [cm] = canMoveRight(grid, position)
global WALL;
n = size(grid, 1);
cm = (position(2) < n && grid(position(1), position(2)+1) ~= WALL);
end
