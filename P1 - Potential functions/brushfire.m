function [value_map] = brushfire(map)
    % Creating a value map that is initialized as the original map
    value_map = map;
    evaluator = 1; %evaluates if there is a connected pixel that has this value
    min_restrictor = 0; %restrict the minimum value that you have to look if the evaluator is in the connectivity
    modifier = 2; %to modify the value of the current pixel
    
    % Finding pixels coordinates that are zero
    [px,py] = find(value_map==0); %gives a list of pixels coordinates that have zero value
    
    while not(isempty(find(value_map==0))) %repeat while there are pixels that havent been updated
        for i=1:size(find(value_map==0),1)
            if (px(i)-1)==0 && (py(i)-1==0)  %exceptions on the upper left corner
                mask = value_map(1:2,1:2);
            elseif (px(i)-1)==0 && py(i)==size(value_map,2) %excpetion on the upper right corner
                mask = value_map(px(i):px(i)+1,py(i)-1:py(i));
            elseif px(i)==size(map,1) && py(i)==size(value_map,2) %lower left corner
                mask = value_map(px(i)-1:px(i),py(i)-1:py(i));
            elseif px(i)==size(value_map,1) && py(i)-1==0 %lower right corner
                mask = value_map(px(i)-1:px(i),py(i):py(i)+1);
            elseif (px(i)-1)==0 %exception on the first row
                mask = value_map(px(i):px(i)+1,py(i)-1:py(i)+1);
            elseif (py(i)-1)==0 %excetion on the first column
                mask = value_map(px(i)-1:px(i)+1,py(i):py(i)+1);
            elseif (py(i)==size(map,2)) %excpetion on the last column
                mask = value_map(px(i)-1:px(i)+1,py(i)-1:py(i));
            elseif (px(i)==size(map,1)) %exception on the last row
                mask = value_map(px(i)-1:px(i),py(i)-1:py(i)+1);
            else
                mask = value_map(px(i)-1:px(i)+1,py(i)-1:py(i)+1); %mask to evaluate 8 connectivity in each pixel
            end
            minimum = min(mask(mask>min_restrictor)); %look for the minimumn value in the connectivity
            if minimum == evaluator %update the current pixel if it founds the current evaluator
                value_map(px(i),py(i))=modifier;
            end
        end
        [px,py] = find(value_map==0); 
        evaluator= evaluator+1;
        min_restrictor=min_restrictor+1;
        modifier=modifier+1;
    end
   
end