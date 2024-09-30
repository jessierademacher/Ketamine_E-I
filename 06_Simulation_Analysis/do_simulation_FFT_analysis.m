clear

folder = 'D:/PROJECTS/KETAMINE-RS/SIMULATIONS/';
condition = 'PV_SST_40';

eval(['load ' folder 'processed_data/' condition '_preprocessed']);


% FFT analyses
cfg             = [];
cfg.output      = 'pow';
cfg.method      = 'mtmfft'; 
%cfg.taper       = 'hanning';
%cfg.tapsmofrq   = 1;
cfg.taper       = 'dpss'; 
cfg.tapsmofrq   = 3;
cfg.foi         = 3:1:90;
cfg.pad         = 2;

PV_SST_40_FFT      = ft_freqanalysis(cfg, data_preproc);

% keep trials
cfg             = [];
cfg.output      = 'pow';
cfg.method      = 'mtmfft';  
%cfg.taper       = 'hanning';
%cfg.tapsmofrq   = 1;
cfg.taper       = 'dpss'; 
cfg.tapsmofrq   = 3;
cfg.foi         = 3:1:90;
cfg.pad         = 2;
cfg.keeptrials  = 'yes';
PV_SST_40_FFT_trials      = ft_freqanalysis(cfg, data_preproc);


% save FFT data
save([folder 'processed_data/' condition '_FFT_new'], 'PV_SST_40_FFT', '-V7.3')
save([folder 'processed_data/' condition '_FFT_trials_new'], 'PV_SST_40_FFT_trials', '-V7.3')
clear

%% hanning tapered


folder = 'D:/PROJECTS/KETAMINE-RS/SIMULATIONS/';
condition = 'PV_SST_40';

eval(['load ' folder 'processed_data/' condition '_preprocessed_nofilter']);


% FFT analyses
cfg             = [];
cfg.output      = 'pow';
cfg.method      = 'mtmfft'; 
cfg.taper       = 'hanning';
cfg.tapsmofrq   = 1;
cfg.foi         = 1:1:90;
cfg.pad         = 2;

PV_SST_40_FFT      = ft_freqanalysis(cfg, data);

% keep trials
cfg             = [];
cfg.output      = 'pow';
cfg.method      = 'mtmfft';  
cfg.taper       = 'hanning';
cfg.tapsmofrq   = 1;
cfg.foi         = 1:1:90;
cfg.pad         = 2;
cfg.keeptrials  = 'yes';
PV_SST_40_FFT_trials      = ft_freqanalysis(cfg, data);


% save FFT data
save([folder 'processed_data/hanning/' condition '_FFT_new'], 'PV_SST_40_FFT', '-V7.3')
save([folder 'processed_data/hanning/' condition '_FFT_trials_new'], 'PV_SST_40_FFT_trials', '-V7.3')
clear

