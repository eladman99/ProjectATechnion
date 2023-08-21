function [] = Displaying(params,saved_mean_prices,saved_probabilites)
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

    figure(4);
    [X, Y] = meshgrid( 1:size(saved_probabilites,3), 1:params.team_size);
    for i=1:size(saved_probabilites,1)
        subplot(ceil(size(saved_probabilites,1)/2),2,i);
        mesh(X,Y,squeeze(saved_probabilites(i,:,:)));
        view(0,90);
        title(['Probability to be with other athlete as function of iteration - person ' num2str(i)]);
        xlabel('Person number');
        ylabel('Iteration number');
    end

end