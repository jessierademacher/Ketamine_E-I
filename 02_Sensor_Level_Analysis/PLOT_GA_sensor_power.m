%% LOAD and PLOT data: 
clear

load D:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_PLApre_planComb_FFT_EC 
load D:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_PLApost_planComb_FFT_EC 
load D:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_KETpre_planComb_FFT_EC 
load D:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_KETpost_planComb_FFT_EC 

eval('Subject02')
subjectdata.outputdir = ['D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr filesep];
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
GA12_PLApre_planComb_EC.grad = grad;
GA12_PLApost_planComb_EC.grad = grad;
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
GA12_KETpre_planComb_EC.grad = grad;
GA12_KETpost_planComb_EC.grad = grad;

%% TOPOPLOT gamma

scale = 1.5e-3;

figure
subplot(2,2,1)
cfg                 = [];
cfg.figure          = 'gcf';
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [30 90]; 
cfg.zlim            = [0 scale];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, GA12_PLApre_planComb_EC)
title('PLApre-gamma EC')
hold on;
subplot(2,2,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.figure          = 'gcf';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [30 90]; 
cfg.zlim            = [0 scale];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, GA12_PLApost_planComb_EC)
title('PLApost-gamma EC')
hold on;
subplot(2,2,3)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.figure          = 'gcf';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [30 90]; 
cfg.zlim            = [0 scale];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, GA12_KETpre_planComb_EC)
title('KETpre-gamma EC')
hold on;
subplot(2,2,4)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.figure          = 'gcf';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [30 90]; 
cfg.zlim            = [0 scale];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, GA12_KETpost_planComb_EC)
title('KETpost-gamma EC')



clear


