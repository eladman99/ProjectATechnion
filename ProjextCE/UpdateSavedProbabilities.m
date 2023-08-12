function [new_saved_probabilites] = UpdateSavedProbabilities(saved_probabilites,new_probabilities)
    row_norms = sum(new_probabilities, 2);
    normalized_new_probabilities = new_probabilities ./ row_norms;
    new_saved_probabilites = cat(3,saved_probabilites,normalized_new_probabilities);
end
