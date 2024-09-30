
%% PERMUTATION TESTS GA12
clear

% diff KET vs PLA

load .\GRANDAVG\new\GA12subj_PLAdiff_AAL90_frac_fit_EC_7_80
load .\GRANDAVG\new\GA12subj_KETdiff_AAL90_frac_fit_EC_7_80


%% STATS
data3 = GA12subj_PLAdiff_AAL90_estimates_EC;
data4 = GA12subj_KETdiff_AAL90_estimates_EC;


cfg                  = [];
cfg.channel          = {'all'};
cfg.avgoverchan      = 'no';

%cfg.frequency        = [1 1]; % 1=offset, 2=slope
cfg.frequency        = [2 2]; % 1=offset, 2=slope
cfg.avgoverfreq      = 'yes';

cfg.method           = 'montecarlo';
cfg.statistic        = 'depsamplesT';
%cfg.statistic        = 'ft_statfun_depsamplesT';
cfg.correctm         = 'fdr';
cfg.neighbours       = [];
cfg.computecritval   = 'yes';
cfg.computeprob      = 'yes';
cfg.tail             = 0;
cfg.clustertail      = 0;
%cfg.alpha            = 0.025;
cfg.alpha            = 0.05;
cfg.correcttail      = 'prob';
%cfg.correcttail      = 'alpha';
cfg.numrandomization = 2000;
cfg.randomseed       = 1234;

% dependent t-tests
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
[stat_EC] = ft_freqstatistics(cfg, data4, data3);% EC KET vs PLA

channels_EC = stat_EC.label(stat_EC.mask);


%% Results EC

% calculate t-values based on p-values and df
tvalues_EC = tinv(1-stat_EC.probsmontecarlo, stat_EC.df);

data_slope_EC = zeros(90,4);
for i=1:90
    data_slope_EC(i,1) = round(i);
    data_slope_EC(i,2) = stat_EC.probsmontecarlo(i,1); % only works with adapted ft_statistics_montecarlo script
    data_slope_EC(i,3) = tvalues_EC(i,1);
    data_slope_EC(i,4) = stat_EC.mask(i,1);
end
disp(data_slope_EC);

% critical values
disp(stat_EC.critp)
disp(tinv(1-stat_EC.critp, stat_EC.df))


writematrix(data_slope_EC, '.\BRAINODES\slope_log\slope_EC_30_80.xlsx')


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

stat_cohensd_EC = ft_freqstatistics(cfg, data4, data3);



