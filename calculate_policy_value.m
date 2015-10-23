function [policy_value] = calculate_policy_value(grid, state, target)

possible_actions = 4;
policies = zeros(possible_actions,1);


for action=1:possible_actions
    policies(i) = calculate_action_value(grid, state, action, target);
end
policy_value = max(policies);
end


function [action_value] = calculate_action_value(grid, state, action, target, k_stage)
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
        rewards(UP) = calculate_reward(state, next_state, target);
        
        if k_stage < MAX_K_STAGE
           act_vals = zeros(4,1);
           
           for i=1:4
               act_vals(i) = calculate_action_value(grid, next_state, i, target, k_stage+1);
           end
           
           values(UP) = max(act_vals);
        end
    else
        rewards(UP) = -1;
    end
    
    if canMoveDown(grid, position)
        next_state = [state(1)+1 state(2)];
        rewards(DOWN) = calculate_reward(state, next_state, target);
        
        if k_stage < MAX_K_STAGE
           act_vals = zeros(4,1);
           
           for i=1:4
               act_vals(i) = calculate_action_value(grid, next_state, i, target, k_stage+1);
           end
           
           values(DOWN) = max(act_vals);
        end
    else
        rewards(DOWN) = -1;
    end

    
    if canMoveLeft(grid, position)
        next_state = [state(1) state(2)-1];
        rewards(LEFT) = calculate_reward(state, next_state, target);
        
        if k_stage < MAX_K_STAGE
           act_vals = zeros(4,1);
           
           for i=1:4
               act_vals(i) = calculate_action_value(grid, next_state, i, target, k_stage+1);
           end
           
           values(LEFT) = max(act_vals);
        end
    else
        rewards(LEFT) = -1;
    end
    
    if canMoveRight(grid, position)
        next_state = [state(1) state(2)+1];
        rewards(RIGHT) = calculate_reward(state, next_state, target);
        
        if k_stage < MAX_K_STAGE
           act_vals = zeros(4,1);
           
           for i=1:4
               act_vals(i) = calculate_action_value(grid, next_state, i, target, k_stage+1);
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

function [reward] = calculate_reward(state, next_state, target)
    if next_state == target
       reward = 10; 
    else
        reward = manhattan_distance(state, target) - manhattan_distance(next_state, target);
    end
end