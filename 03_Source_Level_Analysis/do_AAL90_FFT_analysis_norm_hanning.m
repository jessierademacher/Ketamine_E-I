function do_AAL90_FFT_analysis_norm_hanning(Subjectm)

eval(Subjectm); % eval('Subject02')

%% PLApre, PLApost, KETpre, KETpost:

eval(['load E:/PROJECTS/KETAMINE-RS\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_PLApre_dft2']);
eval(['load E:/PROJECTS/KETAMINE-RS\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_PLApost_dft2']);
eval(['load E:/PROJECTS/KETAMINE-RS\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_KETpre_dft2']);
eval(['load E:/PROJECTS/KETAMINE-RS\VIRTCHAN\DATA\' subjectdata.subjnr '_AAL90_EC_KETpost_dft2']);

% rescale the data

% rescale the data
AAL90_EC_PLApre_norm = AAL90_EC_PLApre; % trials x chan x time
for i = 1:size(AAL90_EC_PLApre.trial,2) % trials
    for j = 1:size(AAL90_EC_PLApre.label,1) % channels
        minVal              = nanmin(AAL90_EC_PLApre.trial{i}(j,:));
        maxVal              = nanmax(AAL90_EC_PLApre.trial{i}(j,:));
        AAL90_EC_PLApre_norm.trial{i}(j,:)  = -1 + 2*(AAL90_EC_PLApre.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end
% rescale the data
AAL90_EC_PLApost_norm = AAL90_EC_PLApost; % trials x chan x time
for i = 1:size(AAL90_EC_PLApost.trial,2) % trials
    for j = 1:size(AAL90_EC_PLApost.label,1) % channels
        minVal              = nanmin(AAL90_EC_PLApost.trial{i}(j,:));
        maxVal              = nanmax(AAL90_EC_PLApost.trial{i}(j,:));
        AAL90_EC_PLApost_norm.trial{i}(j,:)  = -1 + 2*(AAL90_EC_PLApost.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end
% rescale the data
AAL90_EC_KETpre_norm = AAL90_EC_KETpre; % trials x chan x time
for i = 1:size(AAL90_EC_KETpre.trial,2) % trials
    for j = 1:size(AAL90_EC_KETpre.label,1) % channels
        minVal              = nanmin(AAL90_EC_KETpre.trial{i}(j,:));
        maxVal              = nanmax(AAL90_EC_KETpre.trial{i}(j,:));
        AAL90_EC_KETpre_norm.trial{i}(j,:)  = -1 + 2*(AAL90_EC_KETpre.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end
% rescale the data
AAL90_EC_KETpost_norm = AAL90_EC_KETpost; % trials x chan x time
for i = 1:size(AAL90_EC_KETpost.trial,2) % trials
    for j = 1:size(AAL90_EC_KETpost.label,1) % channels
        minVal              = nanmin(AAL90_EC_KETpost.trial{i}(j,:));
        maxVal              = nanmax(AAL90_EC_KETpost.trial{i}(j,:));
        AAL90_EC_KETpost_norm.trial{i}(j,:)  = -1 + 2*(AAL90_EC_KETpost.trial{i}(j,:) - minVal) ./ (maxVal - minVal);
    end
end
clear AAL90_EO_PLApre AAL90_EO_PLApost AAL90_EO_KETpre AAL90_EO_KETpost 


% FFT analyses
cfg             = [];
cfg.output      = 'pow';
cfg.method      = 'mtmfft'; 
cfg.taper       = 'hanning'; 
cfg.tapsmofrq   = 1;
%cfg.taper       = 'dpss'; 
%cfg.tapsmofrq   = 3;
cfg.foi         = 1:1:90;
cfg.pad         = 2;
PLApre_EC       = ft_freqanalysis(cfg, AAL90_EC_PLApre_norm);
PLApost_EC      = ft_freqanalysis(cfg, AAL90_EC_PLApost_norm);
KETpre_EC       = ft_freqanalysis(cfg, AAL90_EC_KETpre_norm);
KETpost_EC      = ft_freqanalysis(cfg, AAL90_EC_KETpost_norm);


% save FFT data
save(['E:/PROJECTS/KETAMINE-RS\VIRTCHAN\FFT\hanning\', subjectdata.subjnr, '_data_AAL90_FFT_EC_KETpre_norm_dft2'], 'KETpre_EC', '-V7.3')
save(['E:/PROJECTS/KETAMINE-RS\VIRTCHAN\FFT\hanning\', subjectdata.subjnr, '_data_AAL90_FFT_EC_KETpost_norm_dft2'], 'KETpost_EC', '-V7.3')
save(['E:/PROJECTS/KETAMINE-RS\VIRTCHAN\FFT\hanning\', subjectdata.subjnr, '_data_AAL90_FFT_EC_PLApre_norm_dft2'], 'PLApre_EC', '-V7.3')
save(['E:/PROJECTS/KETAMINE-RS\VIRTCHAN\FFT\hanning\', subjectdata.subjnr, '_data_AAL90_FFT_EC_PLApost_norm_dft2'], 'PLApost_EC', '-V7.3')
clear

end