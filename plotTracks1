function plotTracks1(X,markovStateSeq)
%markovStateSeq is the stete before pEM
%stateSeq is the stete after pEM

%plot 5 states in different colors based on their groud truth
offset1=80;
offset2=offset1*2;
offset3=offset1*3;
offset4=offset1*4;
figure; hold on; box on;
% state=markovStateSeq;
for g=1:length(X)
    x=X{g}(:,1);
    y=X{g}(:,2);
    beforestate=markovStateSeq(g);
    if beforestate==1
        plot(x,y,'g');
        
    elseif beforestate==2
        plot(x+offset1,y,'r');
        
    elseif beforestate==3
        plot(x+offset2,y,'b');
        
    elseif beforestate==4
        plot(x+offset3,y,'y');
        
    elseif beforestate==5
        plot(x+offset4,y,'m');
    end
end

hold on;
set(gca,'fontsize',20,'linewidth',2);


h = zeros(5, 1);
h(1) = plot(NaN,NaN,'-g');
h(2) = plot(NaN,NaN,'-r');
h(3) = plot(NaN,NaN,'-b');
h(4) = plot(NaN,NaN,'-y');
h(5) = plot(NaN,NaN,'-m');
% h(4) = plot(NaN,NaN,'-y');
legend(h, 'state1','state2','state3','state4','state5');

xlabel('Positions (\mum)','fontsize',20);
ylabel('Positions (\mum)','fontsize',20);
% title('Track trajectories of different diffusive states (Ground Truth)','fontsize',16);
% hold off;
end


