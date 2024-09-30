clear

% indicate frequency range
range = [7 80]; % [7 80] [3 90]

    
folder = 'D:/PROJECTS/KETAMINE-RS/SIMULATIONS/';

% IRASA aperiodic data
load([folder 'processed_data/control_IRASA_frac_new'])
load([folder 'processed_data/control_IRASA_frac_trials_new'])

load([folder 'processed_data/PV_SST_40_IRASA_frac_new'])
load([folder 'processed_data/interneurons_40_IRASA_frac_new'])
load([folder 'processed_data/neurons_40_IRASA_frac_new'])
load([folder 'processed_data/spike_rate_40_IRASA_frac_new'])

load([folder 'processed_data/PV_SST_40_IRASA_frac_trials_new'])
load([folder 'processed_data/interneurons_40_IRASA_frac_trials_new'])
load([folder 'processed_data/neurons_40_IRASA_frac_trials_new'])
load([folder 'processed_data/spike_rate_40_IRASA_frac_trials_new'])

load([folder 'processed_data/PV_60_IRASA_frac_new'])
load([folder 'processed_data/PV_40_IRASA_frac_new'])
load([folder 'processed_data/PV_20_IRASA_frac_new'])
load([folder 'processed_data/PV_10_IRASA_frac_new'])

load([folder 'processed_data/PV_60_IRASA_frac_trials_new'])
load([folder 'processed_data/PV_40_IRASA_frac_trials_new'])
load([folder 'processed_data/PV_20_IRASA_frac_trials_new'])
load([folder 'processed_data/PV_10_IRASA_frac_trials_new'])

load([folder 'processed_data/SST_100_IRASA_frac_new'])
load([folder 'processed_data/SST_80_IRASA_frac_new'])
load([folder 'processed_data/SST_60_IRASA_frac_new'])
load([folder 'processed_data/SST_40_IRASA_frac_new'])

load([folder 'processed_data/SST_100_IRASA_frac_trials_new'])
load([folder 'processed_data/SST_80_IRASA_frac_trials_new'])
load([folder 'processed_data/SST_60_IRASA_frac_trials_new'])
load([folder 'processed_data/SST_40_IRASA_frac_trials_new'])

load([folder 'processed_data/VIP_80_IRASA_frac_new'])
load([folder 'processed_data/Pyr_80_IRASA_frac_new'])
load([folder 'processed_data/Pyr_40_IRASA_frac_new'])

load([folder 'processed_data/VIP_80_IRASA_frac_trials_new'])
load([folder 'processed_data/Pyr_80_IRASA_frac_trials_new'])
load([folder 'processed_data/Pyr_40_IRASA_frac_trials_new'])


%%% first create basic structure
cfg                 = [];
cfg.channel         = 'all'; 
cfg.avgoverchan     = 'no';
cfg.frequency       = [30 30.2500]; % placeholders for OFFSET and SLOPE
cfg.avgoverfreq     = 'no';

data_control_trials        = ft_selectdata(cfg, control_frac_trials);
data_control_trials.freq   = [1 2];

data_PV_60_trials        = ft_selectdata(cfg, PV_60_frac_trials);
data_PV_60_trials.freq   = [1 2];
data_PV_40_trials        = ft_selectdata(cfg, PV_40_frac_trials);
data_PV_40_trials.freq   = [1 2];
data_PV_20_trials        = ft_selectdata(cfg, PV_20_frac_trials);
data_PV_20_trials.freq   = [1 2];
data_PV_10_trials        = ft_selectdata(cfg, PV_10_frac_trials);
data_PV_10_trials.freq   = [1 2];

data_SST_100_trials        = ft_selectdata(cfg, SST_100_frac_trials);
data_SST_100_trials.freq   = [1 2];
data_SST_80_trials        = ft_selectdata(cfg, SST_80_frac_trials);
data_SST_80_trials.freq   = [1 2];
data_SST_60_trials        = ft_selectdata(cfg, SST_60_frac_trials);
data_SST_60_trials.freq   = [1 2];
data_SST_40_trials        = ft_selectdata(cfg, SST_40_frac_trials);
data_SST_40_trials.freq   = [1 2];

data_PV_SST_40_trials        = ft_selectdata(cfg, PV_SST_40_frac_trials);
data_PV_SST_40_trials.freq   = [1 2];
data_interneurons_40_trials        = ft_selectdata(cfg, interneurons_40_frac_trials);
data_interneurons_40_trials.freq   = [1 2];
data_neurons_40_trials        = ft_selectdata(cfg, neurons_40_frac_trials);
data_neurons_40_trials.freq   = [1 2];
data_spike_rate_40_trials       = ft_selectdata(cfg, spike_rate_40_frac_trials);
data_spike_rate_40_trials.freq   = [1 2];

data_VIP_80_trials        = ft_selectdata(cfg, VIP_80_frac_trials);
data_VIP_80_trials.freq   = [1 2];
data_Pyr_80_trials        = ft_selectdata(cfg, Pyr_80_frac_trials);
data_Pyr_80_trials.freq   = [1 2];
data_Pyr_40_trials        = ft_selectdata(cfg, Pyr_40_frac_trials);
data_Pyr_40_trials.freq   = [1 2];

