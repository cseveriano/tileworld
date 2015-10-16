function [tile_x, tile_y] = getNextTile(grid, tile_positions)
    global AGENT;

    ntiles = size(tile_positions, 1);
    mandists = zeros(ntiles,1);
    
    [agent_x, agent_y] = find(grid == AGENT);
    
    for i=1:ntiles
        tile_x = tile_positions(i,1);
        tile_y = tile_positions(i,2);
        
        mandists(i) = abs(tile_x - agent_x) + abs(tile_y - agent_y);
    end
    
    [value, index] = min(mandists);
    
    tile_x = tile_positions(index,1);
    tile_y = tile_positions(index,2);
end