function do_FFTanalysis_norm(Subjectm)

eval(Subjectm); % eval('Subject02')


%% EC
%% PLACEBO: pre
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApre_fastICAcleaned_dft2']);
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
PLApre_fastICAcleaned.grad = grad;

% normalize data
data_norm   = PLApre_fastICAcleaned; % trials x chan x time
for i = 1:size(PLApre_fastICAcleaned.trial,2) % trials
    for j = 1:size(PLApre_fastICAcleaned.label,1) % channels
        minVal              = min(PLApre_fastICAcleaned.trial{i}(j,:));
        maxVal              = max(PLApre_fastICAcleaned.trial{i}(j,:));
        data_norm.trial{i}(j,:) = (PLApre_fastICAcleaned.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% prepare neighbours
cfg_neighb           = [];
cfg_neighb.layout    = 'CTF275.lay';
cfg_neighb.method    = 'distance';
neighbours           = ft_prepare_neighbours(cfg_neighb, data_norm);

% create planar data
cfg                     = [];
cfg.planarmethod        = 'sincos';
cfg.neighbours          = neighbours; 
planar                  = ft_megplanar(cfg, data_norm);
clear PLApre_fastICAcleaned data_norm
    
% FFT analyses
cfg                     = [];
cfg.channel             = 'MEG';
cfg.output              = 'pow';
cfg.method              = 'mtmfft'; 
cfg.foi                 = 0:1:90;
cfg.t_ftimwin           = 3./cfg.foi; % 3 cycles per time window
cfg.taper               = 'hanning'; 
cfg.tapsmofrq           = 1;
cfg.pad                 = 4; 
freq_planar             = ft_freqanalysis(cfg, planar) ;

% Recombine megplanar --> original config
cfg                     = [];
PLApre_planComb_EC         = ft_combineplanar(cfg, freq_planar) ;
         
% save planardata
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\FFT\', subjectdata.subjnr, '_EC_PLApre_planComb_norm_dft2'], 'PLApre_planComb_EC', '-V7.3')
clearvars -except subjectdata

%% PLACEBO: post
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApost_fastICAcleaned_dft2']);
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);
PLApost_fastICAcleaned.grad = grad;