% select frequency data
cfg                 = [];
cfg.channel         = 'all'; 
cfg.avgoverchan     = 'no';
cfg.frequency       = range;
cfg.avgoverfreq     = 'no';
data2_control_trials                = ft_selectdata(cfg, control_frac_trials);
data2_PV_10_trials               = ft_selectdata(cfg, PV_10_frac_trials);
data2_PV_20_trials               = ft_selectdata(cfg, PV_20_frac_trials);
data2_PV_40_trials               = ft_selectdata(cfg, PV_40_frac_trials);
data2_PV_60_trials               = ft_selectdata(cfg, PV_60_frac_trials);
data2_SST_40_trials               = ft_selectdata(cfg, SST_40_frac_trials);
data2_SST_60_trials               = ft_selectdata(cfg, SST_60_frac_trials);
data2_SST_80_trials               = ft_selectdata(cfg, SST_80_frac_trials);
data2_SST_100_trials               = ft_selectdata(cfg, SST_100_frac_trials);
data2_PV_SST_40_trials               = ft_selectdata(cfg, PV_SST_40_frac_trials);
data2_interneurons_40_trials               = ft_selectdata(cfg, interneurons_40_frac_trials);
data2_neurons_40_trials               = ft_selectdata(cfg, neurons_40_frac_trials);
data2_spike_rate_40_trials         = ft_selectdata(cfg, spike_rate_40_frac_trials);
data2_VIP_80_trials                = ft_selectdata(cfg, VIP_80_frac_trials);
data2_Pyr_80_trials                = ft_selectdata(cfg, Pyr_80_frac_trials);
data2_Pyr_40_trials                = ft_selectdata(cfg, Pyr_40_frac_trials);


%%% SLOPE and OFFSET values
% fit the data
ft = fittype('b-log10(x^s)','dependent',{'y'},'independent',{'x'},...
             'coefficients',{'b','s'});

