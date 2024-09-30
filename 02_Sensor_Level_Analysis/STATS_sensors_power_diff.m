
%% PERMUTATION TESTS GA13
clear
% load .\GRANDAVG\PLAdiffsubj_osci_planComb_EC 
% load .\GRANDAVG\KETdiffsubj_osci_planComb_EC  
% load .\GRANDAVG\PLAdiffsubj_osci_planComb_EC 
% load .\GRANDAVG\KETdiffsubj_osci_planComb_EC 

load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12subj_PLAdiff_planComb_FFT_EC
load E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12subj_KETdiff_planComb_FFT_EC

eval('Subject02')
subjectdata.outputdir = ['E:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr filesep];
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
% PLAdiffsubj_osci_planComb_EC.grad = grad;
% PLAdiffsubj_osci_planComb_EC.grad = grad;
GA12subj_PLAdiff_planComb_EC.grad = grad;
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
% KETdiffsubj_osci_planComb_EC.grad = grad;
% KETdiffsubj_osci_planComb_EC.grad = grad;
GA12subj_KETdiff_planComb_EC.grad = grad;

%% STATS

data_PLA_FFT = GA12subj_PLAdiff_planComb_EC;
data_KET_FFT = GA12subj_KETdiff_planComb_EC;


cfg                  = [];
% specifies with which sensors other sensors can form clusters
cfg_neighb           = [];
cfg_neighb.method    = 'distance';
% cfg.neighbours       = ft_prepare_neighbours(cfg_neighb, data_KET_EC);

cfg.neighbours       = ft_prepare_neighbours(cfg_neighb, data_KET_FFT);

% allMEG
cfg.channel          = {'MEG'};
cfg.avgoverchan      = 'no';

% cfg.frequency        = [1 1]; % 1=offset, 2=slope
cfg.frequency        = [30 90]; 
cfg.avgoverfreq      = 'yes';
%cfg.avgoverfreq      = 'no';

cfg.method           = 'montecarlo';
cfg.statistic        = 'depsamplesT';
%cfg.statistic        = 'cohensd';
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

stat_FFT = ft_freqstatistics(cfg, data_KET_FFT, data_PLA_FFT);
channels = stat_FFT.label(sum(sum(stat_FFT.posclusterslabelmat==1,3),2)>0);


figure
cfg             = [];
cfg.figure      = 'gcf';
cfg.alpha       = 0.05;
cfg.parameter   = 'stat';
%cfg.zlim        = [-5 5]; %'maxmin'; %[-5 5];
cfg.zlim        = [0 11];
cfg.highlightsymbolseries = ['.','.','.','.','.']; %['*','x','+','o','.'];
cfg.highlightsizeseries = [30 30 10 10 10];
cfg.highlightcolorpos = [1 1 1];
cfg.highlightcolorneg = [1 1 1];
cfg.layout      = 'CTF275_helmet.mat';
cfg.colorbar    = 'yes';
cfg.subplotsize = [1 1];
% cfg.renderer    = 'painter';
ft_clusterplot(cfg, stat_FFT);
title('Gamma: KET-vs-PLA EC')

%% Cohen's D

cfg                  = [];
cfg.channel          = {'MEG'};
cfg.avgoverchan      = 'no';
%cfg.channel          = channels';
%cfg.avgoverchan      = 'yes';
cfg.frequency        = [30 90]; 
cfg.avgoverfreq      = 'yes';
cfg.method           = 'analytic';
cfg.statistic        = 'cohensd';



% calculate cohen's d by hand
m = mean(mean(data_KET_FFT.powspctrm(:,:,30:90),3) - mean(data_PLA_FFT.powspctrm(:,:,30:90),3),1)
sd = std(mean(data_KET_FFT.powspctrm(:,:,30:90),3) - mean(data_PLA_FFT.powspctrm(:,:,30:90),3),1)

d = m./sd


