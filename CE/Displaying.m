function [] = Displaying(params,saved_solutions,saved_prices,p,max_price)
    x= 1:params.num_of_nodes;    
    figure(1);
    stem(x,p(1,:));
    title('Final groups');
    xlabel('Node Number');
    
    figure(2);
    [X, Y] = meshgrid( 1:params.num_of_nodes, 1:size(saved_solutions,1));
    mesh(X,Y,saved_solutions);
    title('Best solution as function of iteration');
    xlabel('Node number');
    ylabel('Iteration number');
    
    
    
    figure(3);
    hold on;
    x = 1:length(saved_prices);
    constline = max_price.*ones(1,length(x));
    plot(x,saved_prices);
    title('Averaged price as function of iteration');
    xlabel('Iteration number');
    ylabel('Price');
    plot(x,constline)
    hold off;

end
