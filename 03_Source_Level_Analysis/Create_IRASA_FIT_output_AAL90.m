clear

% indicate frequency range
range = [30 80]; % [7 80] [3 90]



%% IRASA slope and offset data: EO

SUBJNRS_PLApre = cell(12,1); 
SUBJNRS_PLApost = cell(12,1); 
SUBJNRS_KETpre = cell(12,1); 
SUBJNRS_KETpost = cell(12,1); 
SUBJNRS_PLAdiff = cell(12,1); 
SUBJNRS_KETdiff = cell(12,1); 
SUBJNRS_diff_diff = cell(12,1); 
SUBJNRS_avg = cell(12,1); 
j = 1;
for ind = [2:8 10:14]
    
    
    subjectID = {'Subject01','Subject02','Subject03','Subject04','Subject05',...,
                 'Subject06','Subject07','Subject08','Subject09','Subject10',...
                 'Subject11','Subject12','Subject13','Subject14'};

    fprintf('dataset is %s\n',subjectID{ind}) 
    sName = subjectID{ind};
    eval(sName)

    % IRASA aperiodic data
    load(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EO_frac_PLApre_norm_dft2']) % PLApre_frac
    load(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EO_frac_PLApost_norm_dft2']) % PLApost_frac
    load(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EO_frac_KETpre_norm_dft2']) % KETpre_frac
    load(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EO_frac_KETpost_norm_dft2']) % KETpost_frac


    %%% first create basic structure
    cfg                 = [];
    cfg.channel         = 'all'; 
    cfg.avgoverchan     = 'no';
    cfg.frequency       = [30 30.2500]; % placeholders for OFFSET and SLOPE
    cfg.avgoverfreq     = 'no';
    data_PLApre            = ft_selectdata(cfg, PLApre_EO_frac);
    data_PLApre.freq       = [1 2]; % easier to work with
    data_PLApre            = rmfield(data_PLApre, 'cfg');
    data_PLApost           = ft_selectdata(cfg, PLApost_EO_frac);
    data_PLApost.freq      = [1 2]; % easier to work with
    data_PLApost           = rmfield(data_PLApost, 'cfg');
    data_KETpre            = ft_selectdata(cfg, PLApre_EO_frac);
    data_KETpre.freq       = [1 2]; % easier to work with
    data_KETpre            = rmfield(data_KETpre, 'cfg');
    data_KETpost           = ft_selectdata(cfg, KETpost_EO_frac);
    data_KETpost.freq      = [1 2]; % easier to work with
    data_KETpost           = rmfield(data_KETpost, 'cfg');

    % select frequency data
    cfg                 = [];
    cfg.channel         = 'all'; 
    cfg.avgoverchan     = 'no';
    cfg.frequency       = range;
    cfg.avgoverfreq     = 'no';
    data                = ft_selectdata(cfg, PLApre_EO_frac);
    data2               = ft_selectdata(cfg, PLApost_EO_frac);
    data3               = ft_selectdata(cfg, KETpre_EO_frac);
    data4               = ft_selectdata(cfg, KETpost_EO_frac);


    %%% SLOPE and OFFSET values
    for k = 1:length(data.label)
        % fit the data
        ft = fittype('b-log10(x^s)','dependent',{'y'},'independent',{'x'},...
                     'coefficients',{'b','s'});

        temp_PLApre    = fit(data.freq', log10(data.powspctrm(k,:)'), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
        data_PLApre.powspctrm(k,1) = temp_PLApre.b;
        data_PLApre.powspctrm(k,2) = temp_PLApre.s;

        temp_PLApost    = fit(data2.freq', log10(data2.powspctrm(k,:)'), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
        data_PLApost.powspctrm(k,1) = temp_PLApost.b;
        data_PLApost.powspctrm(k,2) = temp_PLApost.s;

        temp_KETpre    = fit(data3.freq', log10(data3.powspctrm(k,:)'), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
        data_KETpre.powspctrm(k,1) = temp_KETpre.b;
        data_KETpre.powspctrm(k,2) = temp_KETpre.s;

        temp_KETpost    = fit(data4.freq', log10(data4.powspctrm(k,:)'), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
        data_KETpost.powspctrm(k,1) = temp_KETpost.b;
        data_KETpost.powspctrm(k,2) = temp_KETpost.s;
        
    end
    clear PLApre_EO_frac
    clear PLApost_EO_frac
    clear KETpre_EO_frac
    clear KETpost_EO_frac
    
    
    % compute difference
    data_PLAdiff            = data_PLApost;
    data_PLAdiff.powspctrm  = data_PLApost.powspctrm - data_PLApre.powspctrm;

    data_KETdiff            = data_KETpost;
    data_KETdiff.powspctrm  = data_KETpost.powspctrm - data_KETpre.powspctrm;

    % compute difference of difference (for interaction)
    data_diff_diff          = data_KETdiff;
    data_diff_diff.powspctrm = data_KETdiff.powspctrm - data_PLAdiff.powspctrm;

    % compute average (for EO vs EC)
    data_avg           = data_PLApost;
    data_avg.powspctrm  = (data_PLApre.powspctrm + data_PLApost.powspctrm + data_KETpre.powspctrm + data_KETpost.powspctrm)/4;
    
    %%% rename for each ind subj
    SUBJNRS_PLApre{j}   = data_PLApre;
    SUBJNRS_PLApost{j}   = data_PLApost;
    SUBJNRS_KETpre{j}   = data_KETpre;
    SUBJNRS_KETpost{j}   = data_KETpost;

    SUBJNRS_PLAdiff{j}  = data_PLAdiff;
    SUBJNRS_KETdiff{j}  = data_KETdiff;

    SUBJNRS_diff_diff{j}  = data_diff_diff;

    SUBJNRS_avg{j}      = data_avg;


    j = j + 1;

end

% for plotting
cfg                             = [];
cfg.parameter                   = 'powspctrm';
cfg.keepindividual              = 'no';    
GA12_PLApre_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_PLApre{:});
GA12_PLApost_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_PLApost{:});
GA12_KETpre_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_KETpre{:});
GA12_KETpost_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_KETpost{:});
GA12_PLAdiff_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_PLAdiff{:});
GA12_KETdiff_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_KETdiff{:});
GA12_diff_diff_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_diff_diff{:});
GA12_avg_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_avg{:});

