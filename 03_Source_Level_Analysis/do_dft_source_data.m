function do_dft_source_data(Subjectm)

%% bandstop filter 50Hz line noise

eval(Subjectm); % eval('Subject02')



% PLApre EC
eval(['load .\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_PLApre']);

cfg                        = [];
cfg.dftfilter               = 'yes';
%cfg.dftfreq                 = [49:51];
cfg.padding                 = 10;
%cfg.dftreplace              = 'neighbour';
AAL90_EC_PLApre            = ft_preprocessing(cfg, AAL90_EC_PLApre);

save(['.\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_PLApre_dft2'], 'AAL90_EC_PLApre', '-V7.3')

clearvars -except subjectdata

% PLApost EC
eval(['load .\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_PLApost']);

cfg                        = [];
cfg.dftfilter               = 'yes';
%cfg.dftfreq                 = [49:51];
cfg.padding                 = 10;
%cfg.dftreplace              = 'neighbour';
AAL90_EC_PLApost           = ft_preprocessing(cfg, AAL90_EC_PLApost);

save(['.\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_PLApost_dft2'], 'AAL90_EC_PLApost', '-V7.3')

clearvars -except subjectdata

% KETpre EC
eval(['load .\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_KETpre']);

cfg                        = [];
cfg.dftfilter               = 'yes';
%cfg.dftfreq                 = [49:51];
cfg.padding                 = 10;
%cfg.dftreplace              = 'neighbour';
AAL90_EC_KETpre            = ft_preprocessing(cfg, AAL90_EC_KETpre);

save(['.\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_KETpre_dft2'], 'AAL90_EC_KETpre', '-V7.3')

clearvars -except subjectdata

% KETpost EC
eval(['load .\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_KETpost']);

cfg                        = [];
cfg.dftfilter               = 'yes';
%cfg.dftfreq                 = [49:51];
cfg.padding                 = 10;
%cfg.dftreplace              = 'neighbour';
AAL90_EC_KETpost           = ft_preprocessing(cfg, AAL90_EC_KETpost);

save(['.\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_KETpost_dft2'], 'AAL90_EC_KETpost', '-V7.3')

clearvars -except subjectdata