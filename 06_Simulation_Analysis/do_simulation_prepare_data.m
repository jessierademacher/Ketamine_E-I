clear
folder = 'D:/PROJECTS/KETAMINE-RS/SIMULATIONS/';
condition = 'PV_SST_40';

pattern = 'MEG_Seed*';
list = dir([folder condition filesep pattern]);

time_steps = 2/800;
time = [0:time_steps:2-time_steps];

trials = {};
for i = 1:numel(list)
    eeg = readmatrix([folder condition filesep list(i).name]);
    trials{i} = eeg';
    times{i} = time;
end

data.label      = {'ROI'};      % cell-array containing strings, Nchan*1
data.fsample    = 400;        % sampling frequency in Hz, single number
data.trial      = trials;     % cell-array containing a data matrix for each
                              % trial (1*Ntrial), each data matrix is a Nchan*Nsamples matrix
data.time       = times;      % cell-array containing a time axis for each
                              % trial (1*Ntrial), each time axis is a 1*Nsamples vector
                              
save([folder 'processed_data/' condition '_preprocessed_nofilter'], 'data', '-V7.3')
       
cfg             = [];
cfg.demean      = 'yes';
cfg.bpfilter    = 'yes';
cfg.bpfreq      = [2 130];
data_preproc    = ft_preprocessing(cfg, data);

save([folder 'processed_data/' condition '_preprocessed'], 'data_preproc', '-V7.3')




               