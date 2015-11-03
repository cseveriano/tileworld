function [hole_x, hole_y] = getNextHole(grid, tile_position, hole_positions)
    nholes = size(hole_positions, 1);
    mandists = zeros(nholes,1);
    
    for i=1:nholes
        mandists(i) = manhattanDistance(hole_positions(i,:), tile_position);
    end
    
    [value, index] = min(mandists);
    
    hole_x = hole_positions(index,1);
    hole_y = hole_positions(index,2);
end