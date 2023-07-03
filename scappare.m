
function movimento=scappare(maze)
yalmip('clear')
tic;
% MODELLO PACMAN
 A=[1,0;0,1];
 B=[1,-1,0,0;0,0,1,-1];
 nx = 2; % Number of states
 nu = 4; % Number of inputs
 N = 3;
% % Initial state
 [startRowP,startColP]=(find(maze==3));
 [startRowG,startColG]=(find(maze==4));
 x0 = [startRowP;startColP];

[rowR,colR]=find(maze==2); %Calcolo la posizione dei rewards %Calcolo la posizione dei rewards
%ricaviamo il reward a minor distanza da [StartRowP,startColP] per poi minimizzarla
min_dist=45;
for k=1:numel(rowR)
    partial_dist=norm(([startRowP,startColP]-[rowR(k),colR(k)]),1);
    if partial_dist<min_dist
        min_dist=partial_dist;
        nearR=rowR(k);
        nearC=colR(k);
    end
end
u = binvar(repmat(nu,1,N),repmat(1,1,N));
x = intvar(repmat(nx,1,N+1),repmat(1,1,N+1));
constraints=[];
objective = 0;

[colmuri,rigmuri]=find(maze(2:6,2:16)==1 |  maze(2:6,2:16)==7 );
for i=0:length(colmuri)
    ostacoli=(colmuri+1)*100+rigmuri+1;
end

z = binvar(repmat(2*length(ostacoli),1,N),repmat(1,1,N));

for k = 1:N
    objective = objective+0.22*norm((x{k+1}-[startRowG;startColG]),1)-0.11*norm((x{k+1}-[nearR;nearC]),1);

    constraints = [constraints, x{k+1} == A*x{k} + B*u{k}];
    for s =1:length(ostacoli)
        constraints = [constraints, 100*x{k+1}(1)+x{k+1}(2)-ostacoli(s)+0.5<=1000*z{k}(s) , -100*x{k+1}(1)-x{k+1}(2)+ostacoli(s)+0.5<=1000*z{k}(s+length(ostacoli)), z{k}(s)+z{k}(s+length(ostacoli))==1];
    end
    constraints = [constraints, u{k}(1)+u{k}(2)+u{k}(3)+u{k}(4)==1, 2<=x{k+1}(1), x{k+1}(1)<=6,2<=x{k+1}(2), x{k+1}(2)<=16 ];
end

controller = optimizer(constraints, -objective,[],x{1},[u{:}]);
x = x0;
implementedU = [];
for i = 1:N
  U = controller{x};
  x = A*x + B*U(:,1);
implementedU = [implementedU,U(:,1)];
end


implementedU

uottimo=1000*round(implementedU(1,1))+100*round(implementedU(2,1))+10*round(implementedU(3,1))+round(implementedU(4,1));
switch(uottimo)
    case(1000)
    movimento="S";
    case(100)
    movimento="N"; 
    case(10)
    movimento="E";
    case(1)
    movimento="W";
end

tempo = toc;  % Ottieni il tempo di esecuzione
    disp(['Il tempo di esecuzione è: ' num2str(tempo) ' secondi.']);
end