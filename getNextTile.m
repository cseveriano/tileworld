function [tile_x, tile_y] = getNextTile(grid, agent_position, tile_positions)

    ntiles = size(tile_positions, 1);
    mandists = zeros(ntiles,1);

    for i=1:ntiles
        mandists(i) = manhattan_distance(tile_positions(i,:), agent_position);
    end
    
    [value, index] = min(mandists);
    
    tile_x = tile_positions(index,1);
    tile_y = tile_positions(index,2);
end