%% PLOTTING FFT DATA
clear all
load .\GRANDAVG\GA12_AAL90_EO_PLApre_FFT_norm_dft2 % GA13_PLApre
load .\GRANDAVG\GA12_AAL90_EO_PLApost_FFT_norm_dft2 % GA13_PLApost
load .\GRANDAVG\GA12_AAL90_EO_KETpre_FFT_norm_dft2 % GA13_KETpre
load .\GRANDAVG\GA12_AAL90_EO_KETpost_FFT_norm_dft2 % GA13_KETpost
load .\GRANDAVG\GA12_AAL90_EO_PLAdiff_FFT_norm_dft2 % GA13_PLAdiff
load .\GRANDAVG\GA12_AAL90_EO_KETdiff_FFT_norm_dft2 % GA13_KETdiff
load .\GRANDAVG\GA12_AAL90_EC_PLApre_FFT_norm_dft2 % GA13_PLApre
load .\GRANDAVG\GA12_AAL90_EC_PLApost_FFT_norm_dft2 % GA13_PLApost
load .\GRANDAVG\GA12_AAL90_EC_KETpre_FFT_norm_dft2 % GA13_KETpre
load .\GRANDAVG\GA12_AAL90_EC_KETpost_FFT_norm_dft2 % GA13_KETpost
load .\GRANDAVG\GA12_AAL90_EC_PLAdiff_FFT_norm_dft2 % GA13_PLAdiff
load .\GRANDAVG\GA12_AAL90_EC_KETdiff_FFT_norm_dft2 % GA13_KETdiff

PLApre_EO  = GA12_PLApre_EO;
PLApost_EO = GA12_PLApost_EO;
KETpre_EO  = GA12_KETpre_EO;
KETpost_EO = GA12_KETpost_EO;
PLAdiff_EO = GA12_PLAdiff_EO;
KETdiff_EO = GA12_KETdiff_EO;

PLApre_EC  = GA12_PLApre_EC;
PLApost_EC = GA12_PLApost_EC;
KETpre_EC  = GA12_KETpre_EC;
KETpost_EC = GA12_KETpost_EC;
PLAdiff_EC = GA12_PLAdiff_EC;
KETdiff_EC = GA12_KETdiff_EC;

%% consistent with STATS plots
% data1   = GA13_PLApre;
% data2   = GA13_PLApost;
% data3   = GA13_KETpre;
% data4   = GA13_KETpost;

% select statistical ROIs 
cfg                 = [];
cfg.channel         = {'LMFG','RMFG'};
% cfg.channel         = {'LSFGdor','RSFGdor','LMFG','LPreCG','LORBmid','LPAL'};
cfg.avgoverchan     = 'yes';
PLApre_EO_ROI           = ft_selectdata(cfg, PLApre_EO);
PLApre_EO_ROI.label     = {'ROI'};
PLApost_EO_ROI           = ft_selectdata(cfg, PLApost_EO);
PLApost_EO_ROI.label     = {'ROI'};
KETpre_EO_ROI           = ft_selectdata(cfg, KETpre_EO);
KETpre_EO_ROI.label     = {'ROI'};
KETpost_EO_ROI           = ft_selectdata(cfg, KETpost_EO);
KETpost_EO_ROI.label     = {'ROI'};
PLApre_EC_ROI           = ft_selectdata(cfg, PLApre_EC);
PLApre_EC_ROI.label     = {'ROI'};
PLApost_EC_ROI           = ft_selectdata(cfg, PLApost_EC);
PLApost_EC_ROI.label     = {'ROI'};
KETpre_EC_ROI           = ft_selectdata(cfg, KETpre_EC);
KETpre_EC_ROI.label     = {'ROI'};
KETpost_EC_ROI           = ft_selectdata(cfg, KETpost_EC);
KETpost_EC_ROI.label     = {'ROI'};


