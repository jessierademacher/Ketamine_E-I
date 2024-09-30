%% LOAD and PLOT data: 

clear

load .\GRANDAVG\new\GA12_PLApre_sensor_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12_KETpre_sensor_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12_PLApost_sensor_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12_KETpost_sensor_frac_fit_EC_7_80


eval('Subject02')
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
PLApre_estimates_EC.grad = grad;
PLApost_estimates_EC.grad = grad;
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
KETpre_estimates_EC.grad = grad;
KETpost_estimates_EC.grad = grad;


%% TOPOPLOT SLOPE

figure
subplot(2,2,1)
cfg                 = [];
cfg.figure          = 'gcf';
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [2 2]; % 1=offset 2=slope
cfg.zlim            = [0 1.3];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, PLApre_estimates_EC)
title('PLApre-slope EC')
hold on;
subplot(2,2,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.figure          = 'gcf';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [2 2]; % 1=offset 2=slope
cfg.zlim            = [0 1.3];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, PLApost_estimates_EC)
title('PLApost-slope EC')
hold on;
subplot(2,2,3)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.figure          = 'gcf';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [2 2]; % 1=offset 2=slope
cfg.zlim            = [0 1.3];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, KETpre_estimates_EC)
title('KETpre-slope EC')
hold on;
subplot(2,2,4)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.figure          = 'gcf';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [2 2]; % 1=offset 2=slope
%cfg.zlim            = [-9e-3 9e-3];
cfg.zlim            = [0 1.3];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, KETpost_estimates_EC)
title('KETpost-slope EC')

%% TOPOPLOT OFFSET

figure
subplot(2,2,1)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [1 1]; % 1=offset 2=slope
cfg.zlim            = [-3.0 -1.5];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, PLApre_estimates_EC)
title('PLApre-offset')
hold on;
subplot(2,2,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [1 1]; % 1=offset 2=slope
cfg.zlim            = [-3.0 -1.5];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, PLApost_estimates_EC)
title('PLApost-offset')
hold on;
subplot(2,2,3)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [1 1]; % 1=offset 2=slope
cfg.zlim            = [-3.0 -1.5];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, KETpre_estimates_EC)
title('KETpre-offset')
hold on;
subplot(2,2,4)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [1 1]; % 1=offset 2=slope
cfg.zlim            = [-3.0 -1.5];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, KETpost_estimates_EC)
title('KETpost-offset')

