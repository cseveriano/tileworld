
global TILE;
global HOLE;
global WALL;
global AGENT;

% Identifiers for all the elements in the board
TILE = 1;
HOLE = 2;
WALL = 3;
AGENT = 4;

% Mode of search
DETERMINISTIC_SEARCH = 1;
STOCHASTIC_SEARCH = 2;

MODE = DETERMINISTIC_SEARCH;

grid = generateTileGrid(30, 3, 3, 10);

[i, j] = find(grid == AGENT);
agent_position = [i j];
grid(i,j) = 0;

[i,j] = find(grid == TILE);
tile_positions = [i j];

[i,j] = find(grid == HOLE);
hole_positions = [i j];
total_iterations = 0;

tic

while size(tile_positions,1) > 0
    % Define which tile is chosen
    [tile_x, tile_y, indtile] = getNextTile(grid, agent_position, tile_positions);
    next_tile = [tile_x tile_y];

    % Agent moves to tile
    if MODE == DETERMINISTIC_SEARCH
        [solution] = searchPath(grid, agent_position, next_tile);
    else 
        [solution] = searchPathStochastic(grid, agent_position, next_tile);
    end
    
    new_position = solution.position;
    total_iterations = total_iterations + solution.iterations;
    grid(new_position(1), new_position(2)) = 0;
    agent_position = [new_position(1) new_position(2)];

%   tile is removed from the initial list
    tile_positions(indtile,:) = [];
    
    plotGrid(grid, agent_position);
    
    % Define which tile is chosen to put the tile
    [hole_x, hole_y] = getNextHole(grid, agent_position, hole_positions);
    next_hole = [hole_x hole_y];

    % Agent moves to hole
    if MODE == DETERMINISTIC_SEARCH
        [solution] = searchPath(grid, agent_position, next_hole);
    else
        [solution] = searchPathStochastic(grid, agent_position, next_hole);
    end
    
    new_position = solution.position;
    total_iterations = total_iterations + solution.iterations;

    agent_position = [new_position(1) new_position(2)];

    plotGrid(grid, agent_position);

end

total_iterations
toc