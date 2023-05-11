% MAX CUT using simulated annealing
E = [0 2 2 5 0;
     2 0 1 0 3;
     2 1 0 4 2;
     5 0 4 0 1;
     0 3 2 1 0];

p = 0.5*ones(1,5);
generated = rand(1,5);
current = p > generated;
price_current = price(current,E);
best_price = price_current;
best_cut = current;

initial_temp = 1e5;
final_temp = 1;
pace = 0.99;
temp = initial_temp;
norm = 1e3;
iteration = 0;
x= 1:5;
plot_cuts = zeros(11,5);
while temp > final_temp
    iteration = iteration + 1;
    if (iteration < 11  )
        plot_cuts(iteration+1,:)=best_cut;
    end
    node = randi(size(E,1));
    next = current;
    next(node) = not(next(node)); 
    price_next = price(next,E);
    delta = (price_next - price_current)*norm;
   
    if delta > 0 || rand() < exp(-delta/temp)
       current = next; 
       price_current = price_next;
    end
       
    if price_current > best_price
        best_price = price_current;
        best_cut = current;
    end 

    temp = temp*pace; 
end
[X,Y] = meshgrid(1:size(plot_cuts,2),1:size(plot_cuts,1));
figure()
plot3(X,Y,plot_cuts);



