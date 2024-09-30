%% LOAD and PLOT data: NORM

clear
load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_frac_EO_norm 
load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_frac_EO_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_frac_EO_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_frac_EO_norm 
load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_osci_EO_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_osci_EO_norm   
load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_osci_EO_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_osci_EO_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_frac_EC_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_frac_EC_norm   
load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_frac_EC_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_frac_EC_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_osci_EC_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_osci_EC_norm   
load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_osci_EC_norm  
load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_osci_EC_norm 

% load .\GRANDAVG\GA12_AAL90_IRASA_PLAdiff_frac_EO 
% load .\GRANDAVG\GA12_AAL90_IRASA_KETdiff_frac_EO 
% load .\GRANDAVG\GA12_AAL90_IRASA_PLAdiff_osci_EO 
% load .\GRANDAVG\GA12_AAL90_IRASA_KETdiff_osci_EO 
% load .\GRANDAVG\GA12_AAL90_IRASA_PLAdiff_frac_EC 
% load .\GRANDAVG\GA12_AAL90_IRASA_KETdiff_frac_EC 
% load .\GRANDAVG\GA12_AAL90_IRASA_PLAdiff_osci_EC 
% load .\GRANDAVG\GA12_AAL90_IRASA_KETdiff_osci_EC 

%% FRAC 
PLApre  = GA12_PLApre_frac_EO;
PLApost = GA12_PLApost_frac_EO;
KETpre  = GA12_KETpre_frac_EO;
KETpost = GA12_KETpost_frac_EO;

for i=1:length(PLApre.label)
    cfg.channel=PLApre.label{i};
    if i<17
        figure(1)
        subplot(4,4,i);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    elseif i>16 && i<33
        figure(2)
        subplot(4,4,i-16);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
     elseif i>32 && i<49
        figure(3)
        subplot(4,4,i-32);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    elseif i>48 && i<65
        figure(4)
        subplot(4,4,i-48);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    elseif i>64 && i<81
        figure(5)
        subplot(4,4,i-64);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    else 
        figure(6)
        subplot(4,4,i-80);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    end
end


%% OSCI EO
PLApre  = GA12_PLApre_osci_EC;
PLApost = GA12_PLApost_osci_EC;
KETpre  = GA12_KETpre_osci_EC;
KETpost = GA12_KETpost_osci_EC;



for i=1:length(PLApre.label)
    cfg.channel=PLApre.label{i};
    if i<17
        figure(1)
        subplot(4,4,i);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    elseif i>16 && i<33
        figure(2)
        subplot(4,4,i-16);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
     elseif i>32 && i<49
        figure(3)
        subplot(4,4,i-32);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    elseif i>48 && i<65
        figure(4)
        subplot(4,4,i-48);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    elseif i>64 && i<81
        figure(5)
        subplot(4,4,i-64);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    else 
        figure(6)
        subplot(4,4,i-80);
        semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
        hold on;
        semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
        hold on;
        semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
        xlim([3 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApre','PLApost','KETpre','KETpost')
        end
    end
end


% % see difference between normalized and not normalized
% PLApre  = GA12_PLApre_frac_EC;
% PLApost = GA12_PLApost_frac_EC;
% KETpre  = GA12_KETpre_frac_EC;
% KETpost = GA12_KETpost_frac_EC;
% 
% load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_frac_EO
% load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_frac_EO 
% load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_frac_EO  
% load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_frac_EO 
% load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_osci_EO  
% load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_osci_EO   
% load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_osci_EO 
% load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_osci_EO  
% load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_frac_EC 
% load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_frac_EC   
% load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_frac_EC 
% load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_frac_EC  
% load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_osci_EC  
% load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_osci_EC   
% load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_osci_EC 
% load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_osci_EC
% 
% PLApre2  = GA12_PLApre_frac_EC;
% PLApost2 = GA12_PLApost_frac_EC;
% KETpre2  = GA12_KETpre_frac_EC;
% KETpost2 = GA12_KETpost_frac_EC;
% 
% for i=1:16
%     cfg.channel=PLApre.label{1};
%         figure
%        % subplot(4,4,i);
%         semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(PLApost.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
%         hold on;
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         hold on
%         semilogy(PLApre2.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(PLApost2.freq, PLApost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0.5 0.5 0.5]);
%         hold on;
%         semilogy(KETpre2.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         semilogy(KETpost2.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre-norm','PLApost-norm','KETpre-norm','KETpost-norm','PLApre','PLApost','KETpre','KETpost')
%         end
% end

%% FRAC EO DIFF
% PLAdiff  = GA12_PLAdiff_frac_EC;
% KETdiff  = GA12_KETdiff_frac_EC;
% 
% for i=1:length(PLAdiff.label)
%     cfg.channel=PLAdiff.label{i};
%     if i<17
%         figure(1)
%         subplot(4,4,i);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLAdiff','KETdiff')
%         end
%     elseif i>16 && i<33
%         figure(2)
%         subplot(4,4,i-16);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%           title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%      elseif i>32 && i<49
%         figure(3)
%         subplot(4,4,i-32);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%     elseif i>48 && i<65
%         figure(4)
%         subplot(4,4,i-48);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%     elseif i>64 && i<81
%         figure(5)
%         subplot(4,4,i-64);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%     else 
%         figure(6)
%         subplot(4,4,i-80);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%     end
% end


%% OSCI EO
% PLAdiff  = GA12_PLAdiff_osci_EC;
% KETdiff  = GA12_KETdiff_osci_EC;
% 
% for i=1:length(PLAdiff.label)
%     cfg.channel=PLAdiff.label{i};
%     if i<17
%         figure(1)
%         subplot(4,4,i);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLAdiff','KETdiff')
%         end
%     elseif i>16 && i<33
%         figure(2)
%         subplot(4,4,i-16);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%           title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%      elseif i>32 && i<49
%         figure(3)
%         subplot(4,4,i-32);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%     elseif i>48 && i<65
%         figure(4)
%         subplot(4,4,i-48);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%     elseif i>64 && i<81
%         figure(5)
%         subplot(4,4,i-64);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%     else 
%         figure(6)
%         subplot(4,4,i-80);
%         semilogy(PLAdiff.freq, PLAdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff.freq, KETdiff.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 1]);
%         hold on;
%         title(sprintf('aperiodic in %s', PLAdiff.label{i}),'Interpreter','none','FontSize',8);
%         xlim([3 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','PLApost','KETpre','KETpost')
%         end
%     end
% end
