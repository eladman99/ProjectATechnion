function [new_probabilty] = CalculateNextProbabilty(params,Team,best_solutions,old_probabilites)
     new_probabilty = zeros(params.team_size);
     for k=1:size(best_solutions,1)
         for i=1:params.team_size
            member_team = best_solutions(k,i);
            team_members_indexes = find(best_solutions(k,:) == member_team);
            new_probabilty(team_members_indexes,team_members_indexes) = new_probabilty(team_members_indexes,team_members_indexes) + 1/(length(team_members_indexes)) ;
         end
     end
     new_probabilty = params.perc_of_advance*(new_probabilty/size(best_solutions,1)) +(1-params.perc_of_advance)*old_probabilites ;
     new_probabilty = new_probabilty - diag(diag(new_probabilty));
end
