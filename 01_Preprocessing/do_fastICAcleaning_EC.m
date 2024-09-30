
%% resting state
clear 
eval('Subject14')
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLA_data_fastICA']);
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KET_data_fastICA']);

% For further inspection of the time course of the components, use:
% PLA
cfg             = [];
cfg.layout      = 'CTF275.lay';
cfg.viewmode    = 'component';
cfg.compscale   = 'local'; % default is 'global'
ft_databrowser(cfg, PLA_data_fastICA)
% remove the eye, heartbeat and drift components and backproject the data
cfg                         = [];
cfg.component               = [1 2 6 7 26 31]; 
PLA_data_fastICAcleaned         = ft_rejectcomponent(cfg, PLA_data_fastICA);

% EXTRA: VISUALLY CLEAN DATA
cfg                  = [];
cfg.method           = 'summary';
cfg.layout           = 'CTF275.lay';
cfg.channels         = 'MEG';
PLA_data_cleaned         = ft_rejectvisual(cfg, PLA_data_fastICAcleaned);
clear PLA_data_fastICA PLA_data_fastICAcleaned

% KET
cfg             = [];
cfg.layout      = 'CTF275.lay';
cfg.viewmode    = 'component';
cfg.compscale   = 'local'; % default is 'global'
ft_databrowser(cfg, KET_data_fastICA)
% remove the eye, heartbeat and drift components and backproject the data
cfg                         = [];
cfg.component               = [1 3 7 8 14 61 111]; 
KET_data_fastICAcleaned         = ft_rejectcomponent(cfg, KET_data_fastICA);

% EXTRA: VISUALLY CLEAN DATA
cfg                  = [];
cfg.method           = 'summary';
cfg.layout           = 'CTF275.lay';
cfg.channels         = 'MEG';
KET_data_cleaned         = ft_rejectvisual(cfg, KET_data_fastICAcleaned);
clear KET_data_fastICA KET_data_fastICAcleaned

%% separate the conditions again
% trialinfo for each cond: PLApre=0, PLApost=1, KETpre=2, KETpost=3 

cfg                     = [];
cfg.trials              = PLA_data_cleaned.trialinfo == 0;
PLApre_fastICAcleaned   = ft_selectdata(cfg, PLA_data_cleaned);

cfg                     = [];
cfg.trials              = PLA_data_cleaned.trialinfo == 1;
PLApost_fastICAcleaned  = ft_selectdata(cfg, PLA_data_cleaned);

cfg                     = [];
cfg.trials              = KET_data_cleaned.trialinfo == 2;
KETpre_fastICAcleaned   = ft_selectdata(cfg, KET_data_cleaned);

cfg                     = [];
cfg.trials              = KET_data_cleaned.trialinfo == 3;
KETpost_fastICAcleaned  = ft_selectdata(cfg, KET_data_cleaned);

output = [size(PLApre_fastICAcleaned.sampleinfo,1) size(PLApost_fastICAcleaned.sampleinfo,1) ...
          size(KETpre_fastICAcleaned.sampleinfo,1) size(KETpost_fastICAcleaned.sampleinfo,1)];
disp(output)

% save final cleaned data
save([subjectdata.outputdir, '\', subjectdata.subjnr, '_EC_PLApre_fastICAcleaned'], 'PLApre_fastICAcleaned', '-V7.3')
save([subjectdata.outputdir, '\', subjectdata.subjnr, '_EC_PLApost_fastICAcleaned'], 'PLApost_fastICAcleaned', '-V7.3')
save([subjectdata.outputdir, '\', subjectdata.subjnr, '_EC_KETpre_fastICAcleaned'], 'KETpre_fastICAcleaned', '-V7.3')
save([subjectdata.outputdir, '\', subjectdata.subjnr, '_EC_KETpost_fastICAcleaned'], 'KETpost_fastICAcleaned', '-V7.3')
clear

%% log rejected components & trials left per subject per condition
%
% S001 PLA - [3 5 7 8 10 11 12 17 24 28 77]
%      KET - [2 3 4 13 14 15 16 51]
%       PLApre=222, PLApost=217, KETpre=209, KETpost=0
%
% S002 PLA - [7 8 14 21 25 26 30 98]
%      KET - [3 11 12 23 62 93]
%       PLApre=232, PLApost=226, KETpre=231, KETpost=214
%
% S003 PLA - [7 12 13 15 17 18 19 35 61]
%      KET - [1 5 14 19 26 29 30] 
%       PLApre=228, PLApost=227, KETpre=216, KETpost=224
%       
% S004 PLA - [10 11 20 24 50]
%      KET - [1 2 3 4 5 7 16 24 28]
%       PLApre=217, PLApost=232, KETpre=231, KETpost=217
%
% S005 PLA - [1 9 12 25 41 51 60 79 120]
%      KET - [5 11 12 13 18 19]
%       PLApre=219, PLApost=225, KETpre=228, KETpost=205
%
% S006 PLA - [7 21 25]
%      KET - [2 3 20 69]
%       PLApre=229, PLApost=225, KETpre=232, KETpost=217
%
% S007 PLA - [1 2 3 8 9 27]
%      KET - [1 2 3 4 7 8 9 14 49 72]
%       PLApre=220, PLApost=221, KETpre=220, KETpost=209
%
% S008 PLA - [15 19 24 28 34 39 45 86]
%      KET - [1 2 12 16 25 27 74]
%       PLApre=231, PLApost=227, KETpre=231, KETpost=229
%
% S010 PLA - [5 7 10 12 23 29 34 98 108]
%      KET - [7 9 14 16 17 18 20 27 30 33 34 42 90 123]
%       PLApre=231, PLApost=227, KETpre=233, KETpost=214
%
% S011 PLA - [1 3 6 7 17 66]
%      KET - [3 6 7 10 20 27 35 51 56 80]
%       PLApre=227, PLApost=208, KETpre=211, KETpost=226
%
% S012 PLA - [7 8 43 81 109]
%      KET - [1 3 7 18 28 29 44 55 68]
%       PLApre=232, PLApost=233, KETpre=232, KETpost=233
%
% S013 PLA - [4 6 7 8 11 15 16 29]
%      KET - [2 6 8 12 20 46]
%       PLApre=207, PLApost=204, KETpre=186, KETpost=219
%
% S014 PLA - [1 2 6 7 26 31]
%      KET - [1 3 7 8 14 61 111]
%       PLApre=232, PLApost=229, KETpre=229, KETpost=229
