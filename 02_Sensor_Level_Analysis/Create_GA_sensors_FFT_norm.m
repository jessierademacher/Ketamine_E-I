%% EC
clear all

SUBJNRS1 = cell(12,1);
SUBJNRS2 = cell(12,1);
SUBJNRS3 = cell(12,1);
SUBJNRS4 = cell(12,1);
SUBJNRS5 = cell(12,1);
SUBJNRS6 = cell(12,1);
j = 1;
for ind = [2:8 10:14]
    
    
    subjectID = {'Subject01','Subject02','Subject03','Subject04','Subject05',...,
                 'Subject06','Subject07','Subject08','Subject09','Subject10',...
                 'Subject11','Subject12','Subject13','Subject14'};

    fprintf('dataset is %s\n',subjectID{ind}) 
    sName = subjectID{ind};
    eval(sName)
    
    % FFT data
    load(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\FFT\', subjectdata.subjnr, '_EC_PLApre_planComb_norm_dft2'])
    load(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\FFT\', subjectdata.subjnr, '_EC_PLApost_planComb_norm_dft2'])
    load(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\FFT\', subjectdata.subjnr, '_EC_KETpre_planComb_norm_dft2'])
    load(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\FFT\', subjectdata.subjnr, '_EC_KETpost_planComb_norm_dft2'])
    

    
    PLAdiff_planComb_EC             = PLApost_planComb_EC;
    PLAdiff_planComb_EC.powspctrm   = PLApost_planComb_EC.powspctrm - PLApre_planComb_EC.powspctrm;
    KETdiff_planComb_EC             = KETpost_planComb_EC;
    KETdiff_planComb_EC.powspctrm   = KETpost_planComb_EC.powspctrm - KETpre_planComb_EC.powspctrm;
    
    % rename for each ind subj
    SUBJNRS1{j} = PLApre_planComb_EC;
    SUBJNRS2{j} = PLApost_planComb_EC;
    SUBJNRS3{j} = KETpre_planComb_EC;
    SUBJNRS4{j} = KETpost_planComb_EC;
    SUBJNRS5{j} = PLAdiff_planComb_EC;
    SUBJNRS6{j} = KETdiff_planComb_EC;
    j = j + 1;

end

% for plotting
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'no';    
GA12_PLApre_planComb_EC             = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_PLApre_planComb_EC             = rmfield(GA12_PLApre_planComb_EC ,'cfg');
GA12_PLApost_planComb_EC            = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_PLApost_planComb_EC            = rmfield(GA12_PLApost_planComb_EC ,'cfg');
GA12_KETpre_planComb_EC             = ft_freqgrandaverage(cfg, SUBJNRS3{:}); 
GA12_KETpre_planComb_EC             = rmfield(GA12_KETpre_planComb_EC ,'cfg');
GA12_KETpost_planComb_EC            = ft_freqgrandaverage(cfg, SUBJNRS4{:}); 
GA12_KETpost_planComb_EC            = rmfield(GA12_KETpost_planComb_EC ,'cfg');
GA12_PLAdiff_planComb_EC            = ft_freqgrandaverage(cfg, SUBJNRS5{:}); 
GA12_PLAdiff_planComb_EC            = rmfield(GA12_PLAdiff_planComb_EC ,'cfg');
GA12_KETdiff_planComb_EC            = ft_freqgrandaverage(cfg, SUBJNRS6{:}); 
GA12_KETdiff_planComb_EC            = rmfield(GA12_KETdiff_planComb_EC ,'cfg');

% for stats
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'yes';    
GA12subj_PLApre_planComb_EC             = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12subj_PLApre_planComb_EC             = rmfield(GA12subj_PLApre_planComb_EC ,'cfg');
GA12subj_PLApost_planComb_EC            = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12subj_PLApost_planComb_EC            = rmfield(GA12subj_PLApost_planComb_EC ,'cfg');
GA12subj_KETpre_planComb_EC             = ft_freqgrandaverage(cfg, SUBJNRS3{:}); 
GA12subj_KETpre_planComb_EC             = rmfield(GA12subj_KETpre_planComb_EC ,'cfg');
GA12subj_KETpost_planComb_EC            = ft_freqgrandaverage(cfg, SUBJNRS4{:}); 
GA12subj_KETpost_planComb_EC            = rmfield(GA12subj_KETpost_planComb_EC ,'cfg');
GA12subj_PLAdiff_planComb_EC            = ft_freqgrandaverage(cfg, SUBJNRS5{:}); 
GA12subj_PLAdiff_planComb_EC            = rmfield(GA12subj_PLAdiff_planComb_EC ,'cfg');
GA12subj_KETdiff_planComb_EC            = ft_freqgrandaverage(cfg, SUBJNRS6{:}); 
GA12subj_KETdiff_planComb_EC            = rmfield(GA12subj_KETdiff_planComb_EC ,'cfg');

save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_PLApre_planComb_FFT_EC GA12_PLApre_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12subj_PLApre_planComb_FFT_EC GA12subj_PLApre_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_PLApost_planComb_FFT_EC GA12_PLApost_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12subj_PLApost_planComb_FFT_EC GA12subj_PLApost_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_PLAdiff_planComb_FFT_EC GA12_PLAdiff_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12subj_PLAdiff_planComb_FFT_EC GA12subj_PLAdiff_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_KETpre_planComb_FFT_EC GA12_KETpre_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12subj_KETpre_planComb_FFT_EC GA12subj_KETpre_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_KETpost_planComb_FFT_EC GA12_KETpost_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12subj_KETpost_planComb_FFT_EC GA12subj_KETpost_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_KETdiff_planComb_FFT_EC GA12_KETdiff_planComb_EC
save E:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12subj_KETdiff_planComb_FFT_EC GA12subj_KETdiff_planComb_EC

clear all