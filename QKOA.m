% Quentum Kepler Optimization Algorithm
function [Sun_Score, Sun_Pose, Convergence_curve] = QuantumKOA(SearchAgents_no, Tmax, ub, lb, dim, fobj, fhd)


mapName = 'sinsuidal';

% Definitions
Sun_Pos = zeros(1, dim);
Sun_Score = inf;
Convergence_curve = zeros(1, Tmax);

% Controlling Parameters
Tc = 3;
M0 = 0.1;
lambda = 15;

% Initialization
orbital=rand(1,SearchAgents_no); %% Eq.(4)
 %% Orbital Period (T) 
T=abs(randn(1,SearchAgents_no)); %% Eq.(5)
Positions=initialization(SearchAgents_no,dim,ub,lb); % Initialize the positions of planets
t=0; %% Function evaluation counter 

Is=CallChaos(T+1,mapName);
Is=(Is-min(Is))/(max(Is)-min(Is));


% This for loop simulate random walks for Region 1
    for i=1:size(X,1)
        % Select ant lions based on their fitness (the better anlion the higher chance of catching ant)
        Rolette_index=RWS(1./min(FS));
        if Rolette_index==-1  
            Rolette_index=1;
        end
      
        % RA is the random walk around the selected antlion by rolette wheel
        RA=CRandomWalk(dim,T,lb,ub, X(Rolette_index,:),i,Is(i));
        
        % RA is the random walk around the elite (best antlion so far)
        [RE]=CRandomWalk(dim,T,lb,ub, X(1,:),i,Is(i));
        
        Y(i,:)= (RA(i,:)+RE(i,:))/2; % Equation (2.13) in the paper          
    end
    

end %% End Funciton
