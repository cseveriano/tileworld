function [tileGrid] = generateTileGrid(dimension, ntiles, nholes, nwalls)

global TILE;
global HOLE;
global WALL;
global AGENT;

    dimension = 10;
    ntiles = 3;
    nholes = 3;
    nwalls = 2;
    
    % Create empty Tile Grid
    tileGrid = zeros(dimension);
    
    % Create tiles
    ti = randperm(dimension,ntiles);
    tj = randperm(dimension,ntiles);
    
    for i=1 : ntiles
        tileGrid(ti(i),tj(i)) = TILE;
    end
    
    % Create holes. Can only be inserted in empty positions.
    holes_created = 0;
    
    while holes_created < nholes
        hi = randperm(dimension,1);
        hj = randperm(dimension,1);
       
        if tileGrid(hi,hj) == 0
            tileGrid(hi,hj) = HOLE;
            holes_created = holes_created + 1;
        end
    end

    
    % Create walls. Can only be inserted in empty positions.
    walls_created = 0;
    
    while walls_created < nwalls
        wi = randperm(dimension,1);
        wj = randperm(dimension,1);
       
        if tileGrid(wi,wj) == 0
            tileGrid(wi,wj) = WALL;
            walls_created = walls_created + 1;
        end
    end

    % Insert the agent
    agent_position = 0;
    
    while ~agent_position
        i = randperm(dimension,1);
        j = randperm(dimension,1);
       
        if tileGrid(i,j) == 0
            tileGrid(i,j) = AGENT;
            agent_position = 1;
        end
    end
    
end