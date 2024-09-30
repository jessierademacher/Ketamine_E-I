

%% EC


%% 1) IRASA-PLApreF:\PROJECTS\KETAMINE-RS

clear

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
    
    % IRASA aperiodic and periodic data
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApre_frac_planComb_dft2']) % PLApre_frac
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApre_osci_planComb_dft2']) % PLApre_osci

    PLApre_frac = rmfield(PLApre_frac,'cfg');
    PLApre_osci = rmfield(PLApre_osci,'cfg');
    
    % rename for each ind subj
    SUBJNRS1{j} = PLApre_frac;
    SUBJNRS2{j} = PLApre_osci;
    j = j + 1;
    clear PLApre_frac PLApre_osci
    
end

% for plotting
cfg                                    = [];
cfg.keepindividual                     = 'no';
PLApre_frac_planComb_EC                   = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
PLApre_frac_planComb_EC.cfg.previous      = [];
PLApre_osci_planComb_EC                   = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
PLApre_osci_planComb_EC.cfg.previous      = [];

% for stats
cfg                                    = [];
cfg.keepindividual                     = 'yes';
PLApresubj_frac_planComb_EC               = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
PLApresubj_frac_planComb_EC.cfg.previous  = [];
PLApresubj_osci_planComb_EC               = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
PLApresubj_osci_planComb_EC.cfg.previous  = [];

save .\GRANDAVG\PLApre_frac_planComb_EC PLApre_frac_planComb_EC
save .\GRANDAVG\PLApre_osci_planComb_EC PLApre_osci_planComb_EC
save .\GRANDAVG\PLApresubj_frac_planComb_EC PLApresubj_frac_planComb_EC
save .\GRANDAVG\PLApresubj_osci_planComb_EC PLApresubj_osci_planComb_EC
clear 

%% 2) IRASA-PLApost

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
    
    % IRASA aperiodic and periodic data
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApost_frac_planComb_dft2']) % PLApost_frac
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApost_osci_planComb_dft2']) % PLApost_osci

    PLApost_frac = rmfield(PLApost_frac,'cfg');
    PLApost_osci = rmfield(PLApost_osci,'cfg');
    
    % rename for each ind subj
    SUBJNRS1{j} = PLApost_frac;
    SUBJNRS2{j} = PLApost_osci;
    j = j + 1;
    clear PLApost_frac PLApost_osci
    
end

% for plotting
cfg                                    = [];
cfg.keepindividual                     = 'no';
PLApost_frac_planComb_EC                   = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
PLApost_frac_planComb_EC.cfg.previous      = [];
PLApost_osci_planComb_EC                   = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
PLApost_osci_planComb_EC.cfg.previous      = [];

% for stats
cfg                                    = [];
cfg.keepindividual                     = 'yes';
PLApostsubj_frac_planComb_EC               = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
PLApostsubj_frac_planComb_EC.cfg.previous  = [];
PLApostsubj_osci_planComb_EC               = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
PLApostsubj_osci_planComb_EC.cfg.previous  = [];

save .\GRANDAVG\PLApost_frac_planComb_EC PLApost_frac_planComb_EC
save .\GRANDAVG\PLApost_osci_planComb_EC PLApost_osci_planComb_EC
save .\GRANDAVG\PLApostsubj_frac_planComb_EC PLApostsubj_frac_planComb_EC
save .\GRANDAVG\PLApostsubj_osci_planComb_EC PLApostsubj_osci_planComb_EC
clear 

%% 3) IRASA-KETpre

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
    
    % IRASA aperiodic and periodic data
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpre_frac_planComb_dft2']) % KETpre_frac
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpre_osci_planComb_dft2']) % KETpre_osci

    KETpre_frac = rmfield(KETpre_frac,'cfg');
    KETpre_osci = rmfield(KETpre_osci,'cfg');
    
    % rename for each ind subj
    SUBJNRS1{j} = KETpre_frac;
    SUBJNRS2{j} = KETpre_osci;
    j = j + 1;
    clear KETpre_frac KETpre_osci
    
end

% for plotting
cfg                                    = [];
cfg.keepindividual                     = 'no';
KETpre_frac_planComb_EC                   = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
KETpre_frac_planComb_EC.cfg.previous      = [];
KETpre_osci_planComb_EC                   = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
KETpre_osci_planComb_EC.cfg.previous      = [];

% for stats
cfg                                    = [];
cfg.keepindividual                     = 'yes';
KETpresubj_frac_planComb_EC               = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
KETpresubj_frac_planComb_EC.cfg.previous  = [];
KETpresubj_osci_planComb_EC               = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
KETpresubj_osci_planComb_EC.cfg.previous  = [];

save .\GRANDAVG\KETpre_frac_planComb_EC KETpre_frac_planComb_EC
save .\GRANDAVG\KETpre_osci_planComb_EC KETpre_osci_planComb_EC
save .\GRANDAVG\KETpresubj_frac_planComb_EC KETpresubj_frac_planComb_EC
save .\GRANDAVG\KETpresubj_osci_planComb_EC KETpresubj_osci_planComb_EC
clear 

%% 4) IRASA-KETpost

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
    
    % IRASA aperiodic and periodic data
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpost_frac_planComb_dft2']) % KETpost_frac
    load(['.\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpost_osci_planComb_dft2']) % KETpost_osci

    KETpost_frac = rmfield(KETpost_frac,'cfg');
    KETpost_osci = rmfield(KETpost_osci,'cfg');
    
    % rename for each ind subj
    SUBJNRS1{j} = KETpost_frac;
    SUBJNRS2{j} = KETpost_osci;
    j = j + 1;
    clear KETpost_frac KETpost_osci
    
end

% for plotting
cfg                                    = [];
cfg.keepindividual                     = 'no';
KETpost_frac_planComb_EC                   = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
KETpost_frac_planComb_EC.cfg.previous      = [];
KETpost_osci_planComb_EC                   = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
KETpost_osci_planComb_EC.cfg.previous      = [];

% for stats
cfg                                    = [];
cfg.keepindividual                     = 'yes';
KETpostsubj_frac_planComb_EC               = ft_freqgrandaverage(cfg, SUBJNRS1{:}); 
KETpostsubj_frac_planComb_EC.cfg.previous  = [];
KETpostsubj_osci_planComb_EC               = ft_freqgrandaverage(cfg, SUBJNRS2{:}); 
KETpostsubj_osci_planComb_EC.cfg.previous  = [];

save .\GRANDAVG\KETpost_frac_planComb_EC KETpost_frac_planComb_EC
save .\GRANDAVG\KETpost_osci_planComb_EC KETpost_osci_planComb_EC
save .\GRANDAVG\KETpostsubj_frac_planComb_EC KETpostsubj_frac_planComb_EC
save .\GRANDAVG\KETpostsubj_osci_planComb_EC KETpostsubj_osci_planComb_EC
clear 


