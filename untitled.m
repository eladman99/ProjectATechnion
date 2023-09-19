% Define the adjacency matrix
adjacencyMatrix = [
    0 10 0 0 0 0 0 0 0 0 0 0 0;
    10 0 10 -inf 0 0 0 0 0 0 0 7 0;
    0 10 0 10 0 0 0 0 0 0 9 0 0;
    0 -inf 10 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 10 0 0 0 0 0 0 0;
    0 0 0 0 10 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 10 10 0 0 0 0;
    0 0 0 0 0 0 10 0 10 0 0 0 0;
    0 0 0 0 0 0 10 10 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 15 15 15;
    0 0 9 0 0 0 0 0 0 15 0 15 15;
    0 7 0 0 0 0 0 0 0 15 15 0 15;
    0 0 0 0 0 0 0 0 0 15 15 15 0
];

% Create a graph object from the adjacency matrix
G = graph(adjacencyMatrix);

% Create a figure with custom settings
figure;
set(gcf, 'Position', [100, 100, 800, 600]); % Adjust the figure size
set(gcf, 'Color', 'w'); % White background

% Plot the weighted graph with customized node and edge properties
h = plot(G, 'EdgeLabel', G.Edges.Weight, 'EdgeColor', [0.2 0.2 0.2], 'LineWidth', 1.5);
layout(h, 'force'); % You can choose different layouts

% Add labels for the nodes
labels = cellstr(num2str((1:numNodes)'));
text(h.XData, h.YData, labels, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontWeight', 'bold');

% Set axis labels and title
xlabel('X-axis');
ylabel('Y-axis');
title('Weighted Graph Visualization', 'FontWeight', 'bold', 'FontSize', 14);

% Customize the appearance of nodes and edges
set(h, 'MarkerSize', 20); % Increase node size
set(h, 'NodeColor', 'b', 'NodeLabelColor', 'k', 'NodeFontSize', 12, 'NodeFontWeight', 'bold');
set(h, 'EdgeFontWeight', 'bold', 'EdgeFontSize', 10);
set(gca, 'FontSize', 10, 'FontWeight', 'bold');

% Display the edge weights as labels with a white background
for i = 1:numel(G.Edges.EndNodes)
    weight = G.Edges.Weight(i);
    label = sprintf('%.2f', weight);
    text(mean(G.Nodes.X(G.Edges.EndNodes(i,:))), mean(G.Nodes.Y(G.Edges.EndNodes(i,:))), label, ...
        'HorizontalAlignment', 'center', 'BackgroundColor', 'w', 'FontSize', 10, 'FontWeight', 'bold');
end
