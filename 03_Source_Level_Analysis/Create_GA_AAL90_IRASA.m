%% EC


SUBJNRS1 = cell(12,1);
SUBJNRS2 = cell(12,1);
j = 1;
for ind = [2:8 10:14]
    
    
    subjectID = {'Subject01','Subject02','Subject03','Subject04','Subject05',...,
                 'Subject06','Subject07','Subject08','Subject09','Subject10',...
                 'Subject11','Subject12','Subject13','Subject14'};

    fprintf('dataset is %s\n',subjectID{ind}) 
    sName = subjectID{ind};
    eval(sName)
    
    % FRAC & OSCI
    eval(['load .\VIRTCHAN\IRASA\' subjectdata.subjnr '_AAL90_EC_frac_PLApre_norm_dft2']); % PLApre_frac
    eval(['load .\VIRTCHAN\IRASA\' subjectdata.subjnr '_AAL90_EC_osci_PLApre_norm_dft2']); % PLApre_osci
    
    % rename for each ind subj
    SUBJNRS1{j} = PLApre_EC_frac;
    SUBJNRS2{j} = PLApre_EC_osci;
    j = j + 1;

end

% for plotting
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'no';    
GA12_PLApre_frac_EC           = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_PLApre_frac_EC           = rmfield(GA12_PLApre_frac_EC,'cfg');
GA12_PLApre_osci_EC           = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_PLApre_osci_EC           = rmfield(GA12_PLApre_osci_EC,'cfg');

% for stats
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'yes';    
GA12_PLApresubj_frac_EC           = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_PLApresubj_frac_EC           = rmfield(GA12_PLApresubj_frac_EC,'cfg');
GA12_PLApresubj_osci_EC           = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_PLApresubj_osci_EC           = rmfield(GA12_PLApresubj_osci_EC,'cfg');

save .\GRANDAVG\GA12_AAL90_IRASA_PLApre_frac_EC_norm_dft2 GA12_PLApre_frac_EC
save .\GRANDAVG\GA12_AAL90_IRASA_PLApre_osci_EC_norm_dft2 GA12_PLApre_osci_EC
save .\GRANDAVG\GA12_AAL90_IRASA_PLApresubj_frac_EC_norm_dft2 GA12_PLApresubj_frac_EC
save .\GRANDAVG\GA12_AAL90_IRASA_PLApresubj_osci_EC_norm_dft2 GA12_PLApresubj_osci_EC
clear all

%% 2) PLACEBO post: 

SUBJNRS1 = cell(12,1);
SUBJNRS2 = cell(12,1);
j = 1;
for ind = [2:8 10:14]
    
    
    subjectID = {'Subject01','Subject02','Subject03','Subject04','Subject05',...,
                 'Subject06','Subject07','Subject08','Subject09','Subject10',...
                 'Subject11','Subject12','Subject13','Subject14'};

    fprintf('dataset is %s\n',subjectID{ind}) 
    sName = subjectID{ind};
    eval(sName)
    
    % FRAC & OSCI
    eval(['load .\VIRTCHAN\IRASA\' subjectdata.subjnr '_AAL90_EC_frac_PLApost_norm_dft2']); % PLApost_frac
    eval(['load .\VIRTCHAN\IRASA\' subjectdata.subjnr '_AAL90_EC_osci_PLApost_norm_dft2']); % PLApost_osci
    
    % rename for each ind subj
    SUBJNRS1{j} = PLApost_EC_frac;
    SUBJNRS2{j} = PLApost_EC_osci;
    j = j + 1;

end

% for plotting
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'no';    
GA12_PLApost_frac_EC          = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_PLApost_frac_EC          = rmfield(GA12_PLApost_frac_EC,'cfg');
GA12_PLApost_osci_EC          = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_PLApost_osci_EC          = rmfield(GA12_PLApost_osci_EC,'cfg');

% for stats
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'yes';    
GA12_PLApostsubj_frac_EC           = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_PLApostsubj_frac_EC           = rmfield(GA12_PLApostsubj_frac_EC,'cfg');
GA12_PLApostsubj_osci_EC           = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_PLApostsubj_osci_EC           = rmfield(GA12_PLApostsubj_osci_EC,'cfg');


save .\GRANDAVG\GA12_AAL90_IRASA_PLApost_frac_EC_norm_dft2 GA12_PLApost_frac_EC
save .\GRANDAVG\GA12_AAL90_IRASA_PLApost_osci_EC_norm_dft2 GA12_PLApost_osci_EC
save .\GRANDAVG\GA12_AAL90_IRASA_PLApostsubj_frac_EC_norm_dft2 GA12_PLApostsubj_frac_EC
save .\GRANDAVG\GA12_AAL90_IRASA_PLApostsubj_osci_EC_norm_dft2 GA12_PLApostsubj_osci_EC
clear all

%% 3) KETAMINE pre: 

SUBJNRS1 = cell(12,1);
SUBJNRS2 = cell(12,1);
j = 1;
for ind = [2:8 10:14]
    
    
    subjectID = {'Subject01','Subject02','Subject03','Subject04','Subject05',...,
                 'Subject06','Subject07','Subject08','Subject09','Subject10',...
                 'Subject11','Subject12','Subject13','Subject14'};

    fprintf('dataset is %s\n',subjectID{ind}) 
    sName = subjectID{ind};
    eval(sName)
    
    % FRAC & OSCI
    eval(['load .\VIRTCHAN\IRASA\' subjectdata.subjnr '_AAL90_EC_frac_KETpre_norm_dft2']); % KETpre_frac
    eval(['load .\VIRTCHAN\IRASA\' subjectdata.subjnr '_AAL90_EC_osci_KETpre_norm_dft2']); % KETpre_osci
    
    % rename for each ind subj
    SUBJNRS1{j} = KETpre_EC_frac;
    SUBJNRS2{j} = KETpre_EC_osci;
    j = j + 1;

end

% for plotting
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'no';    
GA12_KETpre_frac_EC           = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_KETpre_frac_EC           = rmfield(GA12_KETpre_frac_EC,'cfg');
GA12_KETpre_osci_EC           = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_KETpre_osci_EC           = rmfield(GA12_KETpre_osci_EC,'cfg');

% for stats
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'yes';    
GA12_KETpresubj_frac_EC           = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_KETpresubj_frac_EC           = rmfield(GA12_KETpresubj_frac_EC,'cfg');
GA12_KETpresubj_osci_EC           = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_KETpresubj_osci_EC           = rmfield(GA12_KETpresubj_osci_EC,'cfg');

save .\GRANDAVG\GA12_AAL90_IRASA_KETpre_frac_EC_norm_dft2 GA12_KETpre_frac_EC
save .\GRANDAVG\GA12_AAL90_IRASA_KETpre_osci_EC_norm_dft2 GA12_KETpre_osci_EC
save .\GRANDAVG\GA12_AAL90_IRASA_KETpresubj_frac_EC_norm_dft2 GA12_KETpresubj_frac_EC
save .\GRANDAVG\GA12_AAL90_IRASA_KETpresubj_osci_EC_norm_dft2 GA12_KETpresubj_osci_EC
clear all

%% 4) KETAMINE post: 

SUBJNRS1 = cell(12,1);
SUBJNRS2 = cell(12,1);
j = 1;
for ind = [2:8 10:14]
    
    
    subjectID = {'Subject01','Subject02','Subject03','Subject04','Subject05',...,
                 'Subject06','Subject07','Subject08','Subject09','Subject10',...
                 'Subject11','Subject12','Subject13','Subject14'};

    fprintf('dataset is %s\n',subjectID{ind}) 
    sName = subjectID{ind};
    eval(sName)
    
    % FRAC & OSCI
    eval(['load .\VIRTCHAN\IRASA\' subjectdata.subjnr '_AAL90_EC_frac_KETpost_norm_dft2']); % KETpost_frac
    eval(['load .\VIRTCHAN\IRASA\' subjectdata.subjnr '_AAL90_EC_osci_KETpost_norm_dft2']); % KETpost_osci
    
    % rename for each ind subj
    SUBJNRS1{j} = KETpost_EC_frac;
    SUBJNRS2{j} = KETpost_EC_osci;
    j = j + 1;

end

% for plotting
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'no';    
GA12_KETpost_frac_EC          = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_KETpost_frac_EC          = rmfield(GA12_KETpost_frac_EC,'cfg');
GA12_KETpost_osci_EC          = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_KETpost_osci_EC          = rmfield(GA12_KETpost_osci_EC,'cfg');

% for stats
cfg                        = [];
cfg.parameter              = 'powspctrm';
cfg.keepindividual         = 'yes';    
GA12_KETpostsubj_frac_EC          = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
GA12_KETpostsubj_frac_EC          = rmfield(GA12_KETpostsubj_frac_EC,'cfg');
GA12_KETpostsubj_osci_EC          = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
GA12_KETpostsubj_osci_EC          = rmfield(GA12_KETpostsubj_osci_EC,'cfg');

save .\GRANDAVG\GA12_AAL90_IRASA_KETpost_frac_EC_norm_dft2 GA12_KETpost_frac_EC
save .\GRANDAVG\GA12_AAL90_IRASA_KETpost_osci_EC_norm_dft2 GA12_KETpost_osci_EC
save .\GRANDAVG\GA12_AAL90_IRASA_KETpostsubj_frac_EC_norm_dft2 GA12_KETpostsubj_frac_EC
save .\GRANDAVG\GA12_AAL90_IRASA_KETpostsubj_osci_EC_norm_dft2 GA12_KETpostsubj_osci_EC
clear all

