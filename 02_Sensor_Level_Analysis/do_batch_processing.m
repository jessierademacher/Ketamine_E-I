% batch processing (preproc)
% S01,S02,S03,S04,S05,S06,S07,S08,S10,S11,S12,S13,S14
% [1 2 3 4 5 6 7 8 10 11 12 13 14]; 

clear 

% subjectID = {'Subject02','Subject03','Subject04','Subject05',...
%     'Subject06','Subject07','Subject08','Subject10',...
%     'Subject11','Subject12','Subject13','Subject14'};

subjectID = {'Subject10','Subject13','Subject14'};
                        


%% run batch
for ind = 1:length(subjectID)

subjectID = {'Subject10','Subject13','Subject14'};

    fprintf('dataset is %s\n',subjectID{ind}) 
    sName = subjectID{ind};
    
    %%% PREPROC
%     do_preICA_EO(sName);
%     do_preICA_EC(sName);
%    do_fastICA_EO(sName);
%    do_fastICA_EC(sName);
%    do_dft_sensor_data(sName);

    %%% FFT sensor
%     do_FFTanalysis_norm(sName);
    
    %%% VIRTCHAN
%     do_create_AAL90_virtchan(sName);
%    do_dft_neighbour_source_data(sName);
%      do_AAL90_FFT_analysis_norm(sName);
%     do_AAL90_FOOOF_norm(sName);
%     do_AAL90_IRASA_EO_EC(sName);

    %%% SENSORLEVEL
     do_IRASA_sensors_norm(sName);

clear 
end

