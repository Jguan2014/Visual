function plotTracks4(X,markovStateSeq,stateSeq)

%--------------------------------------------------------------------------
% This function plot tracks based on their state sequence 
% Note: markovStateSeq is the ground truth and stateSeq is the estimated
% state sequence
% Code written by:
%       Ben Guan 
%--------------------------------------------------------------------------

%markovStateSeq is the stete before pEM
%stateSeq is the stete after pEM
offset1=8;
offset2=offset1*2;
offset3=offset1*3;
figure; hold on; box on;
% state=markovStateSeq;
%g is the number of tracks

for g=1:length(stateSeq)
    x=X{1,g}(:,1);
    y=X{1,g}(:,2);
    stateBefore=markovStateSeq{g,1};
    stateAfter=stateSeq{g,1};
    foo=diff(stateBefore);
    foo1=diff(stateAfter);
    goo=transpose(find(foo));
    goo1=transpose(find(foo1));
    l=length(stateAfter);
    goo=sort([goo goo1 l]);
    start=1;
    last=1;
    
    %loop through whole column of x
    
    %output last when state changes
    for m=1:length(goo)
        last=goo(m);
        x1=x(start:last);
        y1=y(start:last);
        beforestate=stateBefore(start); %before pEM
        afterstate=stateAfter(start);   %after pEM
        
%         if state does not change, plot it  with diff offsets
        
                        if afterstate==beforestate
                            if afterstate==1
                                plot(x1,y1,'g');
                            elseif afterstate==2
                               plot(x1+offset1,y1,'r');
                            elseif afterstate==3
                               plot(x1+offset2,y1,'b');
                            elseif afterstate==4
                                plot(x1+offset3,y1,'y');
                            end
                        end
        
        if afterstate~=beforestate
            %if state changes, plot it with a different color at the same location,
            %with no offset
            if beforestate==1
                if afterstate==2
                    plot(x1,y1,'r');
                elseif afterstate==3
                    plot(x1,y1,'b');
                elseif afterstate==4
                    plot(x1,y1,'y');
                end
            end
            if beforestate==2
                if afterstate==1
                    plot(x1+offset1,y1,'g');
                elseif afterstate==3
                    plot(x1+offset1,y1,'b');
                elseif afterstate==4
                    plot(x1+offset1,y1,'y');
                end
            end
            if beforestate==3
                if afterstate==1
                    plot(x1+offset2,y1,'g');
                elseif afterstate==2
                    plot(x1+offset2,y1,'r');
                elseif afterstate==4
                    plot(x1+offset2,y1,'y');
                end
            end
            if beforestate==4
                if afterstate==1
                    plot(x1+offset3,y1,'g');
                elseif afterstate==2
                    plot(x1+offset3,y1,'r');
                elseif afterstate==3
                    plot(x1+offset3,y1,'b');
                end
            end
        end
        
        clear x1;
        clear y1;
        start=last+1;
        
    end
    
    %           x1=x(last:end);
    %           y1=y(last:end);
    %           // afterstate=stateAfter(last);
    %           //           if afterstate==1
    %           //               plot(x1,y1,'g');
    %           //           elseif afterstate==2
    %           //              plot(x1+offset1,y1,'r');
    %           //           elseif afterstate==3
    %           //               plot(x1+offset2,y1,'b');
    %           //           elseif afterstate==4
    %           //               plot(x1+offset3,y1,'y');
    %                     // end
    clear x1;
    clear y1;
end

hold on;
h = zeros(4, 1);
h(1) = plot(NaN,NaN,'-g');
h(2) = plot(NaN,NaN,'-r');
h(3) = plot(NaN,NaN,'-b');
h(4) = plot(NaN,NaN,'-y');
legend(h, 'state1','state2','state3','state4');

xlabel('Positions (\mum)','fontsize',16);
ylabel('Positions (\mum)','fontsize',16);
title('Track trajectories of different diffusive states( pEM analysis)','fontsize',16);

hold off;
end