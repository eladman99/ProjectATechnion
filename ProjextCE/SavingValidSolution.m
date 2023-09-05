function [valid] = SavingValidSolution(Team,groups)
        valid = false;
        for igroup=1:size(Team.gender,2)
            selected_team_indexes = find(groups == igroup);
            % checking number of male and female of the moving team
            num_of_male = sum(Team.gender(selected_team_indexes) == 'M');
            num_of_female= sum(Team.gender(selected_team_indexes) == 'F');
    
            % Checking the validation of the new solution
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
            
            if valid == false
                 return;
            end
        end
end
