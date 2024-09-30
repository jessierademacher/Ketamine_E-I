clear 

folder = 'D:/PROJECTS/KETAMINE-RS/SIMULATIONS/';

load([folder 'processed_data/control_FFT_trials_new'])
load([folder 'processed_data/SST_60_FFT_trials_new'])
load([folder 'processed_data/PV_60_FFT_trials_new'])
load([folder 'processed_data/PV_40_FFT_trials_new'])
load([folder 'processed_data/PV_20_FFT_trials_new'])
load([folder 'processed_data/PV_10_FFT_trials_new'])
load([folder 'processed_data/SST_100_FFT_trials_new'])
load([folder 'processed_data/SST_80_FFT_trials_new'])
load([folder 'processed_data/SST_60_FFT_trials_new'])
load([folder 'processed_data/SST_40_FFT_trials_new'])
load([folder 'processed_data/PV_SST_40_FFT_trials_new'])
load([folder 'processed_data/interneurons_40_FFT_trials_new'])
load([folder 'processed_data/neurons_40_FFT_trials_new'])
load([folder 'processed_data/spike_rate_40_FFT_trials_new'])
load([folder 'processed_data/VIP_80_FFT_trials_new'])
load([folder 'processed_data/Pyr_80_FFT_trials_new'])
load([folder 'processed_data/Pyr_40_FFT_trials_new'])

cfg                             = [];
cfg.frequency                   = [30 90];
cfg.avgoverfreq                 = 'yes';
control_FFT_value               = ft_selectdata(cfg, control_FFT_trials);
control_FFT_value.label         = {'ROI'};
PV_60_FFT_value                    = ft_selectdata(cfg, PV_60_FFT_trials);
PV_60_FFT_value.label              = {'ROI'};
PV_40_FFT_value                    = ft_selectdata(cfg, PV_40_FFT_trials);
PV_40_FFT_value.label              = {'ROI'};
PV_20_FFT_value                    = ft_selectdata(cfg, PV_20_FFT_trials);
PV_20_FFT_value.label              = {'ROI'};
PV_10_FFT_value                    = ft_selectdata(cfg, PV_10_FFT_trials);
PV_10_FFT_value.label              = {'ROI'};

SST_100_FFT_value                   = ft_selectdata(cfg, SST_100_FFT_trials);
SST_100_FFT_value.label             = {'ROI'};
SST_80_FFT_value                   = ft_selectdata(cfg, SST_80_FFT_trials);
SST_80_FFT_value.label             = {'ROI'};
SST_60_FFT_value                   = ft_selectdata(cfg, SST_60_FFT_trials);
SST_60_FFT_value.label             = {'ROI'};
SST_40_FFT_value                   = ft_selectdata(cfg, SST_40_FFT_trials);
SST_40_FFT_value.label             = {'ROI'};

PV_SST_40_FFT_value                = ft_selectdata(cfg, PV_SST_40_FFT_trials);
PV_SST_40_FFT_value.label          = {'ROI'};
interneurons_40_FFT_value          = ft_selectdata(cfg, interneurons_40_FFT_trials);
interneurons_40_FFT_value.label    = {'ROI'};
neurons_40_FFT_value               = ft_selectdata(cfg, neurons_40_FFT_trials);
neurons_40_FFT_value.label         = {'ROI'};
spike_rate_40_FFT_value            = ft_selectdata(cfg, spike_rate_40_FFT_trials);
spike_rate_40_FFT_value.label      = {'ROI'};

VIP_80_FFT_value                   = ft_selectdata(cfg, VIP_80_FFT_trials);
VIP_80_FFT_value.label             = {'ROI'};
Pyr_80_FFT_value                   = ft_selectdata(cfg, Pyr_80_FFT_trials);
Pyr_80_FFT_value.label             = {'ROI'};
Pyr_40_FFT_value                   = ft_selectdata(cfg, Pyr_40_FFT_trials);
Pyr_40_FFT_value.label             = {'ROI'};


[h,p_PV_10,ci,stats_PV_10] = ttest2(control_FFT_value.powspctrm,PV_10_FFT_value.powspctrm,'Tail','left')
[h,p_PV_20,ci,stats_PV_20] = ttest2(control_FFT_value.powspctrm,PV_20_FFT_value.powspctrm,'Tail','left')
[h,p_PV_40,ci,stats_PV_40] = ttest2(control_FFT_value.powspctrm,PV_40_FFT_value.powspctrm,'Tail','left')
[h,p_PV_60,ci,stats_PV_60] = ttest2(control_FFT_value.powspctrm,PV_60_FFT_value.powspctrm,'Tail','left')
[h,p_SST_40,ci,stats_SST_40] = ttest2(control_FFT_value.powspctrm,SST_40_FFT_value.powspctrm,'Tail','left')
[h,p_SST_60,ci,stats_SST_60] = ttest2(control_FFT_value.powspctrm,SST_60_FFT_value.powspctrm,'Tail','left')
[h,p_SST_80,ci,stats_SST_80] = ttest2(control_FFT_value.powspctrm,SST_80_FFT_value.powspctrm,'Tail','left')
[h,p_SST_100,ci,stats_SST_100] = ttest2(control_FFT_value.powspctrm,SST_100_FFT_value.powspctrm,'Tail','left')
[h,p_PV_SST_40,ci,stats_PV_SST_40] = ttest2(control_FFT_value.powspctrm,PV_SST_40_FFT_value.powspctrm,'Tail','left')
[h,p_interneurons_40,ci,stats_interneurons_40] = ttest2(control_FFT_value.powspctrm,interneurons_40_FFT_value.powspctrm,'Tail','left')
[h,p_neurons_40,ci,stats_neurons_40] = ttest2(control_FFT_value.powspctrm,neurons_40_FFT_value.powspctrm,'Tail','left')
[h,p_spike_rate_40,ci,stats_spike_rate_40] = ttest2(control_FFT_value.powspctrm,spike_rate_40_FFT_value.powspctrm,"Tail","left");
[h,p_VIP_80,ci,stats_VIP_80] = ttest2(control_FFT_value.powspctrm,VIP_80_FFT_value.powspctrm,'Tail','left')
[h,p_Pyr_80,ci,stats_Pyr_80] = ttest2(control_FFT_value.powspctrm,Pyr_80_FFT_value.powspctrm,'Tail','left')
[h,p_Pyr_40,ci,stats_Pyr_40] = ttest2(control_FFT_value.powspctrm,Pyr_40_FFT_value.powspctrm,'Tail','left')

mean(control_FFT_value.powspctrm)
std(control_FFT_value.powspctrm)
mean(PV_10_FFT_value.powspctrm)
std(PV_10_FFT_value.powspctrm)


addpath 'C:\Users\OEM\AppData\Roaming\MathWorks\MATLAB Add-Ons\Functions\fdr_bh';
FDR = fdr_bh([p_PV_10,p_PV_20,p_PV_40,p_PV_60,p_SST_40,p_SST_60,p_SST_80,p_SST_100,p_PV_SST_40,p_interneurons_40, ...
    p_neurons_40,p_spike_rate_40,p_VIP_80,p_Pyr_80,p_Pyr_40])
