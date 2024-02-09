function [] = DisplayingSA(params,saved_solutions,saved_prices,probabilty_to_take,temprature,best_cut,Team)
    x= 1:params.team_size;    
    figure(5);
    stem(x,best_cut(1,:));
    title('Final groups');
    xlabel('Node Number');
    
    figure(6);
    [X, Y] = meshgrid( 1:params.team_size, 1:size(saved_solutions,1));
    mesh(X,Y,saved_solutions);
    view(0,90);
    title('Best solution as function of iteration');
    xlabel('Node number');
    ylabel('Iteration number');
    
    figure(7);
    subplot(3,1,1);
    x = 1:length(saved_prices);
    plot(x,saved_prices);
    title('Price as function of iteration');
    xlabel('Iteration number');
    ylabel('Price');

    figure(7);
    subplot(3,1,2);
    x = 1:length(probabilty_to_take);
    probabilty_to_take(probabilty_to_take==1) = nan;
    plot(x,probabilty_to_take);
    title('Probabilty to take a "bad" step as function of iteration');
    xlabel('Iteration');
    ylabel('Probabilty');
    
    figure(7);
    subplot(3,1,3);
    x = 1:length(temprature);
    plot(x,temprature);
    title('Temprature as function of iteration');
    xlabel('Iteration');
    ylabel('Temprature');
 
    % Final graph
    numNodes = length(best_cut);
    adjacencyMatrix = zeros(numNodes);
    % Populate the adjacency matrix based on your vector
    for i = 1:numel(best_cut)-1
        for j = i+1:numel(best_cut)
            if best_cut(i) == best_cut(j)
                adjacencyMatrix(i, j) = 1;
                adjacencyMatrix(j, i) = 1;
            end
        end
    end
    % Create a graph object from the adjacency matrix
    G = graph(adjacencyMatrix);
    for i=1:size(G.Edges,1)
        G.Edges.Weight(i) = Team.graph(G.Edges.EndNodes(i,1),G.Edges.EndNodes(i,2));
    end
    node_colors = zeros(numNodes,3);
    for i=1:numNodes
        if Team.gender(i) == 'M'
            node_colors(i,:) = [0 0 1];
        else
            node_colors(i,:) = [1 0 0];
        end
    end
    % Plot the graph
    figure(8);
    plot(G, 'NodeLabel', 1:numNodes,'NodeColor', node_colors,'EdgeLabel',G.Edges.Weight);
    title('Final result graph');
    legendText = {sprintf('\\color{blue}Men'), sprintf('\\color{red}Women')};
    annotation('textbox', [0.8, 0.75, 0.1, 0.1], 'String', legendText, 'FitBoxToText', 'on', 'EdgeColor', 'none');

end

