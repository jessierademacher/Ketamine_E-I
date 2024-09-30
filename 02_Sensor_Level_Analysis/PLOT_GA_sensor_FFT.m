%% LOAD and PLOT data: 

clear
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_PLApre_planComb_FFT_EC 
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_PLApost_planComb_FFT_EC 
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_KETpre_planComb_FFT_EC 
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_KETpost_planComb_FFT_EC 

eval('Subject01')
subjectdata.outputdir = ['E:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr filesep];
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
GA12_PLApre_planComb_EC.grad = grad;
GA12_PLApost_planComb_EC.grad = grad;
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
GA12_KETpre_planComb_EC.grad = grad;
GA12_KETpost_planComb_EC.grad = grad;

%% MULTIPLOT

cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
% cfg.xlim            = 
% cfg.ylim            =
cfg.box             = 'yes';
cfg.showlabels      = 'yes';
cfg.linewidth       = 1.0;
ft_multiplotER(cfg, GA12_PLApost_planComb_EC, GA12_KETpost_planComb_EC)

%% SINGLEPLOT
figure
hold on;

subplot(1,2,1)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
cfg.channel         = {'MZO01'};
%cfg.channel         = {'MZC02'};
cfg.xlim            = [1 90];
cfg.ylim            = [0 0.07];
cfg.box             = 'yes';
cfg.showscale       = 'yes';
cfg.linewidth       = 1.0;
% cfg.showlocations   = 'yes';
% cfg.showlabels      = 'yes';
cfg.layouttopo      = 'CTF275_helmet.mat';
cfg.figure          = 'gcf';
ft_singleplotER(cfg, GA12_PLApre_planComb_EC, GA12_PLApost_planComb_EC)
title('PLApre-PLApost EC');
% legend('pre', 'post');
hold on;

subplot(1,2,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275.lay';
cfg.channel         = {'MZO01'};
%cfg.channel         = {'MZC02'};
cfg.xlim            = [1 90];
cfg.ylim            = [0 0.07];
cfg.box             = 'yes';
cfg.showscale       = 'yes';
cfg.linewidth       = 1.0;
% cfg.showlocations   = 'yes';
% cfg.showlabels      = 'yes';
cfg.layouttopo      = 'CTF275_helmet.mat';
cfg.figure          = 'gcf';
ft_singleplotER(cfg, GA12_KETpre_planComb_EC, GA12_KETpost_planComb_EC)
title('KETpre-KETpost EC');
% legend('pre', 'post');
%suptitle(subjectdata.subjnr);


%% TOPOPLOT 30-90 Hz

scale = 3e-3;
figure
subplot(1,2,1)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [30 90]; 
cfg.zlim            = [-scale scale];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
cfg.figure          = 'gcf';
ft_topoplotER(cfg, GA13_PLApost_planComb_EC)
title('PLApost-30-90Hz EC')
%suptitle([subjectdata.subjnr ' gamma']);
hold on;
subplot(1,2,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [30 90]; 
cfg.zlim            = [-scale scale];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
cfg.figure          = 'gcf';
ft_topoplotER(cfg, GA13_KETpost_planComb_EC)
title('KETpost-30-90Hz EC')


% clear


