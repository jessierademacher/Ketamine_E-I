function do_dft_sensor_data(Subjectm)

%% bandstop filter 50Hz line noise



% PLApre EC
eval(['load D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr filesep subjectdata.subjnr '_EC_PLApre_fastICAcleaned'])


cfg                        = [];
cfg.dftfilter               = 'yes';
%cfg.dftfreq                 = [49:51]; % default is 50
cfg.padding                 = 10;
PLApre_fastICAcleaned            = ft_preprocessing(cfg, PLApre_fastICAcleaned);

save(['D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr '\' subjectdata.subjnr '_EC_PLApre_fastICAcleaned_dft2'], 'PLApre_fastICAcleaned', '-V7.3')

clearvars -except subjectdata

% PLApost EC
eval(['load D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr filesep subjectdata.subjnr '_EC_PLApost_fastICAcleaned'])


cfg                        = [];
cfg.dftfilter               = 'yes';
%cfg.dftfreq                 = [49:51]; % default is 50
cfg.padding                 = 10;
PLApost_fastICAcleaned            = ft_preprocessing(cfg, PLApost_fastICAcleaned);

save(['D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr '\' subjectdata.subjnr '_EC_PLApost_fastICAcleaned_dft2'], 'PLApost_fastICAcleaned', '-V7.3')


clearvars -except subjectdata

% KETpre EC
eval(['load D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr filesep subjectdata.subjnr '_EC_KETpre_fastICAcleaned'])


cfg                        = [];
cfg.dftfilter               = 'yes';
%cfg.dftfreq                 = [49:51]; % default is 50
cfg.padding                 = 10;
KETpre_fastICAcleaned            = ft_preprocessing(cfg, KETpre_fastICAcleaned);

save(['D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr '\' subjectdata.subjnr '_EC_KETpre_fastICAcleaned_dft2'], 'KETpre_fastICAcleaned', '-V7.3')


clearvars -except subjectdata

% KETpost EC
eval(['load D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr filesep subjectdata.subjnr '_EC_KETpost_fastICAcleaned'])


cfg                        = [];
cfg.dftfilter               = 'yes';
%cfg.dftfreq                 = [49:51]; % default is 50
cfg.padding                 = 10;
KETpost_fastICAcleaned            = ft_preprocessing(cfg, KETpost_fastICAcleaned);

save(['D:\PROJECTS\KETAMINE-RS\ANALYSES\' subjectdata.subjnr '\' subjectdata.subjnr '_EC_KETpost_fastICAcleaned_dft2'], 'KETpost_fastICAcleaned', '-V7.3')

clear