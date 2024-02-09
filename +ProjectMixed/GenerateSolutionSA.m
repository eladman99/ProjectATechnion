function [valid,next_solution] = GenerateSolutionSA(params,Team,current_solution)
    next_solution = current_solution;
    if rand(1,1) > params.probability_to_double_change
        rand_person_to_change = randi(params.team_size);
        if rand(1,1) > params.probability_to_rand_group % probabilty to maybe create new team
            rand_new_team_for_person = current_solution(randi([1 params.team_size],1));
        else 
            rand_new_team_for_person = randi([1 params.team_size]);
        end
        selected_team_indexes = find(current_solution == rand_new_team_for_person); 
        old_team_indexes = find(current_solution == current_solution(rand_person_to_change));
        if sum(Team.gender(old_team_indexes) == 'M') == 4 
          valid = false;
          return;
        end
        % Counting the genders in the selected groups
        num_of_male = sum(Team.gender(selected_team_indexes) == 'M');
        num_of_female= sum(Team.gender(selected_team_indexes) == 'F');
        % Making sure we didnt make un-valid group taking him out
        if current_solution(rand_person_to_change) == rand_new_team_for_person
            valid = false;
            return;
        end
        % Adding the new person's gender to the group
        if Team.gender(rand_person_to_change) == 'M'
            num_of_male = num_of_male +1;
        else 
            num_of_female = num_of_female + 1;
        end
    else
        rand_permutation = randperm(params.team_size);
        rand_person_to_change = rand_permutation(1:2);
        if rand(1,1) > params.probability_to_rand_group % probabilty to maybe create new team
            rand_new_team_for_person = current_solution(randi([1 params.team_size],1));
        else 
            rand_new_team_for_person = randi([1 params.team_size]);
        end
        selected_team_indexes = find(current_solution == rand_new_team_for_person);
        % checking the first change
       old_team_indexes = find(current_solution == current_solution(rand_person_to_change(1)));
       if  current_solution(rand_person_to_change(1)) ~= current_solution(rand_person_to_change(2))
           if sum(Team.gender(old_team_indexes) == 'M') == 4 
              valid = false;
              return;
            end
            % checking the second change
           old_team_indexes = find(current_solution == current_solution(rand_person_to_change(2)));
            if sum(Team.gender(old_team_indexes) == 'M') == 4 
              valid = false;
              return;
            end
            %checking if trying to put them in their old team
            if current_solution(rand_person_to_change(1)) == rand_new_team_for_person || current_solution(rand_person_to_change(2)) == rand_new_team_for_person
                valid = false;
                return;
            end
       end
        % checking number of male and female of the moving team
        num_of_male = sum(Team.gender(selected_team_indexes) == 'M');
        num_of_female= sum(Team.gender(selected_team_indexes) == 'F');
        if Team.gender(rand_person_to_change(1)) == 'M'
            num_of_male = num_of_male +1;
        else 
            num_of_female = num_of_female + 1;
        end
        if Team.gender(rand_person_to_change(2)) == 'M'
            num_of_male = num_of_male +1;
        else 
            num_of_female = num_of_female + 1;
        end
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
    elseif num_of_male == 0 && num_of_female == 1 %% alone
        valid = true;
    elseif num_of_male == 1 && num_of_female == 0 %% alone
        valid = true;
    end
      next_solution(rand_person_to_change) = rand_new_team_for_person; 


end
