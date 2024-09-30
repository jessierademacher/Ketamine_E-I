function do_fastICA_EC(Subjectm)

eval(Subjectm); % eval('Subject14')

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_data_preICA']);

%% separate sessions
% trialinfo for each cond: PLApre=0, PLApost=1, KETpre=2, KETpost=3 

cfg                     = [];
cfg.trials              = [data_preICA.trialinfo == 0 | data_preICA.trialinfo == 1];
PLA_data_preICA         = ft_selectdata(cfg, data_preICA);

cfg                     = [];
cfg.trials              = [data_preICA.trialinfo == 2 | data_preICA.trialinfo == 3];
KET_data_preICA         = ft_selectdata(cfg, data_preICA);


% fastICA: perform the independent component analysis (i.e., decompose the data)
% PLA
cfg                             = [];
cfg.method                      = 'fastica';
cfg.channel                     = 'MEG';
cfg.trials                      = 'all';
cfg.numcomponent                = 'all';
cfg.demean                      = 'yes';
cfg.fastica.maxNumIterations    = 200;
PLA_data_fastICA                    = ft_componentanalysis(cfg, PLA_data_preICA);

% save fastICA data
save([subjectdata.outputdir, '\', subjectdata.subjnr, '_EC_PLA_data_fastICA'], 'PLA_data_fastICA', '-V7.3') 
 
% fastICA: perform the independent component analysis (i.e., decompose the data)
% KET
cfg                             = [];
cfg.method                      = 'fastica';
cfg.channel                     = 'MEG';
cfg.trials                      = 'all';
cfg.numcomponent                = 'all';
cfg.demean                      = 'yes';
cfg.fastica.maxNumIterations    = 200;
KET_data_fastICA                    = ft_componentanalysis(cfg, KET_data_preICA);

% save fastICA data
save([subjectdata.outputdir, '\', subjectdata.subjnr, '_EC_KET_data_fastICA'], 'KET_data_fastICA', '-V7.3')
clear 

end


