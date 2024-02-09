function [current_solution,best_price,best_solution,probabilty_to_take] = DecideTheCurrSolution(params,temprature,current_solution,next_guess_solution,best_price,best_solution,graph)
    price_current = ProjectSA.calc_price(params,current_solution,graph);    
    price_next = ProjectSA.calc_price(params,next_guess_solution,graph);

    delta_price = (price_next - price_current)*params.norm;
    probabilty_to_take = exp(delta_price/temprature);
    if delta_price > 0
        probabilty_to_take = 1;
    end 

    if  rand() < probabilty_to_take
       current_solution = next_guess_solution; 
       price_current = ProjectSA.calc_price(params,current_solution,graph);
    end
    
    if price_current > best_price
        best_price = price_current;
        best_solution = current_solution;
    end 

end
