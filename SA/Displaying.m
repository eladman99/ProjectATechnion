function [] = Displaying(params,saved_solutions,saved_prices,probabilty_to_take,temprature,best_cut)
    x= 1:params.num_of_nodes;    
    figure(1);
    stem(x,best_cut(1,:));
    title('Final groups');
    xlabel('Node Number');
    
    figure(2);
    [X, Y] = meshgrid( 1:params.num_of_nodes, 1:size(saved_solutions,1));
    mesh(X,Y,saved_solutions);
    view(0,90);
    title('Best solution as function of iteration');
    xlabel('Node number');
    ylabel('Iteration number');
    
    figure(3);
    subplot(3,1,1);
    x = 1:length(saved_prices);
    plot(x,saved_prices);
    title('Price as function of iteration');
    xlabel('Iteration number');
    ylabel('Price');

    figure(3);
    subplot(3,1,2);
    x = 1:length(probabilty_to_take);
    probabilty_to_take(probabilty_to_take==1) = nan;
    plot(x,probabilty_to_take);
    title('Probabilty to take a "bad" step as function of iteration');
    xlabel('Iteration');
    ylabel('Probabilty');
    
    figure(3);
    subplot(3,1,3);
    x = 1:length(temprature);
    plot(x,temprature);
    title('Temprature as function of iteration');
    xlabel('Iteration');
    ylabel('Temprature');

end