for i=1:size(data2_control_trials.powspctrm,1)
temp_control    = fit(data2_control_trials.freq', log10(squeeze(data2_control_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_control_trials.powspctrm(i,1,1) = temp_control.b;
data_control_trials.powspctrm(i,1,2) = temp_control.s;
end

for i=1:size(data2_PV_10_trials.powspctrm,1)
temp_PV_10    = fit(data2_PV_10_trials.freq', log10(squeeze(data2_PV_10_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_PV_10_trials.powspctrm(i,1,1) = temp_PV_10.b;
data_PV_10_trials.powspctrm(i,1,2) = temp_PV_10.s;
end

for i=1:size(data2_PV_20_trials.powspctrm,1)
temp_PV_20    = fit(data2_PV_20_trials.freq', log10(squeeze(data2_PV_20_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_PV_20_trials.powspctrm(i,1,1) = temp_PV_20.b;
data_PV_20_trials.powspctrm(i,1,2) = temp_PV_20.s;
end

for i=1:size(data2_PV_40_trials.powspctrm,1)
temp_PV_40    = fit(data2_PV_40_trials.freq', log10(squeeze(data2_PV_40_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_PV_40_trials.powspctrm(i,1,1) = temp_PV_40.b;
data_PV_40_trials.powspctrm(i,1,2) = temp_PV_40.s;
end

for i=1:size(data2_PV_60_trials.powspctrm,1)
temp_PV_60    = fit(data2_PV_60_trials.freq', log10(squeeze(data2_PV_60_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_PV_60_trials.powspctrm(i,1,1) = temp_PV_60.b;
data_PV_60_trials.powspctrm(i,1,2) = temp_PV_60.s;
end

for i=1:size(data2_SST_100_trials.powspctrm,1)
temp_SST_100    = fit(data2_SST_100_trials.freq', log10(squeeze(data2_SST_100_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_SST_100_trials.powspctrm(i,1,1) = temp_SST_100.b;
data_SST_100_trials.powspctrm(i,1,2) = temp_SST_100.s;
end

for i=1:size(data2_SST_80_trials.powspctrm,1)
temp_SST_80    = fit(data2_SST_80_trials.freq', log10(squeeze(data2_SST_80_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_SST_80_trials.powspctrm(i,1,1) = temp_SST_80.b;
data_SST_80_trials.powspctrm(i,1,2) = temp_SST_80.s;
end

for i=1:size(data2_SST_60_trials.powspctrm,1)
temp_SST_60    = fit(data2_SST_60_trials.freq', log10(squeeze(data2_SST_60_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_SST_60_trials.powspctrm(i,1,1) = temp_SST_60.b;
data_SST_60_trials.powspctrm(i,1,2) = temp_SST_60.s;
end

for i=1:size(data2_SST_40_trials.powspctrm,1)
temp_SST_40    = fit(data2_SST_40_trials.freq', log10(squeeze(data2_SST_40_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_SST_40_trials.powspctrm(i,1,1) = temp_SST_40.b;
data_SST_40_trials.powspctrm(i,1,2) = temp_SST_40.s;
end

for i=1:size(data2_PV_SST_40_trials.powspctrm,1)
temp_PV_SST_40    = fit(data2_PV_SST_40_trials.freq', log10(squeeze(data2_PV_SST_40_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_PV_SST_40_trials.powspctrm(i,1,1) = temp_PV_SST_40.b;
data_PV_SST_40_trials.powspctrm(i,1,2) = temp_PV_SST_40.s;
end

for i=1:size(data2_interneurons_40_trials.powspctrm,1)
temp_interneurons_40   = fit(data2_interneurons_40_trials.freq', log10(squeeze(data2_interneurons_40_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_interneurons_40_trials.powspctrm(i,1,1) = temp_interneurons_40.b;
data_interneurons_40_trials.powspctrm(i,1,2) = temp_interneurons_40.s;
end

for i=1:size(data2_neurons_40_trials.powspctrm,1)
temp_neurons_40   = fit(data2_neurons_40_trials.freq', log10(squeeze(data2_neurons_40_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_neurons_40_trials.powspctrm(i,1,1) = temp_neurons_40.b;
data_neurons_40_trials.powspctrm(i,1,2) = temp_neurons_40.s;
end

for i=1:size(data2_spike_rate_40_trials.powspctrm,1)
temp_spike_rate_40   = fit(data2_spike_rate_40_trials.freq', log10(squeeze(data2_spike_rate_40_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_spike_rate_40_trials.powspctrm(i,1,1) = temp_spike_rate_40.b;
data_spike_rate_40_trials.powspctrm(i,1,2) = temp_spike_rate_40.s;
end

for i=1:size(data2_VIP_80_trials.powspctrm,1)
temp_VIP_80    = fit(data2_VIP_80_trials.freq', log10(squeeze(data2_VIP_80_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_VIP_80_trials.powspctrm(i,1,1) = temp_VIP_80.b;
data_VIP_80_trials.powspctrm(i,1,2) = temp_VIP_80.s;
end

for i=1:size(data2_Pyr_80_trials.powspctrm,1)
temp_Pyr_80    = fit(data2_Pyr_80_trials.freq', log10(squeeze(data2_Pyr_80_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_Pyr_80_trials.powspctrm(i,1,1) = temp_Pyr_80.b;
data_Pyr_80_trials.powspctrm(i,1,2) = temp_Pyr_80.s;
end

for i=1:size(data2_Pyr_40_trials.powspctrm,1)
temp_Pyr_40    = fit(data2_Pyr_40_trials.freq', log10(squeeze(data2_Pyr_40_trials.powspctrm(i,1,:))), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
data_Pyr_40_trials.powspctrm(i,1,1) = temp_Pyr_40.b;
data_Pyr_40_trials.powspctrm(i,1,2) = temp_Pyr_40.s;
end


% save
save([folder 'processed_data/control_IRASA_estimates_trials'], 'data_control_trials', '-V7.3')

save([folder 'processed_data/PV_60_IRASA_estimates_trials'], 'data_PV_60_trials', '-V7.3')
save([folder 'processed_data/PV_40_IRASA_estimates_trials'], 'data_PV_40_trials', '-V7.3')
save([folder 'processed_data/PV_20_IRASA_estimates_trials'], 'data_PV_20_trials', '-V7.3')
save([folder 'processed_data/PV_10_IRASA_estimates_trials'], 'data_PV_10_trials', '-V7.3')
save([folder 'processed_data/SST_100_IRASA_estimates_trials'], 'data_SST_100_trials', '-V7.3')
save([folder 'processed_data/SST_80_IRASA_estimates_trials'], 'data_SST_80_trials', '-V7.3')
save([folder 'processed_data/SST_60_IRASA_estimates_trials'], 'data_SST_60_trials', '-V7.3')
save([folder 'processed_data/SST_40_IRASA_estimates_trials'], 'data_SST_40_trials', '-V7.3')
save([folder 'processed_data/PV_SST_40_IRASA_estimates_trials'], 'data_PV_SST_40_trials', '-V7.3')
save([folder 'processed_data/interneurons_40_IRASA_estimates_trials'], 'data_interneurons_40_trials', '-V7.3')
save([folder 'processed_data/neurons_40_IRASA_estimates_trials'], 'data_neurons_40_trials', '-V7.3')
save([folder 'processed_data/spike_rate_40_IRASA_estimates_trials'], 'data_spike_rate_40_trials', '-V7.3')
save([folder 'processed_data/VIP_80_IRASA_estimates_trials'], 'data_VIP_80_trials', '-V7.3')
save([folder 'processed_data/Pyr_80_IRASA_estimates_trials'], 'data_Pyr_80_trials', '-V7.3')
save([folder 'processed_data/Pyr_40_IRASA_estimates_trials'], 'data_Pyr_40_trials', '-V7.3')


clear