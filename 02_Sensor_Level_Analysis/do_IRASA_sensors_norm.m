function do_IRASA_sensors_norm(Subjectm)

eval(Subjectm); % eval('Subject08')

%% EC
%% IRASA-PLApre: orig, frac, and osci

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApre_fastICAcleaned_dft2']);
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
PLApre_fastICAcleaned.grad = grad;

% normalize data
data_norm   = PLApre_fastICAcleaned; % trials x chan x time
for i = 1:size(PLApre_fastICAcleaned.trial,2) % trials
    for j = 1:size(PLApre_fastICAcleaned.label,1) % channels
        minVal              = min(PLApre_fastICAcleaned.trial{i}(j,:));
        maxVal              = max(PLApre_fastICAcleaned.trial{i}(j,:));
        data_norm.trial{i}(j,:) = -1 + 2*(PLApre_fastICAcleaned.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% prepare neighbours
cfg_neighb           = [];
cfg_neighb.layout    = 'CTF275.lay';
cfg_neighb.method    = 'distance';
neighbours           = ft_prepare_neighbours(cfg_neighb, data_norm);

% create planar data
cfg                 = [];
cfg.planarmethod    = 'sincos';
cfg.neighbours      = neighbours; 
planar              = ft_megplanar(cfg, data_norm);

% Recombine megplanar --> original config
cfg                 = [];
planComb            = ft_combineplanar(cfg, planar);
clear PLApre_fastICAcleaned data_norm planar

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 2;
cfg.tapsmofrq   = 1;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
PLApre_frac     = ft_freqanalysis(cfg, planComb);
cfg.output      = 'original';
PLApre_orig     = ft_freqanalysis(cfg, planComb);
clear planComb

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
PLApre_osci     = ft_math(cfg, PLApre_frac, PLApre_orig);

% save IRASA data
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApre_frac_planComb_dft2'], 'PLApre_frac', '-V7.3')
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApre_osci_planComb_dft2'], 'PLApre_osci', '-V7.3')
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApre_orig_planComb_dft2'], 'PLApre_orig', '-V7.3')
clearvars -except subjectdata

%% IRASA-PLApost: orig, frac, and osci

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApost_fastICAcleaned_dft2']);
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
PLApost_fastICAcleaned.grad = grad;

% normalize data
data_norm   = PLApost_fastICAcleaned; % trials x chan x time
for i = 1:size(PLApost_fastICAcleaned.trial,2) % trials
    for j = 1:size(PLApost_fastICAcleaned.label,1) % channels
        minVal              = min(PLApost_fastICAcleaned.trial{i}(j,:));
        maxVal              = max(PLApost_fastICAcleaned.trial{i}(j,:));
        data_norm.trial{i}(j,:) = -1 + 2*(PLApost_fastICAcleaned.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% prepare neighbours
cfg_neighb           = [];
cfg_neighb.layout    = 'CTF275.lay';
cfg_neighb.method    = 'distance';
neighbours           = ft_prepare_neighbours(cfg_neighb, data_norm);

% create planar data
cfg                 = [];
cfg.planarmethod    = 'sincos';
cfg.neighbours      = neighbours; 
planar              = ft_megplanar(cfg, data_norm);

% Recombine megplanar --> original config
cfg                 = [];
planComb            = ft_combineplanar(cfg, planar);
clear PLApost_fastICAcleaned data_norm planar

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 2;
cfg.tapsmofrq   = 1;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
PLApost_frac    = ft_freqanalysis(cfg, planComb);
cfg.output      = 'original';
PLApost_orig    = ft_freqanalysis(cfg, planComb);
clear planComb

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
PLApost_osci    = ft_math(cfg, PLApost_frac, PLApost_orig);

% save IRASA data
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApost_frac_planComb_dft2'], 'PLApost_frac', '-V7.3')
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApost_osci_planComb_dft2'], 'PLApost_osci', '-V7.3')
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_PLApost_orig_planComb_dft2'], 'PLApost_orig', '-V7.3')
clearvars -except subjectdata

%% IRASA-KETpre: orig, frac, and osci

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpre_fastICAcleaned_dft2']);
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
KETpre_fastICAcleaned.grad = grad;

% normalize data
data_norm   = KETpre_fastICAcleaned; % trials x chan x time
for i = 1:size(KETpre_fastICAcleaned.trial,2) % trials
    for j = 1:size(KETpre_fastICAcleaned.label,1) % channels
        minVal              = min(KETpre_fastICAcleaned.trial{i}(j,:));
        maxVal              = max(KETpre_fastICAcleaned.trial{i}(j,:));
        data_norm.trial{i}(j,:) = -1 + 2*(KETpre_fastICAcleaned.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% prepare neighbours
cfg_neighb           = [];
cfg_neighb.layout    = 'CTF275.lay';
cfg_neighb.method    = 'distance';
neighbours           = ft_prepare_neighbours(cfg_neighb, data_norm);

% create planar data
cfg                 = [];
cfg.planarmethod    = 'sincos';
cfg.neighbours      = neighbours; 
planar              = ft_megplanar(cfg, data_norm);

% Recombine megplanar --> original config
cfg                 = [];
planComb            = ft_combineplanar(cfg, planar);
clear KETpre_fastICAcleaned data_norm planar

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 2;
cfg.tapsmofrq   = 1;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
KETpre_frac     = ft_freqanalysis(cfg, planComb);
cfg.output      = 'original';
KETpre_orig     = ft_freqanalysis(cfg, planComb);
clear planComb

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
KETpre_osci     = ft_math(cfg, KETpre_frac, KETpre_orig);

% save IRASA data
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpre_frac_planComb_dft2'], 'KETpre_frac', '-V7.3')
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpre_osci_planComb_dft2'], 'KETpre_osci', '-V7.3')
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpre_orig_planComb_dft2'], 'KETpre_orig', '-V7.3')
clearvars -except subjectdata

%% IRASA-KETpost: orig, frac, and osci

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpost_fastICAcleaned_dft2']);
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
KETpost_fastICAcleaned.grad = grad;

% normalize data
data_norm   = KETpost_fastICAcleaned; % trials x chan x time
for i = 1:size(KETpost_fastICAcleaned.trial,2) % trials
    for j = 1:size(KETpost_fastICAcleaned.label,1) % channels
        minVal              = min(KETpost_fastICAcleaned.trial{i}(j,:));
        maxVal              = max(KETpost_fastICAcleaned.trial{i}(j,:));
        data_norm.trial{i}(j,:) = -1 + 2*(KETpost_fastICAcleaned.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% prepare neighbours
cfg_neighb           = [];
cfg_neighb.layout    = 'CTF275.lay';
cfg_neighb.method    = 'distance';
neighbours           = ft_prepare_neighbours(cfg_neighb, data_norm);

% create planar data
cfg                 = [];
cfg.planarmethod    = 'sincos';
cfg.neighbours      = neighbours; 
planar              = ft_megplanar(cfg, data_norm);

% Recombine megplanar --> original config
cfg                 = [];
planComb            = ft_combineplanar(cfg, planar);
clear KETpost_fastICAcleaned data_norm planar

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 2;
cfg.tapsmofrq   = 1;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
KETpost_frac    = ft_freqanalysis(cfg, planComb);
cfg.output      = 'original';
KETpost_orig    = ft_freqanalysis(cfg, planComb);
clear planComb

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
KETpost_osci    = ft_math(cfg, KETpost_frac, KETpost_orig);

% save IRASA data
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpost_frac_planComb_dft2'], 'KETpost_frac', '-V7.3')
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpost_osci_planComb_dft2'], 'KETpost_osci', '-V7.3')
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\IRASA\', subjectdata.subjnr, '_EC_KETpost_orig_planComb_dft2'], 'KETpost_orig', '-V7.3')
clear


end
