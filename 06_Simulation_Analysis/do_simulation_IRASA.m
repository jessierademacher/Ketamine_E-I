% function do_simulation_IRASA(Subjectm)
clear
%% EO
%% IRASA-PLApre: orig, frac, and osci
%startup_generic;

folder = 'D:/PROJECTS/KETAMINE-RS/SIMULATIONS/';
condition = 'PV_SST_40';

eval(['load ' folder 'processed_data/' condition '_preprocessed']);

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 4;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
PV_SST_40_frac     = ft_freqanalysis(cfg, data_preproc);
cfg.output      = 'original';
PV_SST_40_orig     = ft_freqanalysis(cfg, data_preproc);

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
PV_SST_40_osci     = ft_math(cfg, PV_SST_40_frac, PV_SST_40_orig);

%% keep trials
% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 4;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
cfg.keeptrials  = 'yes';
PV_SST_40_frac_trials     = ft_freqanalysis(cfg, data_preproc);
cfg.output      = 'original';
PV_SST_40_orig_trials     = ft_freqanalysis(cfg, data_preproc);

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
PV_SST_40_osci_trials     = ft_math(cfg, PV_SST_40_frac_trials, PV_SST_40_orig_trials);

% save IRASA data
save([folder 'processed_data/' condition '_IRASA_frac_new'], 'PV_SST_40_frac', '-V7.3')
save([folder 'processed_data/' condition '_IRASA_osci_new'], 'PV_SST_40_osci', '-V7.3')
save([folder 'processed_data/' condition '_IRASA_orig_new'], 'PV_SST_40_orig', '-V7.3')
save([folder 'processed_data/' condition '_IRASA_frac_trials_new'], 'PV_SST_40_frac_trials', '-V7.3')
save([folder 'processed_data/' condition '_IRASA_osci_trials_new'], 'PV_SST_40_osci_trials', '-V7.3')
save([folder 'processed_data/' condition '_IRASA_orig_trials_new'], 'PV_SST_40_orig_trials', '-V7.3')

clear




