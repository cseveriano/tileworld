function plotGrid(grid)
    cmap=[  0.0,0.5,0.0; ...   % empty
            0.5,0.1,0.1; ...   % tile
            0.7,0.7,0.0; ...   % hole
            0.3,0.3,0.3; ...   % wall
            0, 0 ,0;];         % agent

    imagesc(grid,[0,4]); colormap(cmap); axis image;
end
