function [hole_x, hole_y] = getNextHole(grid, tile_position, hole_positions)
    nholes = size(hole_positions, 1);
    mandists = zeros(nholes,1);
    
    for i=1:nholes
        hole_x = hole_positions(i,1);
        hole_y = hole_positions(i,2);
        
        mandists(i) = abs(hole_x - tile_position(1)) + abs(hole_y - tile_position(2));
    end
    
    [value, index] = min(mandists);
    
    hole_x = hole_positions(index,1);
    hole_y = hole_positions(index,2);
end