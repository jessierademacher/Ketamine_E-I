clear

folder = 'E:/PROJECTS/KETAMINE-RS/SIMULATIONS/';
load([folder 'processed_data/control_IRASA_estimates_trials'])
load([folder 'processed_data/SST_60_IRASA_estimates_trials'])
load([folder 'processed_data/PV_60_IRASA_estimates_trials'])
load([folder 'processed_data/PV_40_IRASA_estimates_trials'])
load([folder 'processed_data/PV_20_IRASA_estimates_trials'])
load([folder 'processed_data/PV_10_IRASA_estimates_trials'])
load([folder 'processed_data/SST_100_IRASA_estimates_trials'])
load([folder 'processed_data/SST_80_IRASA_estimates_trials'])
load([folder 'processed_data/SST_60_IRASA_estimates_trials'])
load([folder 'processed_data/SST_40_IRASA_estimates_trials'])
load([folder 'processed_data/PV_SST_40_IRASA_estimates_trials'])
load([folder 'processed_data/interneurons_40_IRASA_estimates_trials'])
load([folder 'processed_data/neurons_40_IRASA_estimates_trials'])
load([folder 'processed_data/spike_rate_40_IRASA_estimates_trials'])
load([folder 'processed_data/VIP_80_IRASA_estimates_trials'])
load([folder 'processed_data/Pyr_80_IRASA_estimates_trials'])
load([folder 'processed_data/Pyr_40_IRASA_estimates_trials'])


[h,p_PV_10,ci,stats_PV_10] = ttest2(data_control_trials.powspctrm(:,1,2),data_PV_10_trials.powspctrm(:,1,2),'Tail','right')
[h,p_PV_20,ci,stats_PV_20] = ttest2(data_control_trials.powspctrm(:,1,2),data_PV_20_trials.powspctrm(:,1,2),'Tail','right')
[h,p_PV_40,ci,stats_PV_40] = ttest2(data_control_trials.powspctrm(:,1,2),data_PV_40_trials.powspctrm(:,1,2),'Tail','right')
[h,p_PV_60,ci,stats_PV_60] = ttest2(data_control_trials.powspctrm(:,1,2),data_PV_60_trials.powspctrm(:,1,2),'Tail','right')
[h,p_SST_40,ci,stats_SST_40] = ttest2(data_control_trials.powspctrm(:,1,2),data_SST_40_trials.powspctrm(:,1,2),'Tail','right')
[h,p_SST_60,ci,stats_SST_60] = ttest2(data_control_trials.powspctrm(:,1,2),data_SST_60_trials.powspctrm(:,1,2),'Tail','right')
[h,p_SST_80,ci,stats_SST_80] = ttest2(data_control_trials.powspctrm(:,1,2),data_SST_80_trials.powspctrm(:,1,2),'Tail','right')
[h,p_SST_100,ci,stats_SST_100] = ttest2(data_control_trials.powspctrm(:,1,2),data_SST_100_trials.powspctrm(:,1,2),'Tail','right')
[h,p_PV_SST_40,ci,stats_PV_SST_40] = ttest2(data_control_trials.powspctrm(:,1,2),data_PV_SST_40_trials.powspctrm(:,1,2),'Tail','right')
[h,p_interneurons_40,ci,stats_interneurons_40] = ttest2(data_control_trials.powspctrm(:,1,2),data_interneurons_40_trials.powspctrm(:,1,2),'Tail','right')
[h,p_neurons_40,ci,stats_neurons_40] = ttest2(data_control_trials.powspctrm(:,1,2),data_neurons_40_trials.powspctrm(:,1,2),'Tail','right')
[h,p_spike_rate_40,ci,stats_spike_rate_40] = ttest2(data_control_trials.powspctrm(:,1,2),data_spike_rate_40_trials.powspctrm(:,1,2),"Tail","right");
[h,p_VIP_80,ci,stats_VIP_80] = ttest2(data_control_trials.powspctrm(:,1,2),data_VIP_80_trials.powspctrm(:,1,2),'Tail','right')
[h,p_Pyr_80,ci,stats_Pyr_80] = ttest2(data_control_trials.powspctrm(:,1,2),data_Pyr_80_trials.powspctrm(:,1,2),'Tail','right')
[h,p_Pyr_40,ci,stats_Pyr_40] = ttest2(data_control_trials.powspctrm(:,1,2),data_Pyr_40_trials.powspctrm(:,1,2),'Tail','right')


