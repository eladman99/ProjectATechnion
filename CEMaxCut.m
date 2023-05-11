% MAX CUT using Cross Entropy
%% Creating a graph
number_of_nodes = 30;
group_size = floor(rand(1,1)*number_of_nodes);
max_edge_value = 10;

random_matrix = randi([1,max_edge_value],number_of_nodes,number_of_nodes);
E = triu (random_matrix);
E = E - E';
E = abs(E);
E(1:group_size,1:group_size) = 0;
E(group_size+1:number_of_nodes,group_size+1:number_of_nodes) = 0;

%% Finding max-cut
%initial parameters
num_of_lotteries = 50;
num_of_nodes = size(E,1);
x= 1:num_of_nodes;
p = 0.5*ones(num_of_lotteries,number_of_nodes);
d = 3;
gamma_seq = 0;
solutions = zeros(num_of_lotteries,size(E,2));
curr_prices = zeros(num_of_lotteries,1);
gamma_current = 0;
u = 0.1;
max_iteration = 100;
iteration = 0;
figure;
hold on;
while iteration < max_iteration 
     %stem(x,p);
     generated = rand(num_of_lotteries,num_of_nodes);
     solutions = p > generated;
     curr_prices = calc_prices(solutions,E);
    [sorted, idx_sorted] = sort(curr_prices,'descend');
    solutions = solutions(idx_sorted,:);
    best_solutions = solutions(1:round(u*num_of_lotteries),:);
    p = mean(best_solutions,1);
    p = repmat(p,num_of_lotteries);
    gamma_next = mean(sorted(1:round(u*num_of_lotteries),:),1);
    
    if (gamma_current == gamma_next) 
        gamma_seq = gamma_seq + 1;
    else 
        gamma_seq = 0;
    end
    if gamma_seq == 3
        break;
    end
    iteration = iteration +1;
    gamma_current = gamma_next;
end
    stem(x,p);
    title('probability as function of iteration');

