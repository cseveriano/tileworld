
global TILE;
global HOLE;
global WALL;
global AGENT;

TILE = 1;
HOLE = 2;
WALL = 3;
AGENT = 4;

grid = generateTileGrid(10, 3, 3, 2);

[i, j] = find(grid == AGENT);
agent_position = [i j];
grid(i,j) = 0;

% Define which tile is chosen

[i,j] = find(grid == TILE);
tile_positions = [i j];

[i,j] = find(grid == HOLE);
hole_positions = [i j];

while size(tile_positions,1) > 0
    [tile_x, tile_y, indtile] = getNextTile(grid, agent_position, tile_positions);
    next_tile = [tile_x tile_y];
    
%     [solution] = searchPath(grid, agent_position, next_tile);
    [solution] = searchPathStochastic(grid, agent_position, next_tile);

    new_position = solution.position;
    grid(new_position(1), new_position(2)) = 0;
    agent_position = [new_position(1) new_position(2)];
    tile_positions(indtile,:) = [];

    plotGrid(grid, agent_position);
    
    [hole_x, hole_y] = getNextHole(grid, agent_position, hole_positions);
    next_hole = [hole_x hole_y];

%     [solution] = searchPath(grid, agent_position, next_hole);
    [solution] = searchPathStochastic(grid, agent_position, next_hole);
    new_position = solution.position;
    agent_position = [new_position(1) new_position(2)];

    plotGrid(grid, agent_position);

end

