function [value_map,trajectory] = wavefront(map,start_row,start_col,goal_row,goal_column)
    % Assign the goal position the value of 2
    map(goal_row,goal_column) = 2;
    value_map = map;
    queue = [goal_row goal_column];
    
    % Create a mask for the adjacent pixels
    connectivity = [-1 -1; -1 0; -1 1; 0 -1; 0 0; 0 1; 1 -1; 1 0; 1 1];
    
    % Mapping of the environment
    while size(queue,1)~=0
        for k = 1:size(connectivity,1)
            actual_pixel = queue(1,:)+connectivity(k,:); % Evaluating the k pixel neighbor from the actual central pixel
            
            % Check if the actual pixel is in the environment
            if min(actual_pixel)<1
                continue
            elseif actual_pixel(1)>size(map,1)
                continue
            elseif actual_pixel(2)>size(map,2)
                continue
            end
            
            % Checking that the pixel is not an obstacle or hasnt been
            % assigned before
            if value_map(actual_pixel(1),actual_pixel(2))==1
                continue
            elseif value_map(actual_pixel(1),actual_pixel(2))~=0
                continue
            end
            
            % Set the cost of the actual pixel and add it to the queue to
            % check for its neighbor's
            value_map(actual_pixel(1),actual_pixel(2)) = value_map(queue(1,1),queue(1,2))+1;
            queue(size(queue,1)+1,:) = actual_pixel;
        end
        
        % Erasing checked elements of the queue
        queue = queue(2:end,:);
    end
    
    % Creating the path prioritizer mask
    path_connec = [0 -1; 0 0; -1 0; 0 1; 1 0; -1 -1; -1 1; 1 1; 1 -1];
    % Getting the trajectory from the start to the goal
    trajectory = [start_row start_col];
    current_pixel = trajectory;
    % Generating the trajectory
    while 1
        if current_pixel==[goal_row goal_column] % breaking the loop when we reach goal
            break
        end
        cost = value_map(current_pixel(1),current_pixel(2)); % actual value of the pixel
        if cost == 0
            trajectory = -1; % indicates that the trajectory has failed
            break
        end
        
        flag=1;
        for t = 1:size(path_connec,1)
            % Checking the neighborhood of the current pixel
            actual_pixel = current_pixel(1,:)+path_connec(t,:);
            % Check if the actual pixel is in the environment
            if min(actual_pixel)<1
                continue
            elseif actual_pixel(1)>size(map,1)
                continue
            elseif actual_pixel(2)>size(map,2)
                continue
            end
            
            % Check if the actual pixel is not an obstacle
            if value_map(actual_pixel(1),actual_pixel(2))==1
                continue
            end
            % Check that there is a reduction on the cost function
            if value_map(actual_pixel(1),actual_pixel(2))<cost
                flag = 0;
                trajectory = [trajectory; actual_pixel]; %adding the first pixel found to the trajectory
                current_pixel=actual_pixel;
                break
            end
        end
        
        % Defining a failed movement to the goal
        if flag
            trajectory = [trajectory; -1 -1];
            break
        end
    end
    
end