% normalize data
data_norm   = PLApost_fastICAcleaned; % trials x chan x time
for i = 1:size(PLApost_fastICAcleaned.trial,2) % trials
    for j = 1:size(PLApost_fastICAcleaned.label,1) % channels
        minVal              = min(PLApost_fastICAcleaned.trial{i}(j,:));
        maxVal              = max(PLApost_fastICAcleaned.trial{i}(j,:));
        data_norm.trial{i}(j,:) = (PLApost_fastICAcleaned.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% prepare neighbours
cfg_neighb           = [];
cfg_neighb.layout    = 'CTF275.lay';
cfg_neighb.method    = 'distance';
neighbours           = ft_prepare_neighbours(cfg_neighb, data_norm);

% create planar data
cfg                     = [];
cfg.planarmethod        = 'sincos';
cfg.neighbours          = neighbours; 
planar                  = ft_megplanar(cfg, data_norm);
clear PLApost_fastICAcleaned data_norm
    
% FFT analyses
cfg                     = [];
cfg.channel             = 'MEG';
cfg.output              = 'pow';
cfg.method              = 'mtmfft'; 
cfg.foi                 = 0:1:90;
cfg.t_ftimwin           = 3./cfg.foi; % 3 cycles per time window
cfg.taper               = 'hanning'; 
cfg.tapsmofrq           = 1;
cfg.pad                 = 4; 
freq_planar             = ft_freqanalysis(cfg, planar) ;

% Recombine megplanar --> original config
cfg                     = [];
PLApost_planComb_EC         = ft_combineplanar(cfg, freq_planar) ;
         
% save planardata
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\FFT\', subjectdata.subjnr, '_EC_PLApost_planComb_norm_dft2'], 'PLApost_planComb_EC', '-V7.3')
clearvars -except subjectdata

%% KETAMINE: pre
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpre_fastICAcleaned_dft2']);
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
KETpre_fastICAcleaned.grad = grad;

% normalize data
data_norm   = KETpre_fastICAcleaned; % trials x chan x time
for i = 1:size(KETpre_fastICAcleaned.trial,2) % trials
    for j = 1:size(KETpre_fastICAcleaned.label,1) % channels
        minVal              = min(KETpre_fastICAcleaned.trial{i}(j,:));
        maxVal              = max(KETpre_fastICAcleaned.trial{i}(j,:));
        data_norm.trial{i}(j,:) = (KETpre_fastICAcleaned.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% prepare neighbours
cfg_neighb           = [];
cfg_neighb.layout    = 'CTF275.lay';
cfg_neighb.method    = 'distance';
neighbours           = ft_prepare_neighbours(cfg_neighb, data_norm);

% create planar data
cfg                     = [];
cfg.planarmethod        = 'sincos';
cfg.neighbours          = neighbours; 
planar                  = ft_megplanar(cfg, data_norm);
clear KETpre_fastICAcleaned data_norm
    
% FFT analyses
cfg                     = [];
cfg.channel             = 'MEG';
cfg.output              = 'pow';
cfg.method              = 'mtmfft'; 
cfg.foi                 = 0:1:90;
cfg.t_ftimwin           = 3./cfg.foi; % 3 cycles per time window
cfg.taper               = 'hanning'; 
cfg.tapsmofrq           = 1;
cfg.pad                 = 4; 
freq_planar             = ft_freqanalysis(cfg, planar) ;

% Recombine megplanar --> original config
cfg                     = [];
KETpre_planComb_EC         = ft_combineplanar(cfg, freq_planar) ;
         
% save planardata
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\FFT\', subjectdata.subjnr, '_EC_KETpre_planComb_norm_dft2'], 'KETpre_planComb_EC', '-V7.3')
clearvars -except subjectdata

%% KETAMINE: post
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpost_fastICAcleaned_dft2']);
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);
KETpost_fastICAcleaned.grad = grad;

% normalize data
data_norm   = KETpost_fastICAcleaned; % trials x chan x time
for i = 1:size(KETpost_fastICAcleaned.trial,2) % trials
    for j = 1:size(KETpost_fastICAcleaned.label,1) % channels
        minVal              = min(KETpost_fastICAcleaned.trial{i}(j,:));
        maxVal              = max(KETpost_fastICAcleaned.trial{i}(j,:));
        data_norm.trial{i}(j,:) = (KETpost_fastICAcleaned.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% prepare neighbours
cfg_neighb           = [];
cfg_neighb.layout    = 'CTF275.lay';
cfg_neighb.method    = 'distance';
neighbours           = ft_prepare_neighbours(cfg_neighb, data_norm);

% create planar data
cfg                     = [];
cfg.planarmethod        = 'sincos';
cfg.neighbours          = neighbours; 
planar                  = ft_megplanar(cfg, data_norm);
clear KETpost_fastICAcleaned data_norm
    
% FFT analyses
cfg                     = [];
cfg.channel             = 'MEG';
cfg.output              = 'pow';
cfg.method              = 'mtmfft'; 
cfg.foi                 = 0:1:90;
cfg.t_ftimwin           = 3./cfg.foi; % 3 cycles per time window
cfg.taper               = 'hanning'; 
cfg.tapsmofrq           = 1;
cfg.pad                 = 4; 
freq_planar             = ft_freqanalysis(cfg, planar) ;

% Recombine megplanar --> original config
cfg                     = [];
KETpost_planComb_EC     = ft_combineplanar(cfg, freq_planar) ;
         
% save planardata
save(['E:\PROJECTS\KETAMINE-RS\SENSORDATA\FFT\', subjectdata.subjnr, '_EC_KETpost_planComb_norm_dft2'], 'KETpost_planComb_EC', '-V7.3')
clearvars all
end