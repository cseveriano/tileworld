% getNextTile
%   Define which tile is chosen.
%
% Input:  grid: the tile grid
%         agent_position: agent's current position
%         tile_position: tiles posiitons
% Output: tile_x, tile_y: next tile coordinates
%         index: tile order in tile positions input
function [tile_x, tile_y, index] = getNextTile(grid, agent_position, tile_positions)

    ntiles = size(tile_positions, 1);
    mandists = zeros(ntiles,1);

    for i=1:ntiles
        mandists(i) = manhattanDistance(tile_positions(i,:), agent_position);
    end
    
    [value, index] = min(mandists);
    
    tile_x = tile_positions(index,1);
    tile_y = tile_positions(index,2);
end