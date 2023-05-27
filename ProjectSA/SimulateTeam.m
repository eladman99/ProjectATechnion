function [Team] = SimulateTeam()
    Team.graph = [0 10 0 0 0 0;
                  10 0 0 0 0 0;
                  0 0 0 11 0 0;
                  0 0 11 0 0 0;
                  0 0 0 0 0 13;
                  0 0 0 0 13 0
                        ];
    Team.gender = ["M" "M" "F" "M" "M" "F"];
