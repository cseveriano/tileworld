
global TILE;
global HOLE;
global WALL;
global AGENT;

TILE = 1;
HOLE = 2;
WALL = 3;
AGENT = 4;

grid = generateTileGrid(10, 3, 3, 2);


% Define which tile is chosen

[i,j] = find(grid == TILE);
tile_positions = [i j];

[i,j] = find(grid == HOLE);
hole_positions = [i j];

while size(tile_positions,1) > 1
    [tile_x, tile_y] = getNextTile(grid, tile_positions);
    next_tile = [tile_x tile_y];
    
    [hole_x hole_y] = getNextHole(grid, next_tile, hole_positions);
    
end

