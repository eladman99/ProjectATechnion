function [Team] = SimulateTeamCE()
    Team.graph = [0 10 0 0 0 0 0 0 0 0 0 ;
                  10 0 0 0 0 0 0 0 0 0 0 ;
                  0 0 0 10 0 0 0 0 0 0 0 ;
                  0 0 10 0 0 0 0 0 0 0 0 ;
                  0 0 0 0 0 10 0 0 0 0 0 ;
                  0 0 0 0 10 0 0 0 0 0 0 ;
                  0 0 0 0 0 0 0 10 10 0 0;
                  0 0 0 0 0 0 10 0 10 0 0;
                  0 0 0 0 0 0 10 10 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 15 ;
                  0 0 0 0 0 0 0 0 0 15 0 
                  
                        ];
%     Team.graph = [0 10 0 0 0 0 0 0 0 ;
%                   10 0 0 0 0 0 0 0 0 ;
%                   0 0 0 10 0 0 0 0 0 ;
%                   0 0 10 0 0 0 0 0 0 ;
%                   0 0 0 0 0 10 0 0 0 ;
%                   0 0 0 0 10 0 0 0 0 ;
%                   0 0 0 0 0 0 0 10 10;
%                   0 0 0 0 0 0 10 0 10;
%                   0 0 0 0 0 0 10 10 0
% 
%                   
%                         ];


    Team.gender = ['M' 'M' 'M' 'M' 'F' 'F' 'F' 'F' 'F''M' 'M' 'M' 'M'];
