%% LOAD and PLOT data: 

clear

load .\GRANDAVG\new\GA12_PLAdiff_sensor_frac_fit_EC_7_80 % PLAdiffsubj_estimates_EC 
load .\GRANDAVG\new\GA12_KETdiff_sensor_frac_fit_EC_7_80 % KETdiffsubj_estimates_EC 

eval('Subject02')
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
PLAdiff_estimates_EC.grad = grad;
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
KETdiff_estimates_EC.grad = grad;


%% TOPOPLOT SLOPE

figure
subplot(2,1,1)
cfg                 = [];
cfg.figure          = 'gcf';
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [2 2]; % 1=offset 2=slope
%cfg.zlim            = [-4e-3 4e-3];
cfg.zlim            = [-0.4 0.4];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, PLAdiff_estimates_EC)
title('PLAdiff-slope EC')
hold on;
subplot(2,1,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.figure          = 'gcf';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [2 2]; % 1=offset 2=slope
%cfg.zlim            = [-4e-3 4e-3];
cfg.zlim            = [-0.4 0.4];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, KETdiff_estimates_EC)
title('KETdiff-slope EC')



