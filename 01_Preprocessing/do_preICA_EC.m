function do_preICA_EC(Subjectm)

eval(Subjectm); % eval('Subject01')

%% PLACEBO pre
dataset = subjectdata.datadir1;

% make event overview
cfg                         = [];
cfg.dataset                 = dataset;
cfg.trialfun                = 'ft_trialfun_general';
cfg.trialdef.eventtype      = '?';
cfg                         = ft_definetrial(cfg);
event                       = ft_read_event(cfg.headerfile);
event_overview              = [{cfg.event.type}' {cfg.event.value}' {cfg.event.sample}'];


EC_beginning                = 159327;
EC_end                      = 159327 + 4*60*600;


% define trial with cfg.trl
cfg                         = [];
cfg.dataset                 = dataset;
hdr                         = ft_read_header(cfg.dataset);
begsample                   = EC_beginning;
if EC_end<hdr.nSamples
    endsample               = EC_end;     
else
    endsample               = hdr.nSamples;
end
offset                      = zeros(size(begsample));
cfg.trl                     = [begsample(:) endsample(:) offset(:)];

% FT_PREPROCESSING
cfg.continuous              = 'yes';
cfg.demean                  = 'yes';
cfg.dftfilter               = 'yes';
cfg.dftfreq                 = [49:51 99:101 149:151];
data                        = ft_preprocessing(cfg);

% create 2s trials, 0.5 sec overlapping
cfg                 = [];
cfg.length     = 2;
cfg.overlap    = 0.5;
MEGall           = ft_redefinetrial(cfg, data);

% Downsample the data
cfg                 = [];
cfg.resamplefs      = 300;
cfg.detrend         = 'no';
data_ds             = ft_resampledata(cfg, MEGall);

% save grad info
grad = data_ds.grad;
save([subjectdata.outputdir, '\', 'grad_placebo'], 'grad', '-V7.3')

% save preprocessed, precleaned and downsampled data
save([subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApre_preICA_ds'], 'data_ds', '-V7.3')
clearvars -except subjectdata

%% PLACEBO post (after 5 min)
dataset = subjectdata.datadir2;

% make event overview
cfg                         = [];
cfg.dataset                 = dataset;
cfg.trialfun                = 'ft_trialfun_general';
cfg.trialdef.eventtype      = '?';
cfg                         = ft_definetrial(cfg);
event                       = ft_read_event(cfg.headerfile);
event_overview              = [{cfg.event.type}' {cfg.event.value}' {cfg.event.sample}'];


EC_beginning                = 159327;
EC_end                      = 159327 + 4*60*600;


% define trial with cfg.trl
cfg                         = [];
cfg.dataset                 = dataset;
hdr                         = ft_read_header(cfg.dataset);
begsample                   = EC_beginning;
if EC_end<hdr.nSamples
    endsample               = EC_end;     
else
    endsample               = hdr.nSamples;
end   
offset                      = zeros(size(begsample));
cfg.trl                     = [begsample(:) endsample(:) offset(:)];

% FT_PREPROCESSING
cfg.continuous              = 'yes';
cfg.demean                  = 'yes';
cfg.dftfilter               = 'yes';
cfg.dftfreq                 = [49:51 99:101 149:151];
data                        = ft_preprocessing(cfg);

% create 2s trials, 0.5 sec overlapping
cfg                 = [];
cfg.length     = 2;
cfg.overlap    = 0.5;
MEGall           = ft_redefinetrial(cfg, data);

% Downsample the data
cfg                 = [];
cfg.resamplefs      = 300;
cfg.detrend         = 'no';
data_ds             = ft_resampledata(cfg, MEGall);

% save preprocessed, precleaned and downsampled data
save([subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApost_preICA_ds'], 'data_ds', '-V7.3')
clearvars -except subjectdata

%% KETAMINE pre
dataset = subjectdata.datadir3;

% make event overview
cfg                         = [];
cfg.dataset                 = dataset;
cfg.trialfun                = 'ft_trialfun_general';
cfg.trialdef.eventtype      = '?';
cfg                         = ft_definetrial(cfg);
event                       = ft_read_event(cfg.headerfile);
event_overview              = [{cfg.event.type}' {cfg.event.value}' {cfg.event.sample}'];



EC_beginning                = 159327;
EC_end                      = 159327 + 4*60*600;


% define trial with cfg.trl
cfg                         = [];
cfg.dataset                 = dataset;
hdr                         = ft_read_header(cfg.dataset);
begsample                   = EC_beginning;
if EC_end<hdr.nSamples
    endsample               = EC_end;     
else
    endsample               = hdr.nSamples;
end       
offset                      = zeros(size(begsample));
cfg.trl                     = [begsample(:) endsample(:) offset(:)];

% FT_PREPROCESSING
cfg.continuous              = 'yes';
cfg.demean                  = 'yes';
cfg.dftfilter               = 'yes';
cfg.dftfreq                 = [49:51 99:101 149:151];
data                        = ft_preprocessing(cfg);

% create 2s trials, 0.5 sec overlapping
cfg                 = [];
cfg.length     = 2;
cfg.overlap    = 0.5;
MEGall           = ft_redefinetrial(cfg, data);

% Downsample the data
cfg                 = [];
cfg.resamplefs      = 300;
cfg.detrend         = 'no';
data_ds             = ft_resampledata(cfg, MEGall);



% save preprocessed, precleaned and downsampled data
save([subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpre_preICA_ds'], 'data_ds', '-V7.3')
clearvars -except subjectdata

%% KETAMINE post (after 5 min)
dataset = subjectdata.datadir4;

% make event overview
cfg                         = [];
cfg.dataset                 = dataset;
cfg.trialfun                = 'ft_trialfun_general';
cfg.trialdef.eventtype      = '?';
cfg                         = ft_definetrial(cfg);
event                       = ft_read_event(cfg.headerfile);
event_overview              = [{cfg.event.type}' {cfg.event.value}' {cfg.event.sample}'];


EC_beginning                = 159327;
EC_end                      = 159327 + 4*60*600;


% define trial with cfg.trl
cfg                         = [];
cfg.dataset                 = dataset;
hdr                         = ft_read_header(cfg.dataset);
begsample                   = EC_beginning;
if EC_end<hdr.nSamples
    endsample               = EC_end;     
else
    endsample               = hdr.nSamples;
end      
offset                      = zeros(size(begsample));
cfg.trl                     = [begsample(:) endsample(:) offset(:)];

% FT_PREPROCESSING
cfg.continuous              = 'yes';
cfg.demean                  = 'yes';
cfg.dftfilter               = 'yes';
cfg.dftfreq                 = [49:51 99:101 149:151];
data                        = ft_preprocessing(cfg);

% create 2s trials, 0.5 sec overlapping
cfg                 = [];
cfg.length     = 2;
cfg.overlap    = 0.5;
MEGall           = ft_redefinetrial(cfg, data);

% Downsample the data
cfg                 = [];
cfg.resamplefs      = 300;
cfg.detrend         = 'no';
data_ds             = ft_resampledata(cfg, MEGall);

% save preprocessed, precleaned and downsampled data
save([subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpost_preICA_ds'], 'data_ds', '-V7.3')
clear 

end