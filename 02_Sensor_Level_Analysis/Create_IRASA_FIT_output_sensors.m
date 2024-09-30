clear

% indicate frequency range
range = [7 80]; % [7 80] [3 90]


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
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApre_frac_planComb_dft2'])
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApost_frac_planComb_dft2'])
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpre_frac_planComb_dft2'])
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpost_frac_planComb_dft2'])


    %%% first create basic structure
    cfg                 = [];
    cfg.channel         = 'all'; 
    cfg.avgoverchan     = 'no';
    cfg.frequency       = [30 30.2500]; % placeholders for OFFSET and SLOPE
    cfg.avgoverfreq     = 'no';
    data_PLApre            = ft_selectdata(cfg, PLApre_frac);
    data_PLApre.freq       = [1 2]; % easier to work with
    data_PLApre            = rmfield(data_PLApre, 'cfg');
    data_PLApost           = ft_selectdata(cfg, PLApost_frac);
    data_PLApost.freq      = [1 2]; % easier to work with
    data_PLApost           = rmfield(data_PLApost, 'cfg');
    data_KETpre            = ft_selectdata(cfg, PLApre_frac);
    data_KETpre.freq       = [1 2]; % easier to work with
    data_KETpre            = rmfield(data_KETpre, 'cfg');
    data_KETpost           = ft_selectdata(cfg, KETpost_frac);
    data_KETpost.freq      = [1 2]; % easier to work with
    data_KETpost           = rmfield(data_KETpost, 'cfg');

    % select frequency data
    cfg                 = [];
    cfg.channel         = 'all'; 
    cfg.avgoverchan     = 'no';
    cfg.frequency       = range;
    cfg.avgoverfreq     = 'no';
    data                = ft_selectdata(cfg, PLApre_frac);
    data2               = ft_selectdata(cfg, PLApost_frac);
    data3               = ft_selectdata(cfg, KETpre_frac);
    data4               = ft_selectdata(cfg, KETpost_frac);


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
PLApre_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLApre{:});
PLApost_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLApost{:});
KETpre_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETpre{:});
KETpost_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETpost{:});
PLAdiff_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLAdiff{:});
KETdiff_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETdiff{:});
diff_diff_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_diff_diff{:});
avg_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_avg{:});

% for stats
cfg                             = [];
cfg.parameter                   = 'powspctrm';
cfg.keepindividual              = 'yes';    
PLApresubj_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLApre{:});
PLApostsubj_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLApost{:});
KETpresubj_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETpre{:});
KETpostsubj_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETpost{:});
PLAdiffsubj_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_PLAdiff{:});
KETdiffsubj_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_KETdiff{:});
diff_diffsubj_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_diff_diff{:});
avgsubj_estimates_EC     = ft_freqgrandaverage(cfg, SUBJNRS_avg{:});

save(strcat('.\GRANDAVG\new\GA12_PLApre_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'PLApre_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_PLApre_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'PLApresubj_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_PLApost_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'PLApost_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_PLApost_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'PLApostsubj_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_PLAdiff_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'PLAdiff_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_PLAdiff_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'PLAdiffsubj_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_KETpre_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'KETpre_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_KETpre_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'KETpresubj_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_KETpost_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'KETpost_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_KETpost_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'KETpostsubj_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_KETdiff_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'KETdiff_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_KETdiff_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'KETdiffsubj_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_diff_diff_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'diff_diff_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_diff_diff_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'diff_diffsubj_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12_avg_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'avg_estimates_EC')
save(strcat('.\GRANDAVG\new\GA12subj_avg_sensor_frac_fit_EC_',num2str(range(1)),'_',num2str(range(2))), 'avgsubj_estimates_EC')