% for stats
cfg                             = [];
cfg.parameter                   = 'powspctrm';
cfg.keepindividual              = 'yes';    
GA12subj_PLApre_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_PLApre{:});
GA12subj_PLApost_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_PLApost{:});
GA12subj_KETpre_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_KETpre{:});
GA12subj_KETpost_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_KETpost{:});
GA12subj_PLAdiff_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_PLAdiff{:});
GA12subj_KETdiff_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_KETdiff{:});
GA12subj_diff_diff_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_diff_diff{:});
GA12subj_avg_AAL90_estimates_EO     = ft_freqgrandaverage(cfg, SUBJNRS_avg{:});

save(strcat('.\GRANDAVG\new\GA12_PLApre_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12_PLApre_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12subj_PLApre_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_PLApre_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12_PLApost_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12_PLApost_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12subj_PLApost_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_PLApost_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12_PLAdiff_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12_PLAdiff_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12subj_PLAdiff_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_PLAdiff_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12_KETpre_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12_KETpre_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12subj_KETpre_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_KETpre_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12_KETpost_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12_KETpost_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12subj_KETpost_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_KETpost_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12_KETdiff_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12_KETdiff_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12subj_KETdiff_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_KETdiff_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12_diff_diff_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12_diff_diff_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12subj_diff_diff_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_diff_diff_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12_avg_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12_avg_AAL90_estimates_EO')
save(strcat('.\GRANDAVG\new\GA12subj_avg_AAL90_frac_fit_EO_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_avg_AAL90_estimates_EO')


clearvars -except range

%% IRASA slope and offset data: EC

SUBJNRS_PLApre = cell(12,1); 
SUBJNRS_PLApost = cell(12,1); 
SUBJNRS_KETpre = cell(12,1); 
SUBJNRS_KETpost = cell(12,1); 
SUBJNRS_PLAdiff = cell(12,1); 
SUBJNRS_KETdiff = cell(12,1); 
SUBJNRS_diff_diff = cell(12,1); 
SUBJNRS_avg = cell(12,1); 
j = 1;
for ind = [2:8 10:14]
    
    
    subjectID = {'Subject01','Subject02','Subject03','Subject04','Subject05',...,
                 'Subject06','Subject07','Subject08','Subject09','Subject10',...
                 'Subject11','Subject12','Subject13','Subject14'};

    fprintf('dataset is %s\n',subjectID{ind}) 
    sName = subjectID{ind};
    eval(sName)

    % IRASA aperiodic data
    load(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_frac_PLApre_norm_dft2']) % PLApre_frac
    load(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_frac_PLApost_norm_dft2']) % PLApost_frac
    load(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_frac_KETpre_norm_dft2']) % KETpre_frac
    load(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_frac_KETpost_norm_dft2']) % KETpost_frac


    %%% first create basic structure
    cfg                 = [];
    cfg.channel         = 'all'; 
    cfg.avgoverchan     = 'no';
    cfg.frequency       = [30 30.2500]; % placeholders for OFFSET and SLOPE
    cfg.avgoverfreq     = 'no';
    data_PLApre            = ft_selectdata(cfg, PLApre_EC_frac);
    data_PLApre.freq       = [1 2]; % easier to work with
    data_PLApre            = rmfield(data_PLApre, 'cfg');
    data_PLApost           = ft_selectdata(cfg, PLApost_EC_frac);
    data_PLApost.freq      = [1 2]; % easier to work with
    data_PLApost           = rmfield(data_PLApost, 'cfg');
    data_KETpre            = ft_selectdata(cfg, PLApre_EC_frac);
    data_KETpre.freq       = [1 2]; % easier to work with
    data_KETpre            = rmfield(data_KETpre, 'cfg');
    data_KETpost           = ft_selectdata(cfg, KETpost_EC_frac);
    data_KETpost.freq      = [1 2]; % easier to work with
    data_KETpost           = rmfield(data_KETpost, 'cfg');

    % select frequency data
    cfg                 = [];
    cfg.channel         = 'all'; 
    cfg.avgoverchan     = 'no';
    cfg.frequency       = range;
    cfg.avgoverfreq     = 'no';
    data                = ft_selectdata(cfg, PLApre_EC_frac);
    data2               = ft_selectdata(cfg, PLApost_EC_frac);
    data3               = ft_selectdata(cfg, KETpre_EC_frac);
    data4               = ft_selectdata(cfg, KETpost_EC_frac);


    %%% SLOPE and OFFSET values
    for k = 1:length(data.label)
        % fit the data
        ft = fittype('b-log10(x^s)','dependent',{'y'},'independent',{'x'},...
                     'coefficients',{'b','s'});

        temp_PLApre    = fit(data.freq', log10(data.powspctrm(k,:)'), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
        data_PLApre.powspctrm(k,1) = temp_PLApre.b;
        data_PLApre.powspctrm(k,2) = temp_PLApre.s;

        temp_PLApost    = fit(data2.freq', log10(data2.powspctrm(k,:)'), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
        data_PLApost.powspctrm(k,1) = temp_PLApost.b;
        data_PLApost.powspctrm(k,2) = temp_PLApost.s;

        temp_KETpre    = fit(data3.freq', log10(data3.powspctrm(k,:)'), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
        data_KETpre.powspctrm(k,1) = temp_KETpre.b;
        data_KETpre.powspctrm(k,2) = temp_KETpre.s;

        temp_KETpost    = fit(data4.freq', log10(data4.powspctrm(k,:)'), ft, 'Robust', 'on', 'Lower', [-Inf 0]);
        data_KETpost.powspctrm(k,1) = temp_KETpost.b;
        data_KETpost.powspctrm(k,2) = temp_KETpost.s;
        
    end
    clear PLApre_EC_frac
    clear PLApost_EC_frac
    clear KETpre_EC_frac
    clear KETpost_EC_frac
    
    
    % compute difference
    data_PLAdiff            = data_PLApost;
    data_PLAdiff.powspctrm  = data_PLApost.powspctrm - data_PLApre.powspctrm;

    data_KETdiff            = data_KETpost;
    data_KETdiff.powspctrm  = data_KETpost.powspctrm - data_KETpre.powspctrm;

    % compute difference of difference (for interaction)
    data_diff_diff          = data_KETdiff;
    data_diff_diff.powspctrm = data_KETdiff.powspctrm - data_PLAdiff.powspctrm;

    % compute average (for EO vs EC)
    data_avg           = data_PLApost;
    data_avg.powspctrm  = (data_PLApre.powspctrm + data_PLApost.powspctrm + data_KETpre.powspctrm + data_KETpost.powspctrm)/4;
    
    %%% rename for each ind subj
    SUBJNRS_PLApre{j}   = data_PLApre;
    SUBJNRS_PLApost{j}   = data_PLApost;
    SUBJNRS_KETpre{j}   = data_KETpre;
    SUBJNRS_KETpost{j}   = data_KETpost;

    SUBJNRS_PLAdiff{j}  = data_PLAdiff;
    SUBJNRS_KETdiff{j}  = data_KETdiff;

    SUBJNRS_diff_diff{j}  = data_diff_diff;

    SUBJNRS_avg{j}      = data_avg;


    j = j + 1;

end

% for plotting
cfg                             = [];
cfg.parameter                   = 'powspctrm';
cfg.keepindividual              = 'no';    
GA12_PLApre_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLApre{:});
GA12_PLApost_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLApost{:});
GA12_KETpre_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETpre{:});
GA12_KETpost_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETpost{:});
GA12_PLAdiff_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLAdiff{:});
GA12_KETdiff_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETdiff{:});
GA12_diff_diff_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_diff_diff{:});
GA12_avg_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_avg{:});

% for stats
cfg                             = [];
cfg.parameter                   = 'powspctrm';
cfg.keepindividual              = 'yes';    
GA12subj_PLApre_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLApre{:});
GA12subj_PLApost_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLApost{:});
GA12subj_KETpre_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETpre{:});
GA12subj_KETpost_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETpost{:});
GA12subj_PLAdiff_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLAdiff{:});
GA12subj_KETdiff_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETdiff{:});
GA12subj_diff_diff_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_diff_diff{:});
GA12subj_avg_AAL90_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_avg{:});

save(strcat('.\GRANDAVG\new\GA12_PLApre_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12_PLApre_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_PLApre_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_PLApre_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_PLApost_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12_PLApost_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_PLApost_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_PLApost_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_PLAdiff_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12_PLAdiff_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_PLAdiff_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_PLAdiff_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_KETpre_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12_KETpre_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_KETpre_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_KETpre_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_KETpost_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12_KETpost_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_KETpost_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_KETpost_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_KETdiff_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12_KETdiff_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_KETdiff_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_KETdiff_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_diff_diff_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12_diff_diff_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_diff_diff_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_diff_diff_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_avg_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12_avg_AAL90_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_avg_AAL90_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'GA12subj_avg_AAL90_estimates_EC')