%figure(1)
%subplot(2,2,1);
% allCONDs
figure
semilogy(PLApre_EO_ROI.freq, PLApre_EO_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [0 0 0]);
hold on;
semilogy(PLApost_EO_ROI.freq, PLApost_EO_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
hold on;
semilogy(KETpre_EO_ROI.freq, KETpre_EO_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [1 0 0]);
hold on;
semilogy(KETpost_EO_ROI.freq, KETpost_EO_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
title('FFT-spectrum in LMFG/RMFG EO','FontSize',10);
xlim([3 90]);
ylabel('PSD','FontSize',10)
xlabel('Frequencies (Hz)','FontSize',10)
legend('PLApre','PLApost','KETpre','KETpost')


figure
plot(PLApre_EO_ROI.freq, PLApre_EO_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [0 0 0]);
hold on;
plot(PLApost_EO_ROI.freq, PLApost_EO_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
hold on;
plot(KETpre_EO_ROI.freq, KETpre_EO_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [1 0 0]);
hold on;
plot(KETpost_EO_ROI.freq, KETpost_EO_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
title('FFT-spectrum in LMFG/RMFG EO','FontSize',10);
xlim([3 45]);
ylabel('PSD','FontSize',10)
xlabel('Frequencies (Hz)','FontSize',10)
legend('PLApre','PLApost','KETpre','KETpost')

figure
semilogy(PLApre_EC_ROI.freq, PLApre_EC_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [0 0 0]);
hold on;
semilogy(PLApost_EC_ROI.freq, PLApost_EC_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
hold on;
semilogy(KETpre_EC_ROI.freq, KETpre_EC_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [1 0 0]);
hold on;
semilogy(KETpost_EC_ROI.freq, KETpost_EC_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
title('FFT-spectrum in LMFG/RMFG EO','FontSize',10);
xlim([3 45]);
ylabel('PSD','FontSize',10)
xlabel('Frequencies (Hz)','FontSize',10)
legend('PLApre','PLApost','KETpre','KETpost')


figure
plot(PLApre_EC_ROI.freq, PLApre_EC_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [0 0 0]);
hold on;
plot(PLApost_EC_ROI.freq, PLApost_EC_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
hold on;
plot(KETpre_EC_ROI.freq, KETpre_EC_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [1 0 0]);
hold on;
plot(KETpost_EC_ROI.freq, KETpost_EC_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
title('FFT-spectrum in LMFG/RMFG EO','FontSize',10);
xlim([3 45]);
ylabel('PSD','FontSize',10)
xlabel('Frequencies (Hz)','FontSize',10)
legend('PLApre','PLApost','KETpre','KETpost')




% hold on;
% subplot(2,2,2);
% % KETpost vs KETpre
% semilogy(data3_ROI.freq, data3_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [1 0 0]);
% hold on;
% semilogy(data4_ROI.freq, data4_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
% title('FFT-spectrum in LMFG/RMFG','FontSize',10);
% xlim([3 45]);
% ylabel('PSD','FontSize',10)
% xlabel('Frequencies (Hz)','FontSize',10)
% legend('KETpre','KETpost')
% hold on;
% subplot(2,2,3);
% % KETpre vs PLApre
% semilogy(data1_ROI.freq, data1_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [0 0 0]);
% hold on;
% semilogy(data3_ROI.freq, data3_ROI.powspctrm, 'Linewidth', 1, 'Linestyle', '-', 'Color', [1 0 0]);
% title('FFT-spectrum in LMFG/RMFG','FontSize',10);
% xlim([3 45]);
% ylabel('PSD','FontSize',10)
% xlabel('Frequencies (Hz)','FontSize',10)
% legend('PLApre','KETpre')
% hold on;
% subplot(2,2,4);
% % KETpost vs PLApost
% semilogy(data2_ROI.freq, data2_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
% hold on;
% semilogy(data4_ROI.freq, data4_ROI.powspctrm, 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
% title('FFT-spectrum in LMFG/RMFG','FontSize',10);
% xlim([3 45]);
% ylabel('PSD','FontSize',10)
% xlabel('Frequencies (Hz)','FontSize',10)
% legend('PLApost','KETpost')


%% PLOT all AAL90 regions: KETpre vs KETpost 

% for i=1:length(KETpre.label)
%     if i<17
%         figure(1)
%         subplot(4,4,i);
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('KETpre','KETpost')
%         end
%      elseif i>16 && i<33
%         figure(2)
%         subplot(4,4,i-16);
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 17
%             legend('KETpre','KETpost')
%         end
%      elseif i>32 && i<49
%         figure(3)
%         subplot(4,4,i-32);
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 33
%             legend('KETpre','KETpost')
%         end
%     elseif i>48 && i<65
%         figure(4)
%         subplot(4,4,i-48);
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 49
%             legend('KETpre','KETpost')
%         end
%     elseif i>64 && i<81
%         figure(5)
%         subplot(4,4,i-64);
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 65
%             legend('KETpre','KETpost')
%         end
%     else 
%         figure(6)
%         subplot(4,4,i-80);
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpost.freq, KETpost.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 81
%             legend('KETpre','KETpost')
%         end
%     end
% end
% 
% % clear all
% 
% %% PLOT all AAL90 regions: PLApre vs KETpre 
% 
% for i=1:length(PLApre.label)
%     if i<17
%         figure(1)
%         subplot(4,4,i);
%         semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLApre','KETpre')
%         end
%      elseif i>16 && i<33
%         figure(2)
%         subplot(4,4,i-16);
%         semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 17
%             legend('PLApre','KETpre')
%         end
%      elseif i>32 && i<49
%         figure(3)
%         subplot(4,4,i-32);
%         semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 33
%             legend('PLApre','KETpre')
%         end
%     elseif i>48 && i<65
%         figure(4)
%         subplot(4,4,i-48);
%         semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 49
%             legend('PLApre','KETpre')
%         end
%     elseif i>64 && i<81
%         figure(5)
%         subplot(4,4,i-64);
%         semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 65
%             legend('PLApre','KETpre')
%         end
%     else 
%         figure(6)
%         subplot(4,4,i-80);
%         semilogy(PLApre.freq, PLApre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETpre.freq, KETpre.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLApre.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 81
%             legend('PLApre','KETpre')
%         end
%     end
% end

%% PLOT all AAL90 regions: PLApost vs KETpost 

for i=1:length(PLApre_EO.label)
    if i<17
        figure(1)
        subplot(4,4,i);
        plot(PLApost_EO.freq, PLApost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        hold on;
        plot(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EO.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApost EO','KETpost EO')
        end
     elseif i>16 && i<33
        figure(2)
        subplot(4,4,i-16);
        plot(PLApost_EO.freq, PLApost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        hold on;
        plot(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EO.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 17
            legend('PLApost EO','KETpost EO')
        end
     elseif i>32 && i<49
        figure(3)
        subplot(4,4,i-32);
        plot(PLApost_EO.freq, PLApost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        hold on;
        plot(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EO.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 33
            legend('PLApost EO','KETpost EO')
        end
    elseif i>48 && i<65
        figure(4)
        subplot(4,4,i-48);
        plot(PLApost_EO.freq, PLApost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        hold on;
        plot(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EO.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 49
            legend('PLApost EO','KETpost EC')
        end
    elseif i>64 && i<81
        figure(5)
        plot(4,4,i-64);
        semilogy(PLApost_EO.freq, PLApost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        hold on;
        plot(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EO.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 65
            legend('PLApost EO','KETpost EO')
        end
    else 
        figure(6)
        subplot(4,4,i-80);
        plot(PLApost_EO.freq, PLApost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        hold on;
        plot(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [0 0 0]);
        hold on;
        plot(KETpost_EO.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '--', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EO.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 81
            legend('PLApost EO','KETpost EO')
        end
    end
end

% EC
for i=1:length(PLApre_EC.label)
    if i<17
        figure(1)
        subplot(4,4,i);
        semilogy(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(KETpost_EC.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EC.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 1
            legend('PLApost EC','KETpost EC')
        end
     elseif i>16 && i<33
        figure(2)
        subplot(4,4,i-16);
        semilogy(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(KETpost_EC.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EC.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 17
            legend('PLApost EC','KETpost EC')
        end
     elseif i>32 && i<49
        figure(3)
        subplot(4,4,i-32);
        semilogy(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(KETpost_EC.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EC.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 33
            legend('PLApost EC','KETpost EC')
        end
    elseif i>48 && i<65
        figure(4)
        subplot(4,4,i-48);
        semilogy(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(KETpost_EC.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EC.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 49
            legend('PLApost EC','KETpost EC')
        end
    elseif i>64 && i<81
        figure(5)
        subplot(4,4,i-64);
        semilogy(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(KETpost_EC.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EC.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 65
            legend('PLApost EC','KETpost EC')
        end
    else 
        figure(6)
        subplot(4,4,i-80);
        semilogy(PLApost_EC.freq, PLApost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
        hold on;
        semilogy(KETpost_EC.freq, KETpost_EC.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
        title(sprintf('aperiodic in %s', PLApre_EC.label{i}),'Interpreter','none','FontSize',8);
        xlim([1 90]);
        ylabel('PSD','FontSize',10)
        xlabel('Frequencies (Hz)','FontSize',10)
        if i == 81
            legend('PLApost EC','KETpost EC')
        end
    end
end


%% PLOT all AAL90 regions: PLAdiff vs KETdiff 
% 
% for i=1:length(PLAdiff_EO.label)
%     if i<17
%         figure(1)
%         subplot(4,4,i);
%         semilogy(PLAdiff_EO.freq, PLAdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff_EO.freq, KETdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLAdiff_EO.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 1
%             legend('PLAdiff EO','KETdiff EO')
%         end
%      elseif i>16 && i<33
%         figure(2)
%         subplot(4,4,i-16);
%         semilogy(PLAdiff_EO.freq, PLAdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff_EO.freq, KETdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLAdiff_EO.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 17
%             legend('PLAdiff EO','KETdiff EO')
%         end
%      elseif i>32 && i<49
%         figure(3)
%         subplot(4,4,i-32);
%         semilogy(PLAdiff_EO.freq, PLAdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff_EO.freq, KETdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLAdiff_EO.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 33
%             legend('PLAdiff EO','KETdiff EO')
%         end
%     elseif i>48 && i<65
%         figure(4)
%         subplot(4,4,i-48);
%         semilogy(PLAdiff_EO.freq, PLAdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff_EO.freq, KETdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLAdiff_EO.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 49
%             legend('PLAdiff EO','KETdiff EC')
%         end
%     elseif i>64 && i<81
%         figure(5)
%         subplot(4,4,i-64);
%         semilogy(PLAdiff_EO.freq, PLAdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff_EO.freq, KETdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLAdiff_EO.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 65
%             legend('PLAdiff EO','KETdiff EO')
%         end
%     else 
%         figure(6)
%         subplot(4,4,i-80);
%         semilogy(PLAdiff_EO.freq, PLAdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [0 0 0]);
%         hold on;
%         semilogy(KETdiff_EO.freq, KETdiff_EO.powspctrm(i,:), 'Linewidth', 2, 'Linestyle', '-', 'Color', [1 0 0]);
%         title(sprintf('aperiodic in %s', PLAdiff_EO.label{i}),'Interpreter','none','FontSize',8);
%         xlim([1 90]);
%         ylabel('PSD','FontSize',10)
%         xlabel('Frequencies (Hz)','FontSize',10)
%         if i == 81
%             legend('PLAdiff EO','KETdiff EO')
%         end
%     end
% end


% clear all





