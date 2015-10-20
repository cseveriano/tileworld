function [neighbors] = generateNeighbors(grid, position)
    global UP;
    global DOWN;
    global LEFT;
    global RIGHT;

    neighbors = [];
    
    % Test all movements as neighbors, if possible
    if canMoveUp(grid, position)
        neighbors = [neighbors; [position(1)-1 position(2) UP]];
    end
    
    if canMoveDown(grid, position)
        neighbors = [neighbors; [position(1)+1 position(2) DOWN]];
    end
    
    if canMoveLeft(grid, position)
        neighbors = [neighbors; [position(1) position(2)-1 LEFT]];
    end
    
    if canMoveRight(grid, position)
        neighbors = [neighbors; [position(1) position(2)+1 RIGHT]];
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
    
    
    

    
