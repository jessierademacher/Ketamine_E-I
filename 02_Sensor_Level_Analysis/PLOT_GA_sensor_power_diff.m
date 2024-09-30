%% LOAD and PLOT data: 
clear
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_PLAdiff_planComb_FFT_EC
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_KETdiff_planComb_FFT_EC

eval('Subject02')
subjectdata.outputdir = ['E:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr filesep];
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
GA12_PLAdiff_planComb_EC.grad = grad;
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
GA12_KETdiff_planComb_EC.grad = grad;


%% TOPOPLOT Gamma
%scale = 5e-4;
scale = 6e-4;

figure
subplot(2,1,1)
cfg                 = [];
cfg.figure          = 'gcf';
cfg.parameter       = 'powspctrm';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [30 90]; % 1=offset 2=slope
cfg.zlim            = [-scale scale];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, GA12_PLAdiff_planComb_EC)
title('PLAdiff-gamma EC')
hold on;
subplot(2,1,2)
cfg                 = [];
cfg.parameter       = 'powspctrm';
cfg.figure          = 'gcf';
cfg.layout          = 'CTF275_helmet.mat';
cfg.xlim            = [30 90]; % 1=offset 2=slope
cfg.zlim            = [-scale scale];
cfg.colorbar        = 'West';
cfg.comment         = 'no';
ft_topoplotER(cfg, GA12_KETdiff_planComb_EC)
title('KETdiff-gamma EC')





