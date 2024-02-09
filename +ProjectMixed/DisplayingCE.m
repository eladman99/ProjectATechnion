function [] = DisplayingCE(params,saved_mean_prices,saved_probabilites,Team,best_solution)
%     x= 1:params.team_size;    
%     figure(1);
%     stem(x,best_cut(1,:));
%     title('Final groups');
%     xlabel('Node Number');
    
%     figure(2);
%     [X, Y] = meshgrid( 1:params.team_size, 1:size(saved_solutions,1));
%     mesh(X,Y,saved_solutions);
%     view(0,90);
%     title('Best solution as function of iteration');
%     xlabel('Node number');
%     ylabel('Iteration number');
    
    figure(2);
    x = 1:length(saved_mean_prices);
    plot(x,saved_mean_prices);
    title('Price as function of iteration');
    xlabel('Iteration number');
    ylabel('Price');

    figure(3);
    [X, Y] = meshgrid( 1:size(saved_probabilites,3), 1:params.team_size);
    for i=1:size(saved_probabilites,1)
        subplot(ceil(size(saved_probabilites,1)/2),2,i);
        mesh(X,Y,squeeze(saved_probabilites(i,:,:)));
        view(0,90);
        title(['Probability to be with other athlete as function of iteration - person ' num2str(i)]);
        xlabel('Person number');
        ylabel('Iteration number');
    end


    % Final graph
    numNodes = length(best_solution);
    adjacencyMatrix = zeros(numNodes);
    % Populate the adjacency matrix based on your vector
    for i = 1:numel(best_solution)-1
        for j = i+1:numel(best_solution)
            if best_solution(i) == best_solution(j)
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
    figure(4);
    plot(G, 'NodeLabel', 1:numNodes,'NodeColor', node_colors,'EdgeLabel',G.Edges.Weight);
    title('Final result graph');
    legendText = {sprintf('\\color{blue}Men'), sprintf('\\color{red}Women')};
    annotation('textbox', [0.8, 0.75, 0.1, 0.1], 'String', legendText, 'FitBoxToText', 'on', 'EdgeColor', 'none');


end
