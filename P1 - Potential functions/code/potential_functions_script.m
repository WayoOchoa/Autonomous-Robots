clear all;
clc;

%% Trial of brushfire function and wavefront function with map.mat array
map = importdata('map.mat');
[map_brushfire] = brushfire(map);
start = [13 2];
goal = [3 18];
[map_wavefront, map_trajectory] = wavefront(map,start(1),start(2),goal(1),goal(2));

% Displaying the map information
subplot(2,2,1)
ax_map = subplot(2,2,1); % To handle the color map of the first plot
imagesc(map) %original map information
colormap(ax_map,flipud(gray))
title('Original map.mat')

subplot(2,2,2)
ax_map1 = subplot(2,2,2);
imagesc(map_brushfire); % Brushfire algorithm result
title('Brushfire algorithm mapping result')
colormap(ax_map1,flipud(parula))

subplot(2,2,3)
ax_map2 = subplot(2,2,3);
imagesc(map_wavefront) % Mapping of the wavefront planner
colormap(ax_map2,parula)
title('Wavefront planner algorithm')

subplot(2,2,4)
ax_map3 = subplot(2,2,4);
map_solution = map;
color_map = [1 1 1; 0 0 0; 1 0 0; 0 0 1; 0 1 0];
for i = 1:size(map_trajectory,1) % For displaying the trajectory on the original image
    map_solution(map_trajectory(i,1),map_trajectory(i,2)) = 2;
end
map_solution(start(1),start(2)) = 3;
map_solution(goal(1),goal(2)) = 4;
imagesc(map_solution)
colormap(ax_map3,color_map)
title('Generated trajectory')

%% Trial of brushfire function and wavefront function with maze.mat array
maze = importdata('maze.mat');
[maze_brushfire] = brushfire(maze);
start = [45 4];
goal = [5 150];
[maze_wavefront, maze_T] = wavefront(maze,start(1),start(2),goal(1),goal(2));

% Displaying the map information
figure
subplot(2,2,1)
ax_map = subplot(2,2,1); % To handle the color map of the first plot
imagesc(maze) %original map information
colormap(ax_map,flipud(gray))
title('Original maze.mat')

subplot(2,2,2)
ax_map1 = subplot(2,2,2);
imagesc(maze_brushfire); % Brushfire algorithm result
title('Brushfire algorithm mapping result')
colormap(ax_map1,flipud(parula))

subplot(2,2,3)
ax_map2 = subplot(2,2,3);
imagesc(maze_wavefront) % Mapping of the wavefront planner
colormap(ax_map2,parula)
title('Wavefront planner algorithm')

subplot(2,2,4)
ax_map3 = subplot(2,2,4);
maze_solution = maze;
color_map = [1 1 1; 0 0 0; 1 0 0; 0 0 1; 0 1 0];
for i = 1:size(maze_T,1) % For displaying the trajectory on the original image
    maze_solution(maze_T(i,1),maze_T(i,2)) = 2;
end
maze_solution(start(1),start(2)) = 3;
maze_solution(goal(1),goal(2)) = 4;
imagesc(maze_solution)
colormap(ax_map3,color_map)
title('Generated trajectory')

%% Trial of brushfire function and wavefront function with mazeBig.mat array
mazeB = importdata('mazeBig.mat');
[mazeB_brushfire] = brushfire(mazeB);
start = [50 17];
goal = [671 353];
[mazeB_wavefront, mazeB_T] = wavefront(mazeB,start(1),start(2),goal(1),goal(2));

% Displaying the map information
figure
subplot(2,2,1)
ax_map = subplot(2,2,1); % To handle the color map of the first plot
imagesc(mazeB) %original map information
colormap(ax_map,flipud(gray))
title('Original mazeBig.mat')

subplot(2,2,2)
ax_map1 = subplot(2,2,2);
imagesc(mazeB_brushfire); % Brushfire algorithm result
title('Brushfire algorithm mapping result')
colormap(ax_map1,flipud(parula))

subplot(2,2,3)
ax_map2 = subplot(2,2,3);
imagesc(mazeB_wavefront) % Mapping of the wavefront planner
colormap(ax_map2,parula)
title('Wavefront planner algorithm')

subplot(2,2,4)
ax_map3 = subplot(2,2,4);
mazeB_solution = mazeB;
color_map = [1 1 1; 0 0 0; 1 0 0; 0 0 1; 0 1 0];
for i = 1:size(mazeB_T,1) % For displaying the trajectory on the original image
    mazeB_solution(mazeB_T(i,1),mazeB_T(i,2)) = 2;
end
mazeB_solution(start(1),start(2)) = 3;
mazeB_solution(goal(1),goal(2)) = 4;
imagesc(mazeB_solution)
colormap(ax_map3,color_map)
title('Generated trajectory')

%% Trial of brushfire function and wavefront function with obstaclesBig.mat array
obstacles = importdata('obstaclesBig.mat');
[ob_brushfire] = brushfire(obstacles);
start = [161 18];
goal = [300 750];
[ob_wavefront, ob_T] = wavefront(obstacles,start(1),start(2),goal(1),goal(2));

% Displaying the map information
figure
subplot(2,2,1)
ax_map = subplot(2,2,1); % To handle the color map of the first plot
imagesc(obstacles) %original map information
colormap(ax_map,flipud(gray))
title('Original obstaclesBig.mat')

subplot(2,2,2)
ax_map1 = subplot(2,2,2);
imagesc(ob_brushfire); % Brushfire algorithm result
title('Brushfire algorithm mapping result')
colormap(ax_map1,flipud(parula))

subplot(2,2,3)
ax_map2 = subplot(2,2,3);
imagesc(ob_wavefront) % Mapping of the wavefront planner
colormap(ax_map2,parula)
title('Wavefront planner algorithm')

subplot(2,2,4)
ax_map3 = subplot(2,2,4);
ob_solution = obstacles;
color_map = [1 1 1; 0 0 0; 1 0 0; 0 0 1; 0 1 0];
for i = 1:size(ob_T,1) % For displaying the trajectory on the original image
    ob_solution(ob_T(i,1),ob_T(i,2)) = 2;
end
ob_solution(start(1),start(2)) = 3;
ob_solution(goal(1),goal(2)) = 4;
imagesc(ob_solution)
colormap(ax_map3,color_map)
title('Generated trajectory')
