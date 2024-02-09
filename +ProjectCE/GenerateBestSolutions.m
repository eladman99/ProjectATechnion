function [best_solutions,sorted_prices] = GenerateBestSolutions(params,Team,probabilites)
        all_lotteries = zeros(params.num_of_lotteries,params.team_size);
        for i=1:params.num_of_lotteries
            all_lotteries(i,:) = ProjectCE.GenerateSolutionCE(params,Team,probabilites);
        end

    curr_prices = ProjectCE.calc_pricesCE(params,all_lotteries,Team.graph);
    [sorted_prices, idx_sorted] = sort(curr_prices,'descend');
    sorted_solutions = all_lotteries(idx_sorted,:);
    best_solutions = sorted_solutions(1:round(params.perc_best_solutions*params.num_of_lotteries),:);
end
