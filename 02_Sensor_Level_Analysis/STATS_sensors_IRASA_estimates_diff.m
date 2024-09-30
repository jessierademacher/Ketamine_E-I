
%% PERMUTATION TESTS GA12
clear

load .\GRANDAVG\new\GA12subj_PLAdiff_sensor_frac_fit_EC_7_80 % PLAdiffsubj_estimates_EC 
load .\GRANDAVG\new\GA12subj_KETdiff_sensor_frac_fit_EC_7_80 % KETdiffsubj_estimates_EC 

eval('Subject02')
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
PLAdiffsubj_estimates_EC.grad = grad;
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
KETdiffsubj_estimates_EC.grad = grad;

%% STATS
data_PLA_EC = PLAdiffsubj_estimates_EC;
data_KET_EC = KETdiffsubj_estimates_EC;

cfg                  = [];
% specifies with which sensors other sensors can form clusters
cfg_neighb           = [];
cfg_neighb.method    = 'distance';
cfg.neighbours       = ft_prepare_neighbours(cfg_neighb, data_PLA_EC);

% allMEG
cfg.channel          = {'MEG'};
cfg.avgoverchan      = 'no';

% cfg.frequency        = [1 1]; % 1=offset, 2=slope
cfg.frequency        = [2 2]; % 1=offset, 2=slope
cfg.avgoverfreq      = 'yes';

cfg.method           = 'montecarlo';
cfg.statistic        = 'depsamplesT';
cfg.correctm         = 'cluster';
cfg.clusteralpha     = 0.025;
cfg.clusterstatistic = 'maxsum';
cfg.clusterthreshold = 'nonparametric_individual';
cfg.minnbchan        = 2;
cfg.tail             = 0;
cfg.clustertail      = 0;
cfg.alpha            = 0.05;
cfg.correcttail      = 'prob';
cfg.numrandomization = 2000;

% dependent t-tests: 
subj = 12;
design = zeros(2,2*subj);
for i = 1:subj
    design(1,i) = i;
end
for i = 1:subj
    design(1,subj+i) = i;
end
design(2,1:subj)        = 1;
design(2,subj+1:2*subj) = 2;

cfg.design   = design;
cfg.uvar     = 1;
cfg.ivar     = 2;

% CONTRAST
[stat_EC] = ft_freqstatistics(cfg, data_KET_EC, data_PLA_EC);% KETAMINE post-pre vs PLACEBO post-pre
channels_EC = stat_EC.label(sum(sum(stat_EC.negclusterslabelmat==1,3),2)>0);

%% PLOT effects

figure
cfg             = [];
cfg.figure      = 'gcf';
cfg.alpha       = 0.05;
cfg.parameter   = 'stat';
%cfg.zlim        = [-4 4]; %'maxmin'; %[-5 5];
cfg.zlim        = [-9 0];
cfg.highlightsymbolseries = ['.','.','.','.','.']; %['*','x','+','o','.'];
cfg.highlightsizeseries = [30 30 10 10 10];
cfg.highlightcolorpos = [1 1 1];
cfg.highlightcolorneg = [1 1 1];
cfg.layout      = 'CTF275_helmet.mat';
cfg.colorbar    = 'yes';
cfg.subplotsize = [1 1];
% cfg.renderer    = 'painter';
ft_clusterplot(cfg, stat_EC);
title('SLOPE: KET-vs-PLA EC')


%% Cohen's D

cfg                  = [];
%cfg.channel          = {'MEG'};
%cfg.avgoverchan      = 'no';
cfg.channel          = channels_EC';
cfg.avgoverchan      = 'yes';
cfg.frequency        = [2 2]; % 1=offset, 2=slope
cfg.avgoverfreq      = 'yes';
cfg.method           = 'analytic';
cfg.statistic        = 'cohensd';


% dependent t-tests:
subj = 12;
design = zeros(2,2*subj);
for i = 1:subj
    design(1,i) = i;
end
for i = 1:subj
    design(1,subj+i) = i;
end
design(2,1:subj)        = 1;
design(2,subj+1:2*subj) = 2;

cfg.design   = design;
cfg.uvar     = 1;
cfg.ivar     = 2;

% CONTRAST

stat_cohensd_EC = ft_freqstatistics(cfg, data_KET_EC, data_PLA_EC);



cfg                  = [];
%cfg.channel          = {'MEG'};
%cfg.avgoverchan      = 'no';
cfg.channel          = channels_EO';
cfg.avgoverchan      = 'yes';
cfg.frequency        = [2 2]; % 1=offset, 2=slope
cfg.avgoverfreq      = 'yes';
cfg.method           = 'analytic';
cfg.statistic        = 'cohensd';



