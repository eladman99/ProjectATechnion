function [] = Displaying(params,saved_mean_prices)
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
    
    figure(3);
    x = 1:length(saved_mean_prices);
    plot(x,saved_mean_prices);
    title('Price as function of iteration');
    xlabel('Iteration number');
    ylabel('Price');

end
