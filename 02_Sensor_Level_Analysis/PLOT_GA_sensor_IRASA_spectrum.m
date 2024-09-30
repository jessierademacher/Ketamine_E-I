%% LOAD and PLOT data: 

clear
load .\GRANDAVG\PLApre_frac_planComb_EC % PLAdiff_estimates 
load .\GRANDAVG\KETpre_frac_planComb_EC % KETdiff_estimates 
load .\GRANDAVG\PLApost_frac_planComb_EC % PLAdiff_estimates 
load .\GRANDAVG\KETpost_frac_planComb_EC % KETdiff_estimates 

eval('Subject02')
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
PLApre_frac_planComb_EC.grad = grad;
PLApost_frac_planComb_EC.grad = grad;
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
KETpre_frac_planComb_EC.grad = grad;
KETpost_frac_planComb_EC.grad = grad;

% log scale 
PLApre_frac_planComb_EC_log = PLApre_frac_planComb_EC;
PLApre_frac_planComb_EC_log.powspctrm = log10(PLApre_frac_planComb_EC_log.powspctrm);
PLApost_frac_planComb_EC_log = PLApost_frac_planComb_EC;
PLApost_frac_planComb_EC_log.powspctrm = log10(PLApost_frac_planComb_EC_log.powspctrm);
KETpre_frac_planComb_EC_log = KETpre_frac_planComb_EC;
KETpre_frac_planComb_EC_log.powspctrm = log10(KETpre_frac_planComb_EC_log.powspctrm);;
KETpost_frac_planComb_EC_log = KETpost_frac_planComb_EC;
KETpost_frac_planComb_EC_log.powspctrm = log10(KETpost_frac_planComb_EC_log.powspctrm);

%% MULTIPLOT

cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
% cfg.xlim            = 
% cfg.ylim            =
cfg.box             = 'yes';
cfg.showlabels      = 'yes';
cfg.linewidth       = 1.0;
ft_multiplotER(cfg, PLApost_frac_planComb_EC, KETpost_frac_planComb_EC)

%% SINGLEPLOT

figure

subplot(2,1,1)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
cfg.channel         = {'MEG'};
cfg.avgoverchan     = 'yes';
cfg.xlim            = [3 90];
cfg.ylim            = [0 0.013];
cfg.box             = 'yes';
cfg.showscale       = 'yes';
cfg.linewidth       = 1.0;
% cfg.showlocations   = 'yes';
% cfg.showlabels      = 'yes';
cfg.layouttopo      = 'CTF275_helmet.mat';
cfg.figure          = 'gcf';
ft_singleplotER(cfg, PLApre_frac_planComb_EC,  PLApost_frac_planComb_EC)
title('Placebo EC');
ylabel('Power');
xlabel('Frequency (Hz)');
% legend('pre', 'post');
hold on;

subplot(2,1,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
cfg.channel         = {'MEG'};
cfg.avgoverchan     = 'yes';
cfg.xlim            = [3 90];
cfg.ylim            = [0 0.013];
cfg.box             = 'yes';
cfg.showscale       = 'yes';
cfg.linewidth       = 1.0;
% cfg.showlocations   = 'yes';
% cfg.showlabels      = 'yes';
cfg.layouttopo      = 'CTF275_helmet.mat';
cfg.figure          = 'gcf';
ft_singleplotER(cfg, KETpre_frac_planComb_EC,  KETpost_frac_planComb_EC)
title('Ketamine EC');
xlabel('Frequency (Hz)');
% legend('pre', 'post');
%suptitle(subjectdata.subjnr);

% log scale
figure
subplot(2,1,1)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
cfg.channel         = {'MEG'};
cfg.avgoverchan     = 'yes';
cfg.xlim            = [3 90];
%cfg.ylim            = [0 0.013];
cfg.box             = 'yes';
cfg.showscale       = 'yes';
cfg.linewidth       = 1.0;
% cfg.showlocations   = 'yes';
% cfg.showlabels      = 'yes';
cfg.layouttopo      = 'CTF275_helmet.mat';
cfg.figure          = 'gcf';
ft_singleplotER(cfg, PLApre_frac_planComb_EC_log,  PLApost_frac_planComb_EC_log)
title('Placebo EC');
ylabel('Power');
xlabel('Frequency (Hz)');
% legend('pre', 'post');
hold on;

subplot(2,1,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
cfg.channel         = {'MEG'};
cfg.avgoverchan     = 'yes';
cfg.xlim            = [3 90];
%cfg.ylim            = [0 0.013];
cfg.box             = 'yes';
cfg.showscale       = 'yes';
cfg.linewidth       = 1.0;
% cfg.showlocations   = 'yes';
% cfg.showlabels      = 'yes';
cfg.layouttopo      = 'CTF275_helmet.mat';
cfg.figure          = 'gcf';
ft_singleplotER(cfg, KETpre_frac_planComb_EC_log,  KETpost_frac_planComb_EC_log)
title('Ketamine EC');
xlabel('Frequency (Hz)');
% legend('pre', 'post');


% only posterior channels

figure

subplot(2,1,1)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
cfg.channel         = {'MZP01', 'MZO01', 'MZO02', 'MZO03', 'MLP52', 'MRP52',...
                       'MLO11', 'MRO11', 'MLO21', 'MRO21', 'MLO22', 'MRO22',...
                       'MLO12', 'MRO12', 'MLO31', 'MRO31', 'MLO32', 'MRO32',...
                       'MLO41', 'MRO41', 'MLO42', 'MRO42', 'MLO51', 'MRO51'};
cfg.avgoverchan     = 'yes';
cfg.xlim            = [3 90];
cfg.ylim            = [0 0.021];
cfg.box             = 'yes';
cfg.showscale       = 'yes';
cfg.linewidth       = 1.0;
% cfg.showlocations   = 'yes';
% cfg.showlabels      = 'yes';
cfg.layouttopo      = 'CTF275_helmet.mat';
cfg.figure          = 'gcf';
ft_singleplotER(cfg, PLApre_frac_planComb_EC,  PLApost_frac_planComb_EC)
title('Placebo EC');
ylabel('Power');
xlabel('Frequency (Hz)');
% legend('pre', 'post');
hold on;

subplot(2,1,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
cfg.channel         = {'MZP01', 'MZO01', 'MZO02', 'MZO03', 'MLP52', 'MRP52',...
                       'MLO11', 'MRO11', 'MLO21', 'MRO21', 'MLO22', 'MRO22',...
                       'MLO12', 'MRO12', 'MLO31', 'MRO31', 'MLO32', 'MRO32',...
                       'MLO41', 'MRO41', 'MLO42', 'MRO42', 'MLO51', 'MRO51'};
cfg.avgoverchan     = 'yes';
cfg.xlim            = [3 90];
cfg.ylim            = [0 0.021];
cfg.box             = 'yes';
cfg.showscale       = 'yes';
cfg.linewidth       = 1.0;
% cfg.showlocations   = 'yes';
% cfg.showlabels      = 'yes';
cfg.layouttopo      = 'CTF275_helmet.mat';
cfg.figure          = 'gcf';
ft_singleplotER(cfg, KETpre_frac_planComb_EC,  KETpost_frac_planComb_EC)
title('Ketamine EC');
xlabel('Frequency (Hz)');
% legend('pre', 'post');
%suptitle(subjectdata.subjnr);






