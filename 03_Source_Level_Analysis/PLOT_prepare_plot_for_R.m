clear all

%% gamma absolute FFT

load E:/PROJECTS/KETAMINE-RS\GRANDAVG\GA12_AAL90_EC_PLAdiffsubj_FFT_norm_dft2
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\GA12_AAL90_EC_KETdiffsubj_FFT_norm_dft2 

% averaged over significant regions
excel = readtable('E:/PROJECTS/KETAMINE-RS\BRAINODES\data_gamma_EC_FFT_nodesformat.xlsx','ReadVariableNames', false);
regions = excel{:,6}'
mask = excel{:,4}==1;
ROIs = regions;
ROIs = regions(mask);

% select statistical ROIs 
cfg                 = [];
cfg.channel         = ROIs;
% cfg.channel         = {'LSFGdor','RSFGdor','LMFG','LPreCG','LORBmid','LPAL'};
cfg.avgoverchan     = 'yes';
cfg.frequency       = [30 90];
cfg.avgoverfreq     = 'yes';
PLAdiff_ROI           = ft_selectdata(cfg, GA12_PLAdiffsubj_EC);
PLAdiff_ROI.label     = {'ROI'};
KETdiff_ROI           = ft_selectdata(cfg, GA12_KETdiffsubj_EC);
KETdiff_ROI.label     = {'ROI'};


gamma = [PLAdiff_ROI.powspctrm KETdiff_ROI.powspctrm];

writematrix(gamma, './GRANDAVG/new/gamma_values_PLA_KET_EC.csv');

clear all


%% FFT
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLApre_FFT_norm_dft2
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLApost_FFT_norm_dft2
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETpre_FFT_norm_dft2 
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETpost_FFT_norm_dft2

% averaged over significant regions
excel = readtable('E:/PROJECTS/KETAMINE-RS\BRAINODES\gamma\data_gamma_EC_FFT_nodesformat.xlsx');
regions = excel{:,6}'
mask = excel{:,4}==1;
ROIs = regions;
ROIs = regions(mask);

% select statistical ROIs 
cfg                 = [];
cfg.channel         = ROIs;
%cfg.channel = 'all';
% cfg.channel         = {'LSFGdor','RSFGdor','LMFG','LPreCG','LORBmid','LPAL'};
cfg.avgoverchan     = 'yes';
PLApre_ROI           = ft_selectdata(cfg, GA12_PLApre_EC);
PLApre_ROI.label     = {'ROI'};
PLApost_ROI           = ft_selectdata(cfg, GA12_PLApost_EC);
PLApost_ROI.label     = {'ROI'};
KETpre_ROI           = ft_selectdata(cfg, GA12_KETpre_EC);
KETpre_ROI.label     = {'ROI'};
KETpost_ROI           = ft_selectdata(cfg, GA12_KETpost_EC);
KETpost_ROI.label     = {'ROI'};

