%calculate the difference of all parameters
function [MSD,Vacf]=MSD_Vacf(X,est_stateSeq,plotMSD,numStates)
%plot MSD and Vacf:
%%


%plot MSD
splitX = X;
numLags = size(splitX{1},1)-1;

% %ground truth
% [stateMSD,stateMSDerror,stateN] = AverageMSD(splitX,real_stateSeq,numLags);
% [stateVACF,tateVACFerror,stateN] = AverageVACF(splitX,real_stateSeq);

%analysis
[est_stateMSD,est_stateMSDerror,est_stateN] = AverageMSD(splitX,est_stateSeq,numLags);
[est_stateVACF,est_stateVACFerror,est_stateN] = AverageVACF(splitX,est_stateSeq);


%%

figure; hold on; box on;
colorSet = hsv(numStates);
timeLags = 1:numLags;
legendname = 'h = legend(';
%%
for i = 1:numStates
    stderror = est_stateMSDerror(i,:)./sqrt(est_stateN(i));
    %         est_stateMSDerror(i,:)=log(est_stateMSDerror(i,:));
    %         stateMSD(i,:)=log(stateMSD(i,:));
    %         plot(timeLags,stateMSD(i,:),'color',colorSet(i,:),'linewidth',1.5); %ground truth
    errorbar(timeLags,est_stateMSD(i,:),stderror,'color',colorSet(i,:),'linewidth',1.5); %analysis
    
    %         legendname = [legendname '''State ' num2str(i) ''',' '''State ' num2str(i) 'Analysis'','];
    legendname = [legendname '''State ' num2str(i) ''','];
        
    end
    
    set(gca,'fontsize',20,'linewidth',2);
    xlim([1 numLags]);
    eval([legendname(1:end-1) ');']);
    set(h,'box','off','location','northwest','fontsize',20);
    xlabel('Time lag (steps)','fontsize',20);
    ylabel('MSD (\mum^2)','fontsize',20);
    
    
    
    %%
    
    figure; hold on; box on;
    colorSet = hsv(numStates);
    timeLags = 1:numLags;
    legendname = 'h = legend(';
    for i = 1:numStates
    stderror = est_stateVACFerror(i,:)./sqrt(est_stateN(i));
    %         plot(timeLags,stateVACF(i,:),'color',colorSet(i,:),'linewidth',1.5);
    errorbar(timeLags,est_stateVACF(i,:),stderror,'color',colorSet(i,:),'linewidth',1.5);
    
    legendname = [legendname '''State ' num2str(i) ''','];
    end
    set(gca,'fontsize',20,'linewidth',2);
    eval([legendname(1:end-1) ');']);
    set(h,'box','off','location','northeast','fontsize',20);
    xlabel('Time lags (steps)','fontsize',20);
    ylabel('Covariance (\mum^2)','fontsize',20);
    axis tight;
    %
    %     MSD.truth=stateMSD;
    MSD.analysis=est_stateMSD;
    
    %     Vacf.truth=stateVACF;
    Vacf.analysis=est_stateVACF;
    disp('done');
    
    %%
    %     figure; hold on;
    %     legendname = 'h = legend(';
    %     colorSet = hsv(numStates);
    %
    %     for i = 1:numStates
    %         plot(timeLags,100*(abs((stateMSD(i,:)-est_stateMSD(i,:))./abs(stateMSD(i,:)))),'color',colorSet(i,:),'linewidth',1.5);
    %         legendname = [legendname '''State ' num2str(i) 'MSD %'','];
    %
    %     end
    %     set(gca,'fontsize',20,'linewidth',2);
    %     eval([legendname(1:end-1) ');']);
    %     set(h,'box','off','location','northwest','fontsize',20);
    %     xlim([1 numLags]);
    %     xlabel('Time lags (steps)','fontsize',20);
    %     ylabel('Percent Difference','fontsize',20);
    %     title('MSD Percent Deviation');
    %
    %     figure;hold on;
    %     legendname = 'h = legend(';
    %     for i = 1:numStates
    %         plot(timeLags,100*(abs(abs(stateVACF(i,:))-abs(est_stateVACF(i,:)))./abs(max([stateVACF(i,:) est_stateVACF(i,:)]))),'color',colorSet(i,:),'linewidth',1.5);
    %         legendname = [legendname '''State ' num2str(i) 'VACF %'','];
    %     end
    %
    %     set(gca,'fontsize',20,'linewidth',2);
    %     eval([legendname(1:end-1) ');']);
    %     set(h,'box','off','location','northwest','fontsize',20);
    %     xlim([1 numLags]);
    %     xlabel('Time lags (steps)','fontsize',20);
    %     ylabel('Percent Difference','fontsize',20);
    %     title('Convariance Matrices Percent Deviation');
    % end
