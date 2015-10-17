function [neighbors] = generateNeighbors(grid, position)
    neighbors = [];
    
    % Test all movements as neighbors, if possible
    if canMoveUp(grid, position)
        neighbors = [neighbors; [position(1)-1 position(2)]];
    end
    
    if canMoveDown(grid, position)
        neighbors = [neighbors; [position(1)+1 position(2)]];
    end
    
    if canMoveLeft(grid, position)
        neighbors = [neighbors; [position(1) position(2)-1]];
    end
    
    if canMoveRight(grid, position)
        neighbors = [neighbors; [position(1) position(2)+1]];
    end
end

function [cm] = canMoveUp(grid, position)

global WALL;

cm = (position(1) > 1  && grid(position(1)-1, position(2)) ~= WALL); 
end

function [cm] = canMoveDown(grid, position)
n = size(grid, 1);
cm = (position(1) < n && grid(position(1)+1, position(2)) ~= WALL);
end

function [cm] = canMoveLeft(grid, position)
cm = (position(2) > 1 && grid(position(1), position(2)-1) ~= WALL);
end

function [cm] = canMoveRight(grid, position)
n = size(grid, 1);
cm = (position(2) < n && grid(position(1), position(2)+1) ~= WALL);
end
    
    
    

    