labels = ["frequencies","PLApre","PLApost","KETpre","KETpost"];
data_FFT = table(PLApre_ROI.freq', PLApre_ROI.powspctrm', PLApost_ROI.powspctrm', KETpre_ROI.powspctrm', KETpost_ROI.powspctrm', 'VariableNames',labels);

writetable(data_FFT, 'E:/PROJECTS/KETAMINE-RS/GRANDAVG/new/spectrum_FFT_EC_hanning_new.csv')

clear

%% FFT: standard error
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLApresubj_FFT_norm_dft2
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLApostsubj_FFT_norm_dft2
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETpresubj_FFT_norm_dft2 
load E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETpostsubj_FFT_norm_dft2

% averaged over significant regions
excel = readtable('E:/PROJECTS/KETAMINE-RS\BRAINODES\gamma\data_gamma_EC_FFT_nodesformat.xlsx');
regions = excel{:,6}'
mask = excel{:,4}==1;
ROIs = regions;
ROIs = regions(mask);

% select statistical ROIs 
cfg                 = [];
%cfg.channel         = ROIs;
cfg.channel = 'all';
% cfg.channel         = {'LSFGdor','RSFGdor','LMFG','LPreCG','LORBmid','LPAL'};
cfg.avgoverchan     = 'yes';
PLApresubj_ROI           = ft_selectdata(cfg, GA12_PLApresubj_EC);
PLApresubj_ROI.label     = {'ROI'};
PLApostsubj_ROI           = ft_selectdata(cfg, GA12_PLApostsubj_EC);
PLApostsubj_ROI.label     = {'ROI'};
KETpresubj_ROI           = ft_selectdata(cfg, GA12_KETpresubj_EC);
KETpresubj_ROI.label     = {'ROI'};
KETpostsubj_ROI           = ft_selectdata(cfg, GA12_KETpostsubj_EC);
KETpostsubj_ROI.label     = {'ROI'};

PLApre_se = squeeze(std(PLApresubj_ROI.powspctrm)/sqrt(12));
PLApost_se = squeeze(std(PLApostsubj_ROI.powspctrm)/sqrt(12));
KETpre_se = squeeze(std(KETpresubj_ROI.powspctrm)/sqrt(12));
KETpost_se = squeeze(std(KETpostsubj_ROI.powspctrm)/sqrt(12));

labels = ["frequencies","PLApre","PLApost","KETpre","KETpost"];
data_se = table(PLApresubj_ROI.freq', PLApre_se, PLApost_se, KETpre_se, KETpost_se, 'VariableNames',labels);

writetable(data_se, 'E:/PROJECTS/KETAMINE-RS/GRANDAVG/new/spectrum_FFT_se_EC_hanning.csv')


%%% SLOPE

clear all

%%  absolute slope values 
load .\GRANDAVG\new\GA12subj_PLAdiff_AAL90_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12subj_KETdiff_AAL90_frac_fit_EC_7_80

% averaged over significant regions
excel = readtable('.\BRAINODES\slope_log\nodesformat_slope_7_80_EC.xlsx','ReadVariableNames', false);
regions = excel{:,6}';
mask = excel{:,4}==1;
ROIs = regions;
ROIs = regions(mask);

% select statistical ROIs 
cfg                 = [];
cfg.channel         = ROIs;
%cfg.channel         = 'all';
% cfg.channel         = {'LSFGdor','RSFGdor','LMFG','LPreCG','LORBmid','LPAL'};
cfg.avgoverchan     = 'yes';
PLAdiff_ROI           = ft_selectdata(cfg, GA12subj_PLAdiff_AAL90_estimates_EC);
PLAdiff_ROI.label     = {'ROI'};
KETdiff_ROI           = ft_selectdata(cfg, GA12subj_KETdiff_AAL90_estimates_EC);
KETdiff_ROI.label     = {'ROI'};

slope_PLA_subj = squeeze(PLAdiff_ROI.powspctrm(:,:,2));
slope_KET_subj = squeeze(KETdiff_ROI.powspctrm(:,:,2));

slope = [squeeze(PLAdiff_ROI.powspctrm(:,:,2)) squeeze(KETdiff_ROI.powspctrm(:,:,2))];

writematrix(slope, '.\GRANDAVG\new\slope_values_PLA_KET_EC_7_80.csv');

clear all



%% spectra frac

load .\GRANDAVG\GA12_AAL90_IRASA_PLApre_frac_EC_norm_dft2
load .\GRANDAVG\GA12_AAL90_IRASA_PLApost_frac_EC_norm_dft2 
load .\GRANDAVG\GA12_AAL90_IRASA_KETpre_frac_EC_norm_dft2
load .\GRANDAVG\GA12_AAL90_IRASA_KETpost_frac_EC_norm_dft2

% select frequency data (30-70 Hz)
cfg                 = [];
cfg.channel         = 'all'; 
cfg.avgoverchan     = 'no';
cfg.frequency       = [7 80];
%cfg.frequency       = [3 90];
cfg.avgoverfreq     = 'no';
GA12_PLApre_frac_EC    = ft_selectdata(cfg, GA12_PLApre_frac_EC);
GA12_PLApost_frac_EC    = ft_selectdata(cfg, GA12_PLApost_frac_EC);
GA12_KETpre_frac_EC    = ft_selectdata(cfg, GA12_KETpre_frac_EC);
GA12_KETpost_frac_EC    = ft_selectdata(cfg, GA12_KETpost_frac_EC);


% averaged over significant regions
excel = readtable('.\BRAINODES\slope_log\nodesformat_slope_7_80_EC.xlsx','ReadVariableNames', false);
regions = excel{:,6}';
mask = excel{:,4}==1;
ROIs = regions;
ROIs = regions(mask);


% select statistical ROIs 
cfg                 = [];
cfg.channel         = ROIs;
%cfg.channel         = 'all';
% cfg.channel         = {'LSFGdor','RSFGdor','LMFG','LPreCG','LORBmid','LPAL'};
cfg.avgoverchan     = 'yes';
PLApre_frac_ROI           = ft_selectdata(cfg, GA12_PLApre_frac_EC);
PLApre_frac_ROI.label     = {'ROI'};
PLApost_frac_ROI           = ft_selectdata(cfg, GA12_PLApost_frac_EC);
PLApost_frac_ROI.label     = {'ROI'};
KETpre_frac_ROI           = ft_selectdata(cfg, GA12_KETpre_frac_EC);
KETpre_frac_ROI.label     = {'ROI'};
KETpost_frac_ROI           = ft_selectdata(cfg, GA12_KETpost_frac_EC);
KETpost_frac_ROI.label     = {'ROI'};

labels = ["frequencies","PLApre","PLApost","KETpre","KETpost"];
data_frac = table(PLApre_frac_ROI.freq', PLApre_frac_ROI.powspctrm', PLApost_frac_ROI.powspctrm', KETpre_frac_ROI.powspctrm', KETpost_frac_ROI.powspctrm', 'VariableNames',labels);

writetable(data_frac, './GRANDAVG/new/spectrum_frac_EC_7_80.csv')


%% spectra frac: standard error

load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_AAL90_IRASA_PLApresubj_frac_EC_norm_dft2
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_AAL90_IRASA_PLApostsubj_frac_EC_norm_dft2 
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_AAL90_IRASA_KETpresubj_frac_EC_norm_dft2
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_AAL90_IRASA_KETpostsubj_frac_EC_norm_dft2

% select frequency data (30-70 Hz)
cfg                 = [];
cfg.channel         = 'all'; 
cfg.avgoverchan     = 'no';
cfg.frequency       = [7 80];
%cfg.frequency       = [3 90];
cfg.avgoverfreq     = 'no';
GA12_PLApresubj_frac_EC    = ft_selectdata(cfg, GA12_PLApresubj_frac_EC);
GA12_PLApostsubj_frac_EC    = ft_selectdata(cfg, GA12_PLApostsubj_frac_EC);
GA12_KETpresubj_frac_EC    = ft_selectdata(cfg, GA12_KETpresubj_frac_EC);
GA12_KETpostsubj_frac_EC    = ft_selectdata(cfg, GA12_KETpostsubj_frac_EC);


% averaged over significant regions
excel = readtable('E:\PROJECTS\KETAMINE-RS\BRAINODES\slope_log\nodesformat_slope_7_80_EC.xlsx','ReadVariableNames', false);
%excel = readtable('E:\PROJECTS\KETAMINE-RS\BRAINODES\gamma\data_gamma_EC_frac_nodesformat.xlsx','ReadVariableNames', false);
regions = excel{:,6}';
mask = excel{:,4}==1;
ROIs = regions;
ROIs = regions(mask);


% select statistical ROIs 
cfg                 = [];
cfg.channel         = ROIs;
%cfg.channel         = 'all';
% cfg.channel         = {'LSFGdor','RSFGdor','LMFG','LPreCG','LORBmid','LPAL'};
cfg.avgoverchan     = 'yes';
PLApresubj_frac_ROI           = ft_selectdata(cfg, GA12_PLApresubj_frac_EC);
PLApresubj_frac_ROI.label     = {'ROI'};
PLApostsubj_frac_ROI           = ft_selectdata(cfg, GA12_PLApostsubj_frac_EC);
PLApostsubj_frac_ROI.label     = {'ROI'};
KETpresubj_frac_ROI           = ft_selectdata(cfg, GA12_KETpresubj_frac_EC);
KETpresubj_frac_ROI.label     = {'ROI'};
KETpostsubj_frac_ROI           = ft_selectdata(cfg, GA12_KETpostsubj_frac_EC);
KETpostsubj_frac_ROI.label     = {'ROI'};

PLApre_se = squeeze(std(PLApresubj_frac_ROI.powspctrm)/sqrt(12));
PLApost_se = squeeze(std(PLApostsubj_frac_ROI.powspctrm)/sqrt(12));
KETpre_se = squeeze(std(KETpresubj_frac_ROI.powspctrm)/sqrt(12));
KETpost_se = squeeze(std(KETpostsubj_frac_ROI.powspctrm)/sqrt(12));

labels = ["frequencies","PLApre","PLApost","KETpre","KETpost"];
data_se = table(PLApresubj_frac_ROI.freq', PLApre_se, PLApost_se, KETpre_se, KETpost_se, 'VariableNames',labels);

%writetable(data_se, 'E:\PROJECTS\KETAMINE-RS/GRANDAVG/new/spectrum_frac_se_EC_3_90.csv')
writetable(data_se, 'E:\PROJECTS\KETAMINE-RS/GRANDAVG/new/spectrum_frac_se_EC_7_80.csv')




%% values for fit line (for log-space)
% subject 14, region LSFGmed
clear

load('.\VIRTCHAN\IRASA\S14_AAL90_EC_frac_PLApre_norm_dft2')
load('.\VIRTCHAN\IRASA\S14_AAL90_EC_frac_PLApost_norm_dft2')
load('.\VIRTCHAN\IRASA\S14_AAL90_EC_frac_KETpre_norm_dft2')
load('.\VIRTCHAN\IRASA\S14_AAL90_EC_frac_KETpost_norm_dft2')

% select ROI
cfg               = [];
cfg.channel       = 'LSFGmed';
cfg.frequency     = [7 80];
cfg.avgoverfreq   = 'no';
PLApre_frac            = ft_selectdata(cfg, PLApre_EC_frac);
PLApost_frac           = ft_selectdata(cfg, PLApost_EC_frac);
KETpre_frac            = ft_selectdata(cfg, KETpre_EC_frac);
KETpost_frac           = ft_selectdata(cfg, KETpost_EC_frac);

labels = ["frequencies","PLApre","PLApost","KETpre","KETpost"];
data_frac = table(PLApre_frac.freq', PLApre_frac.powspctrm', PLApost_frac.powspctrm', KETpre_frac.powspctrm', KETpost_frac.powspctrm', 'VariableNames',labels);

writetable(data_frac, './GRANDAVG/new/spectrum_frac_EC_7_80_subject14_LSFGmed.csv')


load .\GRANDAVG\new\GA12subj_PLApre_AAL90_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12subj_PLApost_AAL90_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12subj_KETpre_AAL90_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12subj_KETpost_AAL90_frac_fit_EC_7_80

% select ROI
cfg                 = [];
cfg.channel         = 'LSFGmed';
PLApre            = ft_selectdata(cfg, GA12subj_PLApre_AAL90_estimates_EC);
PLApost           = ft_selectdata(cfg, GA12subj_PLApost_AAL90_estimates_EC);
KETpre            = ft_selectdata(cfg, GA12subj_KETpre_AAL90_estimates_EC);
KETpost           = ft_selectdata(cfg, GA12subj_KETpost_AAL90_estimates_EC);


values = [squeeze(PLApre.powspctrm(12,:,:)) squeeze(PLApost.powspctrm(12,:,:)) squeeze(KETpre.powspctrm(12,:,:)) squeeze(KETpost.powspctrm(12,:,:))];

writematrix(values, '.\GRANDAVG\new\fit_values_PLA_KET_EC_7_80_subject14_LSFGmed.csv');

%% values for fit line (for log-space)
% averaged across participants and ROIs
clear

load .\GRANDAVG\new\GA12subj_PLApre_AAL90_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12subj_PLApost_AAL90_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12subj_KETpre_AAL90_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12subj_KETpost_AAL90_frac_fit_EC_7_80

% averaged over significant regions
excel = readtable('.\BRAINODES\slope_log\nodesformat_slope_7_80_EC.xlsx','ReadVariableNames', false);
regions = excel{:,6}';
mask = excel{:,4}==1;
ROIs = regions;
ROIs = regions(mask);


% select statistical ROIs 
cfg                 = [];
cfg.channel         = ROIs;
%cfg.channel         = 'all';
% cfg.channel         = {'LSFGdor','RSFGdor','LMFG','LPreCG','LORBmid','LPAL'};
cfg.avgoverchan     = 'yes';
PLApre            = ft_selectdata(cfg, GA12subj_PLApre_AAL90_estimates_EC);
PLApost           = ft_selectdata(cfg, GA12subj_PLApost_AAL90_estimates_EC);
KETpre            = ft_selectdata(cfg, GA12subj_KETpre_AAL90_estimates_EC);
KETpost           = ft_selectdata(cfg, GA12subj_KETpost_AAL90_estimates_EC);


values = [squeeze(mean(PLApre.powspctrm)) squeeze(mean(PLApost.powspctrm)) squeeze(mean(KETpre.powspctrm)) squeeze(mean(KETpost.powspctrm))];

writematrix(values, '.\GRANDAVG\new\fit_values_PLA_KET_EC_7_80.csv');

