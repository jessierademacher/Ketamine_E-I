function do_AAL90_IRASA(Subjectm)

eval(Subjectm); % eval('Subject02')



%% EC
%% IRASA-PLApre: orig, frac, and osci

eval(['load .\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_PLApre_dft2']);

AAL90_EC_PLApre_norm = AAL90_EC_PLApre; % trials x chan x time
for i = 1:size(AAL90_EC_PLApre.trial,2) % trials
    for j = 1:size(AAL90_EC_PLApre.label,1) % channels
        minVal              = nanmin(AAL90_EC_PLApre.trial{i}(j,:));
        maxVal              = nanmax(AAL90_EC_PLApre.trial{i}(j,:));
        AAL90_EC_PLApre_norm.trial{i}(j,:)  = -1 + 2*(AAL90_EC_PLApre.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% % remove mean, keep trials
% cfg                 = [];
% cfg.removemean      = 'yes';
% cfg.channel         = 'all';
% cfg.trials          = 'all';
% cfg.keeptrials      = 'yes';
% cfg.vartrllength    = 2;
% timelock            = ft_timelockanalysis(cfg, AAL90_EC_PLApre);
% clear AAL90_EC_PLApre

timelock = AAL90_EC_PLApre_norm;

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 4;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
PLApre_EC_frac     = ft_freqanalysis(cfg, timelock);
cfg.output      = 'original';
PLApre_EC_orig     = ft_freqanalysis(cfg, timelock);

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
PLApre_EC_osci     = ft_math(cfg, PLApre_EC_frac, PLApre_EC_orig);

% save IRASA data
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_frac_PLApre_norm_dft2'], 'PLApre_EC_frac', '-V7.3')
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_orig_PLApre_norm_dft2'], 'PLApre_EC_orig', '-V7.3')
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_osci_PLApre_norm_dft2'], 'PLApre_EC_osci', '-V7.3')
clearvars -except subjectdata

%% IRASA-PLApost: orig, frac, and osci

eval(['load .\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_PLApost_dft2']);

AAL90_EC_PLApost_norm = AAL90_EC_PLApost; % trials x chan x time
for i = 1:size(AAL90_EC_PLApost.trial,2) % trials
    for j = 1:size(AAL90_EC_PLApost.label,1) % channels
        minVal              = nanmin(AAL90_EC_PLApost.trial{i}(j,:));
        maxVal              = nanmax(AAL90_EC_PLApost.trial{i}(j,:));
        AAL90_EC_PLApost_norm.trial{i}(j,:)  = -1 + 2*(AAL90_EC_PLApost.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% % remove mean, keep trials
% cfg                 = [];
% cfg.removemean      = 'yes';
% cfg.channel         = 'all';
% cfg.trials          = 'all';
% cfg.keeptrials      = 'yes';
% cfg.vartrllength    = 2;
% timelock            = ft_timelockanalysis(cfg, AAL90_EC_PLApost);
% clear AAL90_EC_PLApost

timelock = AAL90_EC_PLApost_norm;

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 4;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
PLApost_EC_frac    = ft_freqanalysis(cfg, timelock);
cfg.output      = 'original';
PLApost_EC_orig    = ft_freqanalysis(cfg, timelock);

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
PLApost_EC_osci    = ft_math(cfg, PLApost_EC_frac, PLApost_EC_orig);

% save IRASA data
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_frac_PLApost_norm_dft2'], 'PLApost_EC_frac', '-V7.3')
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_orig_PLApost_norm_dft2'], 'PLApost_EC_orig', '-V7.3')
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_osci_PLApost_norm_dft2'], 'PLApost_EC_osci', '-V7.3')
clearvars -except subjectdata

%% IRASA-KETpre: orig, frac, and osci

eval(['load .\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_KETpre_dft2']);

AAL90_EC_KETpre_norm = AAL90_EC_KETpre; % trials x chan x time
for i = 1:size(AAL90_EC_KETpre.trial,2) % trials
    for j = 1:size(AAL90_EC_KETpre.label,1) % channels
        minVal              = nanmin(AAL90_EC_KETpre.trial{i}(j,:));
        maxVal              = nanmax(AAL90_EC_KETpre.trial{i}(j,:));
        AAL90_EC_KETpre_norm.trial{i}(j,:)  = -1 + 2*(AAL90_EC_KETpre.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% % remove mean, keep trials
% cfg                 = [];
% cfg.removemean      = 'yes';
% cfg.channel         = 'all';
% cfg.trials          = 'all';
% cfg.keeptrials      = 'yes';
% cfg.vartrllength    = 2;
% timelock            = ft_timelockanalysis(cfg, AAL90_EC_KETpre);
% clear AAL90_EC_KETpre

timelock = AAL90_EC_KETpre_norm;

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 4;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
KETpre_EC_frac     = ft_freqanalysis(cfg, timelock);
cfg.output      = 'original';
KETpre_EC_orig     = ft_freqanalysis(cfg, timelock);

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
KETpre_EC_osci     = ft_math(cfg, KETpre_EC_frac, KETpre_EC_orig);

% save IRASA data
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_frac_KETpre_norm_dft2'], 'KETpre_EC_frac', '-V7.3')
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_orig_KETpre_norm_dft2'], 'KETpre_EC_orig', '-V7.3')
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_osci_KETpre_norm_dft2'], 'KETpre_EC_osci', '-V7.3')
clearvars -except subjectdata

%% IRASA-KETpost: orig, frac, and osci

eval(['load .\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_KETpost_dft2']);

AAL90_EC_KETpost_norm = AAL90_EC_KETpost; % trials x chan x time
for i = 1:size(AAL90_EC_KETpost.trial,2) % trials
    for j = 1:size(AAL90_EC_KETpost.label,1) % channels
        minVal              = nanmin(AAL90_EC_KETpost.trial{i}(j,:));
        maxVal              = nanmax(AAL90_EC_KETpost.trial{i}(j,:));
        AAL90_EC_KETpost_norm.trial{i}(j,:)  = -1 + 2*(AAL90_EC_KETpost.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end

% % remove mean, keep trials
% cfg                 = [];
% cfg.removemean      = 'yes';
% cfg.channel         = 'all';
% cfg.trials          = 'all';
% cfg.keeptrials      = 'yes';
% cfg.vartrllength    = 2;
% timelock            = ft_timelockanalysis(cfg, AAL90_EC_KETpost);
% clear AAL90_EC_KETpost

timelock = AAL90_EC_KETpost_norm;

% compute the fractal and original spectra
cfg             = [];
cfg.foilim      = [3 90];
cfg.pad         = 4;
cfg.method      = 'irasa';
cfg.output      = 'fractal';
KETpost_EC_frac    = ft_freqanalysis(cfg, timelock);
cfg.output      = 'original';
KETpost_EC_orig    = ft_freqanalysis(cfg, timelock);

% subtract the fractal component from the power spectrum
cfg             = [];
cfg.parameter   = 'powspctrm';
cfg.operation   = 'x2-x1';
KETpost_EC_osci    = ft_math(cfg, KETpost_EC_frac, KETpost_EC_orig);

% save IRASA data
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_frac_KETpost_norm_dft2'], 'KETpost_EC_frac', '-V7.3')
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_orig_KETpost_norm_dft2'], 'KETpost_EC_orig', '-V7.3')
save(['.\VIRTCHAN\IRASA\', subjectdata.subjnr, '_AAL90_EC_osci_KETpost_norm_dft2'], 'KETpost_EC_osci', '-V7.3')
clear all


end


