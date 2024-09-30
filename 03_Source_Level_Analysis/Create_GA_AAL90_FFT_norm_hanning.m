%% EC
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
    load(['E:/PROJECTS/KETAMINE-RS\VIRTCHAN\FFT\hanning\', subjectdata.subjnr, '_data_AAL90_FFT_EC_PLApre_norm_dft2'])
    load(['E:/PROJECTS/KETAMINE-RS\VIRTCHAN\FFT\hanning\', subjectdata.subjnr, '_data_AAL90_FFT_EC_PLApost_norm_dft2'])
    load(['E:/PROJECTS/KETAMINE-RS\VIRTCHAN\FFT\hanning\', subjectdata.subjnr, '_data_AAL90_FFT_EC_KETpre_norm_dft2'])
    load(['E:/PROJECTS/KETAMINE-RS\VIRTCHAN\FFT\hanning\', subjectdata.subjnr, '_data_AAL90_FFT_EC_KETpost_norm_dft2'])
    
    PLAdiff_EC             = PLApost_EC;
    PLAdiff_EC.powspctrm   = PLApost_EC.powspctrm - PLApre_EC.powspctrm;
    KETdiff_EC             = KETpost_EC;
    KETdiff_EC.powspctrm   = KETpost_EC.powspctrm - KETpre_EC.powspctrm;
    
    % rename for each ind subj
    SUBJNRS1{j} = PLApre_EC;
    SUBJNRS2{j} = PLApost_EC;
    SUBJNRS3{j} = KETpre_EC;
    SUBJNRS4{j} = KETpost_EC;
    SUBJNRS5{j} = PLAdiff_EC;
    SUBJNRS6{j} = KETdiff_EC;
    j = j + 1;

end

%for plotting
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'no';    
GA12_PLApre_EC             = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_PLApre_EC             = rmfield(GA12_PLApre_EC ,'cfg');
GA12_PLApost_EC            = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_PLApost_EC            = rmfield(GA12_PLApost_EC ,'cfg');
GA12_KETpre_EC             = ft_freqgrandaverage(cfg, SUBJNRS3{:}); 
GA12_KETpre_EC             = rmfield(GA12_KETpre_EC ,'cfg');
GA12_KETpost_EC            = ft_freqgrandaverage(cfg, SUBJNRS4{:}); 
GA12_KETpost_EC            = rmfield(GA12_KETpost_EC ,'cfg');
GA12_PLAdiff_EC            = ft_freqgrandaverage(cfg, SUBJNRS5{:}); 
GA12_PLAdiff_EC            = rmfield(GA12_PLAdiff_EC ,'cfg');
GA12_KETdiff_EC            = ft_freqgrandaverage(cfg, SUBJNRS6{:}); 
GA12_KETdiff_EC            = rmfield(GA12_KETdiff_EC ,'cfg');

save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLApre_FFT_norm_dft2 GA12_PLApre_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLApost_FFT_norm_dft2 GA12_PLApost_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETpre_FFT_norm_dft2 GA12_KETpre_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETpost_FFT_norm_dft2 GA12_KETpost_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLAdiff_FFT_norm_dft2 GA12_PLAdiff_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETdiff_FFT_norm_dft2 GA12_KETdiff_EC

% for stats
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'yes';    
GA12_PLApresubj_EC             = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_PLApresubj_EC             = rmfield(GA12_PLApresubj_EC ,'cfg');
GA12_PLApostsubj_EC            = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_PLApostsubj_EC            = rmfield(GA12_PLApostsubj_EC ,'cfg');
GA12_KETpresubj_EC             = ft_freqgrandaverage(cfg, SUBJNRS3{:}); 
GA12_KETpresubj_EC             = rmfield(GA12_KETpresubj_EC ,'cfg');
GA12_KETpostsubj_EC            = ft_freqgrandaverage(cfg, SUBJNRS4{:}); 
GA12_KETpostsubj_EC            = rmfield(GA12_KETpostsubj_EC ,'cfg');
GA12_PLAdiffsubj_EC            = ft_freqgrandaverage(cfg, SUBJNRS5{:}); 
GA12_PLAdiffsubj_EC            = rmfield(GA12_PLAdiffsubj_EC ,'cfg');
GA12_KETdiffsubj_EC            = ft_freqgrandaverage(cfg, SUBJNRS6{:}); 
GA12_KETdiffsubj_EC            = rmfield(GA12_KETdiffsubj_EC ,'cfg');

save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLApresubj_FFT_norm_dft2 GA12_PLApresubj_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLApostsubj_FFT_norm_dft2 GA12_PLApostsubj_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETpresubj_FFT_norm_dft2 GA12_KETpresubj_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETpostsubj_FFT_norm_dft2 GA12_KETpostsubj_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_PLAdiffsubj_FFT_norm_dft2 GA12_PLAdiffsubj_EC
save E:/PROJECTS/KETAMINE-RS\GRANDAVG\hanning\GA12_AAL90_EC_KETdiffsubj_FFT_norm_dft2 GA12_KETdiffsubj_EC
clear all
