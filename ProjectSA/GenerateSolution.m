function [valid,next_solution] = GenerateSolution(params,Team,current_solution)
    next_solution = current_solution;
    valid = false;
%     if rand(1,1) > params.probability_to_be_alone 
        rand_person_to_change = randi(params.team_size);
        rand_new_team_for_person = current_solution(randi([1 params.team_size],1));
        selected_team_indexes = find(current_solution == rand_new_team_for_person); 
        old_team_indexes = find(current_solution == current_solution(rand_person_to_change));

        % Counting the genders in the selected groups
        num_of_male = 0;
        num_of_female = 0;
        num_of_male = sum(Team.gender(selected_team_indexes) == 'M');
        num_of_female= sum(Team.gender(selected_team_indexes) == 'F');
        % Making sure we didnt make un-valid group taking him out
        if sum(Team.gender(old_team_indexes) == 'M') == 4 
          valid = false;
          return;
        end

        % Adding the new person's gender to the group
        if Team.gender(rand_person_to_change) == 'M'
            num_of_male = num_of_male +1;
        else 
            num_of_female = num_of_female + 1;
        end
    
        % Checking the validation of the new solution
        valid = false;
        if num_of_male == 1 && num_of_female == 1
            valid = true;
        elseif num_of_male == 2 && num_of_female == 0
            valid = true;
        elseif num_of_male == 4 && num_of_female == 0
            valid = true;
        elseif num_of_male == 0 && num_of_female == 2
            valid = true;
        elseif num_of_male == 0 && num_of_female == 3
            valid = true;
        end

          next_solution(rand_person_to_change) = rand_new_team_for_person; 
%     else 
%         rand_person_to_change = randi(params.team_size);
%         rand_new_team_for_person = 0;
%         old_team_indexes = find(current_solution == current_solution(rand_person_to_change));
%         % Making sure we didnt make un-valid group taking him out
%         if sum(Team.gender(old_team_indexes) == 'M') == 4 
%           valid = false;
%           return;
%         end
%         valid = true;
%         next_solution(rand_person_to_change) = rand_new_team_for_person;
%     end

end
