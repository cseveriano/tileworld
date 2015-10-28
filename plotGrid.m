function plotGrid(grid, agent_position)
    global AGENT;
    cmap=[  0.3,0.3,0.3; ...   % empty
            1.0,1.0,1.0; ...   % tile
            0.0,0.0,0.0; ...   % hole
            0.4,0.2,0.0; ...   % wall
            1.0, 0 ,0;];       % agent

    [i, j] = find(grid == AGENT);
    grid(i,j) = 0;
        
    grid(agent_position(1), agent_position(2)) = AGENT;
    imagesc(grid,[0,4]); colormap(cmap); axis image;
end
