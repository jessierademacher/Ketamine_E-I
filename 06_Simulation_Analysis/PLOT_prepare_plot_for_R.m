clear all


%% FFT spectrum: simulations hanning

load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\control_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_80_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\SST_80_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_SST_80_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\interneurons_80_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\neurons_80_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\spike_rate_80_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_70_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_60_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_40_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_20_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\SST_100_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\SST_60_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\SST_40_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\VIP_80_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\spike_rate_40_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\excit_PV_85_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_SST_40_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\interneurons_40_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_10_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\Pyr_80_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\Pyr_40_FFT_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\neurons_40_FFT_new

labels = ["frequencies","control","PV_80","SST_80","PV_SST_80","interneurons_80","neurons_80",...
    "spike-rate_80","PV_70","PV_60","PV_40","PV_20","SST_100","SST_60","SST_40","VIP_80",...
    "spike-rate_40","excit_PV_85","PV_SST_40","interneurons_40","PV_10","Pyr_80","Pyr_40","neurons_40"];
data_FFT = table(control_FFT.freq', control_FFT.powspctrm', PV_80_FFT.powspctrm', ...
    SST_80_FFT.powspctrm', PV_SST_80_FFT.powspctrm', interneurons_80_FFT.powspctrm',neurons_80_FFT.powspctrm', spike_rate_80_FFT.powspctrm', ...
    PV_70_FFT.powspctrm',PV_60_FFT.powspctrm', PV_40_FFT.powspctrm', PV_20_FFT.powspctrm',SST_100_FFT.powspctrm', ...
    SST_60_FFT.powspctrm',SST_40_FFT.powspctrm',VIP_80_FFT.powspctrm', spike_rate_40_FFT.powspctrm', excit_PV_85_FFT.powspctrm',...
    PV_SST_40_FFT.powspctrm', interneurons_40_FFT.powspctrm',PV_10_FFT.powspctrm',Pyr_80_FFT.powspctrm',Pyr_40_FFT.powspctrm', ...
    neurons_40_FFT.powspctrm','VariableNames',labels);

writetable(data_FFT, 'D:\PROJECTS\KETAMINE-RS\GRANDAVG/new/spectrum_FFT_simulations_hanning_new.csv')

clear all

%% FFT spectrum simulations: standard error hanning

load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\control_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_80_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\SST_80_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_SST_80_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\interneurons_80_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\neurons_80_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\spike_rate_80_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_70_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_60_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_40_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_20_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\SST_100_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\SST_60_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\SST_40_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\VIP_80_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\spike_rate_40_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\excit_PV_85_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_SST_40_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\interneurons_40_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\PV_10_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\Pyr_80_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\Pyr_40_FFT_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\hanning\neurons_40_FFT_trials_new


control_se = squeeze(std(control_FFT_trials.powspctrm)/sqrt(size(control_FFT_trials.powspctrm,1)));
PV_80_se = squeeze(std(PV_80_FFT_trials.powspctrm)/sqrt(size(PV_80_FFT_trials.powspctrm,1)));
SST_80_se = squeeze(std(SST_80_FFT_trials.powspctrm)/sqrt(size(SST_80_FFT_trials.powspctrm,1)));
PV_SST_80_se = squeeze(std(PV_SST_80_FFT_trials.powspctrm)/sqrt(size(PV_SST_80_FFT_trials.powspctrm,1)));
interneurons_80_se = squeeze(std(interneurons_80_FFT_trials.powspctrm)/sqrt(size(interneurons_80_FFT_trials.powspctrm,1)));
neurons_80_se = squeeze(std(neurons_80_FFT_trials.powspctrm)/sqrt(size(neurons_80_FFT_trials.powspctrm,1)));
spike_rate_80_se = squeeze(std(spike_rate_80_FFT_trials.powspctrm)/sqrt(size(spike_rate_80_FFT_trials.powspctrm,1)));
PV_70_se = squeeze(std(PV_70_FFT_trials.powspctrm)/sqrt(size(PV_70_FFT_trials.powspctrm,1)));
PV_60_se = squeeze(std(PV_60_FFT_trials.powspctrm)/sqrt(size(PV_60_FFT_trials.powspctrm,1)));
PV_40_se = squeeze(std(PV_40_FFT_trials.powspctrm)/sqrt(size(PV_40_FFT_trials.powspctrm,1)));
PV_20_se = squeeze(std(PV_20_FFT_trials.powspctrm)/sqrt(size(PV_20_FFT_trials.powspctrm,1)));
SST_100_se = squeeze(std(SST_100_FFT_trials.powspctrm)/sqrt(size(SST_100_FFT_trials.powspctrm,1)));
SST_60_se = squeeze(std(SST_60_FFT_trials.powspctrm)/sqrt(size(SST_60_FFT_trials.powspctrm,1)));
SST_40_se = squeeze(std(SST_40_FFT_trials.powspctrm)/sqrt(size(SST_40_FFT_trials.powspctrm,1)));
VIP_80_se = squeeze(std(VIP_80_FFT_trials.powspctrm)/sqrt(size(VIP_80_FFT_trials.powspctrm,1)));
spike_rate_40_se = squeeze(std(spike_rate_40_FFT_trials.powspctrm)/sqrt(size(spike_rate_40_FFT_trials.powspctrm,1)));
excit_PV_85_se = squeeze(std(excit_PV_85_FFT_trials.powspctrm)/sqrt(size(excit_PV_85_FFT_trials.powspctrm,1)));
PV_SST_40_se = squeeze(std(PV_SST_40_FFT_trials.powspctrm)/sqrt(size(PV_SST_40_FFT_trials.powspctrm,1)));
interneurons_40_se = squeeze(std(interneurons_40_FFT_trials.powspctrm)/sqrt(size(interneurons_40_FFT_trials.powspctrm,1)));
PV_10_se = squeeze(std(PV_10_FFT_trials.powspctrm)/sqrt(size(PV_10_FFT_trials.powspctrm,1)));
Pyr_80_se = squeeze(std(Pyr_80_FFT_trials.powspctrm)/sqrt(size(Pyr_80_FFT_trials.powspctrm,1)));
Pyr_40_se = squeeze(std(Pyr_40_FFT_trials.powspctrm)/sqrt(size(Pyr_40_FFT_trials.powspctrm,1)));
neurons_40_se = squeeze(std(neurons_40_FFT_trials.powspctrm)/sqrt(size(neurons_40_FFT_trials.powspctrm,1)));


labels = ["frequencies","control","PV_80","SST_80","PV_SST_80","interneurons_80","neurons_80",...
    "spike-rate_80","PV_70","PV_60","PV_40","PV_20","SST_100","SST_60","SST_40","VIP_80",...
    "spike-rate_40","excit_PV_85","PV_SST_40","interneurons_40","PV_10","Pyr_80","Pyr_40","neurons_40"];
data_FFT = table(control_FFT_trials.freq', control_se, PV_80_se, ...
    SST_80_se, PV_SST_80_se, interneurons_80_se, neurons_80_se, spike_rate_80_se, ...
    PV_70_se,PV_60_se, PV_40_se, PV_20_se,SST_100_se, SST_60_se,SST_40_se,VIP_80_se,spike_rate_40_se,...
    excit_PV_85_se,PV_SST_40_se, interneurons_40_se, PV_10_se, Pyr_80_se,Pyr_40_se,neurons_40_se,'VariableNames',labels);

writetable(data_FFT, 'D:\PROJECTS\KETAMINE-RS\GRANDAVG/new/spectrum_FFT_se_simulations_hanning_new.csv')

clear


%%% SLOPE

% spectra frac

load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\control_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_80_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\SST_80_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_SST_80_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\interneurons_80_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\neurons_80_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\spike_rate_80_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_70_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_60_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_40_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_20_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\SST_100_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\SST_60_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\SST_40_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\VIP_80_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\spike_rate_40_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\excit_PV_85_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_SST_40_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\interneurons_40_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_10_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\Pyr_80_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\Pyr_40_IRASA_frac_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\neurons_40_IRASA_frac_new

% select frequency data
cfg                 = [];
cfg.channel         = 'all'; 
cfg.avgoverchan     = 'no';
cfg.frequency       = [7 80];
cfg.avgoverfreq     = 'no';
control_frac    = ft_selectdata(cfg, control_frac);
PV_80_frac    = ft_selectdata(cfg, PV_80_frac);
SST_80_frac    = ft_selectdata(cfg, SST_80_frac);
PV_SST_80_frac    = ft_selectdata(cfg, PV_SST_80_frac);
interneurons_80_frac    = ft_selectdata(cfg, interneurons_80_frac);
neurons_80_frac    = ft_selectdata(cfg, neurons_80_frac);
spike_rate_80_frac    = ft_selectdata(cfg, spike_rate_80_frac);
PV_70_frac    = ft_selectdata(cfg, PV_70_frac);
PV_60_frac    = ft_selectdata(cfg, PV_60_frac);
PV_40_frac    = ft_selectdata(cfg, PV_40_frac);
PV_20_frac    = ft_selectdata(cfg, PV_20_frac);
SST_100_frac    = ft_selectdata(cfg, SST_100_frac);
SST_60_frac    = ft_selectdata(cfg, SST_60_frac);
SST_40_frac    = ft_selectdata(cfg, SST_40_frac);
VIP_80_frac    = ft_selectdata(cfg, VIP_80_frac);
spike_rate_40_frac    = ft_selectdata(cfg, spike_rate_40_frac);
excit_PV_85_frac    = ft_selectdata(cfg, excit_PV_85_frac);
PV_SST_40_frac    = ft_selectdata(cfg, PV_SST_40_frac);
interneurons_40_frac    = ft_selectdata(cfg, interneurons_40_frac);
PV_10_frac    = ft_selectdata(cfg, PV_10_frac);
Pyr_80_frac    = ft_selectdata(cfg, Pyr_80_frac);
Pyr_40_frac    = ft_selectdata(cfg, Pyr_40_frac);
neurons_40_frac    = ft_selectdata(cfg, neurons_40_frac);

labels = ["frequencies","control","PV_80","SST_80","PV_SST_80","interneurons_80","neurons_80",...
          "spike-rate_80","PV_70","PV_60","PV_40","PV_20","SST_100","SST_60","SST_40","VIP_80",...
          "spike-rate_40","excit_PV_85","PV_SST_40","interneurons_40","PV_10","Pyr_80","Pyr_40",...
          "neurons_40"];
data_frac = table(control_frac.freq', control_frac.powspctrm', PV_80_frac.powspctrm', ...
    SST_80_frac.powspctrm', PV_SST_80_frac.powspctrm', interneurons_80_frac.powspctrm', ...
    neurons_80_frac.powspctrm', spike_rate_80_frac.powspctrm',PV_70_frac.powspctrm', ...
    PV_60_frac.powspctrm', PV_40_frac.powspctrm', PV_20_frac.powspctrm',SST_100_frac.powspctrm', ...
    SST_60_frac.powspctrm',SST_40_frac.powspctrm',VIP_80_frac.powspctrm', spike_rate_40_frac.powspctrm',...
    excit_PV_85_frac.powspctrm', PV_SST_40_frac.powspctrm',interneurons_40_frac.powspctrm', ...
    PV_10_frac.powspctrm',Pyr_80_frac.powspctrm',Pyr_40_frac.powspctrm',neurons_40_frac.powspctrm', ...
    'VariableNames',labels);

writetable(data_frac, 'D:\PROJECTS\KETAMINE-RS\GRANDAVG/new/spectrum_frac_simulations_new.csv')

clear all

% spectra frac: standard error

load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\control_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\SST_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_SST_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\interneurons_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\neurons_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\spike_rate_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_70_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_60_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_40_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_20_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\SST_100_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\SST_60_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\SST_40_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\VIP_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\spike_rate_40_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\excit_PV_85_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\interneurons_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_SST_40_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\interneurons_40_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\PV_10_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\Pyr_80_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\Pyr_40_IRASA_frac_trials_new
load D:\PROJECTS\KETAMINE-RS\SIMULATIONS\processed_data\neurons_40_IRASA_frac_trials_new


% select frequency data
cfg                 = [];
cfg.channel         = 'all'; 
cfg.avgoverchan     = 'no';
cfg.frequency       = [7 80];
cfg.avgoverfreq     = 'no';
control_frac_trials    = ft_selectdata(cfg, control_frac_trials);
PV_80_frac_trials      = ft_selectdata(cfg, PV_80_frac_trials);
SST_80_frac_trials     = ft_selectdata(cfg, SST_80_frac_trials);
PV_SST_80_frac_trials    = ft_selectdata(cfg, PV_SST_80_frac_trials);
interneurons_80_frac_trials    = ft_selectdata(cfg, interneurons_80_frac_trials);
neurons_80_frac_trials    = ft_selectdata(cfg, neurons_80_frac_trials);
spike_rate_80_frac_trials    = ft_selectdata(cfg, spike_rate_80_frac_trials);
PV_70_frac_trials    = ft_selectdata(cfg, PV_70_frac_trials);
PV_60_frac_trials    = ft_selectdata(cfg, PV_60_frac_trials);
PV_40_frac_trials    = ft_selectdata(cfg, PV_40_frac_trials);
PV_20_frac_trials    = ft_selectdata(cfg, PV_20_frac_trials);
SST_100_frac_trials    = ft_selectdata(cfg, SST_100_frac_trials);
SST_60_frac_trials    = ft_selectdata(cfg, SST_60_frac_trials);
SST_40_frac_trials    = ft_selectdata(cfg, SST_40_frac_trials);
VIP_80_frac_trials    = ft_selectdata(cfg, VIP_80_frac_trials);
spike_rate_40_frac_trials    = ft_selectdata(cfg, spike_rate_40_frac_trials);
excit_PV_85_frac_trials    = ft_selectdata(cfg, excit_PV_85_frac_trials);
PV_SST_40_frac_trials    = ft_selectdata(cfg, PV_SST_40_frac_trials);
interneurons_40_frac_trials    = ft_selectdata(cfg, interneurons_40_frac_trials);
PV_10_frac_trials      = ft_selectdata(cfg, PV_10_frac_trials);
Pyr_80_frac_trials      = ft_selectdata(cfg, Pyr_80_frac_trials);
Pyr_40_frac_trials      = ft_selectdata(cfg, Pyr_40_frac_trials);
neurons_40_frac_trials      = ft_selectdata(cfg, neurons_40_frac_trials);

control_se = squeeze(std(control_frac_trials.powspctrm)/sqrt(size(control_frac_trials.powspctrm,1)));
PV_80_se = squeeze(std(PV_80_frac_trials.powspctrm)/sqrt(size(PV_80_frac_trials.powspctrm,1)));
SST_80_se = squeeze(std(SST_80_frac_trials.powspctrm)/sqrt(size(SST_80_frac_trials.powspctrm,1)));
PV_SST_80_se = squeeze(std(PV_SST_80_frac_trials.powspctrm)/sqrt(size(PV_SST_80_frac_trials.powspctrm,1)));
interneurons_80_se = squeeze(std(interneurons_80_frac_trials.powspctrm)/sqrt(size(interneurons_80_frac_trials.powspctrm,1)));
neurons_80_se = squeeze(std(neurons_80_frac_trials.powspctrm)/sqrt(size(neurons_80_frac_trials.powspctrm,1)));
spike_rate_80_se = squeeze(std(spike_rate_80_frac_trials.powspctrm)/sqrt(size(spike_rate_80_frac_trials.powspctrm,1)));
PV_70_se = squeeze(std(PV_70_frac_trials.powspctrm)/sqrt(size(PV_70_frac_trials.powspctrm,1)));
PV_60_se = squeeze(std(PV_60_frac_trials.powspctrm)/sqrt(size(PV_60_frac_trials.powspctrm,1)));
PV_40_se = squeeze(std(PV_40_frac_trials.powspctrm)/sqrt(size(PV_40_frac_trials.powspctrm,1)));
PV_20_se = squeeze(std(PV_20_frac_trials.powspctrm)/sqrt(size(PV_20_frac_trials.powspctrm,1)));
SST_100_se = squeeze(std(SST_100_frac_trials.powspctrm)/sqrt(size(SST_100_frac_trials.powspctrm,1)));
SST_60_se = squeeze(std(SST_60_frac_trials.powspctrm)/sqrt(size(SST_60_frac_trials.powspctrm,1)));
SST_40_se = squeeze(std(SST_40_frac_trials.powspctrm)/sqrt(size(SST_40_frac_trials.powspctrm,1)));
VIP_80_se = squeeze(std(VIP_80_frac_trials.powspctrm)/sqrt(size(VIP_80_frac_trials.powspctrm,1)));
spike_rate_40_se = squeeze(std(spike_rate_40_frac_trials.powspctrm)/sqrt(size(spike_rate_40_frac_trials.powspctrm,1)));
excit_PV_85_se = squeeze(std(excit_PV_85_frac_trials.powspctrm)/sqrt(size(excit_PV_85_frac_trials.powspctrm,1)));
PV_SST_40_se = squeeze(std(PV_SST_40_frac_trials.powspctrm)/sqrt(size(PV_SST_40_frac_trials.powspctrm,1)));
interneurons_40_se = squeeze(std(interneurons_40_frac_trials.powspctrm)/sqrt(size(interneurons_40_frac_trials.powspctrm,1)));
PV_10_se = squeeze(std(PV_10_frac_trials.powspctrm)/sqrt(size(PV_10_frac_trials.powspctrm,1)));
Pyr_80_se = squeeze(std(Pyr_80_frac_trials.powspctrm)/sqrt(size(Pyr_80_frac_trials.powspctrm,1)));
Pyr_40_se = squeeze(std(Pyr_40_frac_trials.powspctrm)/sqrt(size(Pyr_40_frac_trials.powspctrm,1)));
neurons_40_se = squeeze(std(neurons_40_frac_trials.powspctrm)/sqrt(size(neurons_40_frac_trials.powspctrm,1)));

labels = ["frequencies","control","PV_80","SST_80","PV_SST_80","interneurons_80","neurons_80","spike-rate_80","PV_70",...
    "PV_60","PV_40","PV_20","SST_100","SST_60","SST_40","VIP_80","spike-rate_40","excit_PV_85","PV_SST_40","interneurons_40",...
    "PV_10","Pyr_80","Pyr_40","neurons_40"];
data_frac = table(control_frac_trials.freq', control_se, PV_80_se, ...
    SST_80_se, PV_SST_80_se, interneurons_80_se, neurons_80_se, spike_rate_80_se, ...
    PV_70_se,PV_60_se, PV_40_se, PV_20_se,SST_100_se, SST_60_se,SST_40_se,VIP_80_se,...
    spike_rate_40_se, excit_PV_85_se, PV_SST_40_se, interneurons_40_se,PV_10_se,...
    Pyr_80_se, Pyr_40_se, neurons_40_se,'VariableNames',labels);

writetable(data_frac, 'D:\PROJECTS\KETAMINE-RS\GRANDAVG/new/spectrum_frac_se_simulations_new.csv')

