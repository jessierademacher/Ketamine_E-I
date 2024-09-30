function do_create_AAL90_virtchan(Subjectm)

eval(Subjectm); % eval('Subject10')

%% PLACEBO: obtaining (inverse) transformation matrix (4D to SPM and v.v.)

% read the single subject anatomical MRI and template grid
eval(['load .\BMFparts\' subjectdata.subjnr '_hdm_seg_mri_realigned_pla']); 
eval(['load .\BMFparts\' subjectdata.subjnr '_sourcemodel_pla']); 

% normalize this subjects MRI to the template MRI (4D to SPM), the purpose
% is to obtain obtain the transformation matrix
cfg                 = [];
cfg.templatefile    = '.\SCRIPTS\single_subj_T1_1mm.nii'; %is in MNI coordinates
%cfg.downsample      = 2;
cfg.nonlinear       = 'no';
norm                = ft_volumenormalise(cfg, mri_realigned_pla); % subjects mri to MNI template

%% PLACEBO: transform BMF locations to subject CTF locations

% AAL90 locations 
AAL90_list = [
        [-39, -6, 51];	 % LPreCG
        [41, -8, 48];	 % RPreCG
        [-18, 35, 42];   % LSFGdor
        [22, 31, 44];    % RSFGdor
        [-17, 47, -13];  % LORBsup
        [18, 48, -14];   % RORBsup
        [-33, 33, 36];   % LMFG
        [38, 33, 34];    % RMFG
        [-31, 50, -10];  % LORBmid
        [33, 53, -11];   % RORBmid
        [-48, 13, 19];   % LIFGoperc
        [50, 15, 21];    % RIFGoperc
        [-46, 30, 14];   % LIFGtriang
        [50, 30, 14];    % RIFGtriang
        [-36, 31, -12];  % LORBinf
        [41, 32, -12];   % RORBinf
        [-47, -8, 14];   % LROL
        [53, -6, 15];    % RROL
        [-5, 5, 61];     % LSMA
        [9, 0, 62];      % RSMA
        [-8, 15, -11];   % LOLF
        [10, 16, -11];   % ROLF
        [-5, 49, 31];    % LSFGmed
        [9, 51, 30];     % RSFGmed
        [-5, 54, -7];    % LORBsupmed
        [8, 52, -7];     % RORBsupmed
        [-5, 37, -18];   % LREC
        [8, 36, -18];    % RREC
        [-35, 7, 3];     % LINS
        [39, 6, 2];      % RINS
        [-4, 35, 14];    % LACG
        [8, 37, 16];     % RACG
        [-5, -15, 42];   % LDCG
        [8, -9, 40];     % RDCG
        [-5, -43, 25];   % LPCG
        [7, -42, 22];    % RPCG
        [-25, -21, -10]; % LHIP
        [29, -20, -10];  % RHIP
        [-22, -16, -21]; % LPHG
        [25, -15, -21];  % RPHG
        [-23, -1, -17];  % LAMYG
        [27, 1,	-17];    % RAMYG
        [-7, -79, 6];    % LCAL
        [16, -73, 9];    % RCAL
        [-6, -80, 27];   % LCUN
        [14, -79, 28];   % RCUN
        [-15, -68, -5];  % LLING
        [16, -67, -4];   % RLING
        [-17, -84, 28];  % LSOG
        [24, -78, 25];   % RSOG
        [-32, -73, 16];  % LMOG
        [37, -73, 19];   % RMOG
        [-36, -78, -8];  % LIOG
        [34, -76, -10];   % RIOG
        [-31, -40, -20]; % LFFG
        [34, -39, -20];  % RFFG
        [-40, -23, 49];  % LPoCG
        [39, -25, 51];   % RPoCG
        [-23, -56, 50];  % LSPG
        [26, -56, 49];   % RSPG
        [-43, -45, 43];  % LIPL
        [44, -45, 41];   % RIPL
        [-56, -34, 30];  % LSMG
        [56, -32, 34];   % RSMG
        [-43, -58, 35];  % LANG
        [43, -56, 35];   % RANG
        [-7, -56, 48];   % LPCUN
        [10, -56, 44];   % RPCUN
        [-8, -25, 68];   % LPCL
        [8, -32, 66];    % RPCL
        [-11, 11, 9];    % LCAU
        [15, 12, 9];     % RCAU
        [-24, 4, 2];     % LPUT
        [28, 5, 2];      % RPUT
        [-18, 0, 0];     % LPAL
        [21, 0, 0];      % RPAL
        [-11, -18, 8];   % LTHA
        [13, -18, 8];    % RTHA
        [-42, -19, 10];  % LHES
        [46, -17, 10];   % RHES
        [-53, -21, 7];   % LSTG
        [58, -22, 7];    % RSTG
        [-40, 15, -20];  % LTPOsup
        [44, 17, -16];   % RTPOsup
        [-56, -34, -2];  % LMTG
        [53, -37, -1];   % RMTG
        [-36, 15, -34];  % LTPOmid
        [36, 15, -33];   % RTPOmid
        [-50, -28, -23]; % LITG
        [50, -31, -20];  % RITG
    ];

NetworkNodes = [];
j = 1;
for i = 1:length(AAL90_list)
    % Warping locations back to single_subject volume
    NetworkNodes(j,:)   = ft_warp_apply(inv(norm.initial), AAL90_list(i,:), 'homogenous'); %in mm
    j = j + 1;
end

AAL90_labels = {'LPreCG';'RPreCG';'LSFGdor';'RSFGdor';'LORBsup';'RORBsup';'LMFG';'RMFG';'LORBmid';'RORBmid';...
                'LIFGoperc';'RIFGoperc';'LIFGtriang';'RIFGtriang';'LORBinf';'RORBinf';'LROL';'RROL';'LSMA';'RSMA';...
                'LOLF';'ROLF';'LSFGmed';'RSFGmed';'LORBsupmed';'RORBsupmed';'LREC';'RREC';'LINS';'RINS';...
                'LACG';'RACG';'LDCG';'RDCG';'LPCG';'RPCG';'LHIP';'RHIP';'LPHG';'RPHG';...
                'LAMYG';'RAMYG';'LCAL';'RCAL';'LCUN';'RCUN';'LLING';'RLING';'LSOG';'RSOG';...
                'LMOG';'RMOG';'LIOG';'RIOG';'LFFG';'RFFG';'LPoCG';'RPoCG';'LSPG';'RSPG';...
                'LIPL';'RIPL';'LSMG';'RSMG';'LANG';'RANG';'LPCUN';'RPCUN';'LPCL';'RPCL';...
                'LCAU';'RCAU';'LPUT';'RPUT';'LPAL';'RPAL';'LTHA';'RTHA';'LHES';'RHES';...
                'LSTG';'RSTG';'LTPOsup';'RTPOsup';'LMTG';'RMTG';'LTPOmid';'RTPOmid';'LITG';'RITG'};

% check locations:
% NodeNR          = 90;
% cfg             = [];
% cfg.location    = NetworkNodes(NodeNR,:);
% ft_sourceplot(cfg, mri_realigned_pla)
% disp(AAL90_labels(NodeNR))


%% PLACEBO pre EC: create virtual channel data for each VC nodes and append all data

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApre_fastICAcleaned']);
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);

data        = PLApre_fastICAcleaned; 
data.grad   = grad;

% making time axis of every trials the same
for i=1:length(data.time)
data.time{1,i} = data.time{1,1};
end

clear PLApre_fastICAcleaned
clear grad

cfg                     = [];
cfg.covariance          = 'yes';
cfg.channel             = 'MEG';
%cfg.vartrllength        = 2;
cfg.covariancewindow    = 'all';
cfg.keeptrials          = 'yes';
timelock                = ft_timelockanalysis(cfg, data);

ROIchan = cell(length(AAL90_list),1);
for indx = 1:length(AAL90_list)
    
    fprintf('Working on ROI %s\n', num2str(indx));
    cfg                     = [];
    cfg.method              = 'lcmv';
    cfg.headmodel           = hdm_pla;
    cfg.sourcemodel.pos     = NetworkNodes(indx,:);
    cfg.lcmv.keepfilter     = 'yes';
    cfg.lcmv.lambda         = '20%';
    cfg.normalize           = 'yes';
    cfg.lcmv.projectnoise   = 'yes';
    cfg.reducerank          = 2;
    source                  = ft_sourceanalysis(cfg, timelock);

    BMF_pow                 = source.avg.filter{1};
    
    chansel                 = ft_channelselection('MEG', data.label); % find the MEG sensor names
    chansel                 = match_str(data.label, chansel); % find MEG sensor indices
    
    ROI                     = [];
    ROI.label               = {'x','y','z'};
    ROI.time                = data.time;
    
    for k = 1:length(data.trial)
        ROI.trial{k} = BMF_pow * data.trial{k}(chansel,:);
    end
        
    timeseries              = cat(2, ROI.trial{:});
    [u, s, v]               = svd(timeseries, 'econ');
    
    ROIchan{indx}.label     = cellstr(AAL90_labels{indx});
    ROIchan{indx}.time      = ROI.time;
    for m = 1:length(ROI.trial)
        ROIchan{indx}.trial{m} = u(:,1)' * BMF_pow * data.trial{m}(chansel,:);
    end
    
    % add important other info from data
    ROIchan{indx}.trialinfo   = data.trialinfo;
    ROIchan{indx}.sampleinfo  = data.sampleinfo;
    ROIchan{indx}.fsample     = data.fsample;
    ROIchan{indx}.grad        = data.grad;

end

% append data
cfg           = [];
AAL90_EC_PLApre  = ft_appenddata(cfg, ROIchan{:});

% save output
save(['.\VIRTCHAN\DATA\', subjectdata.subjnr, '_AAL90_EC_PLApre'], 'AAL90_EC_PLApre', '-V7.3')



%% PLACEBO post EC: create virtual channel data for each VC nodes and append all data

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApost_fastICAcleaned']);
eval(['load ' subjectdata.outputdir filesep 'grad_placebo']);

data        = PLApost_fastICAcleaned; 
data.grad   = grad;

% making time axis of every trials the same
for i=1:length(data.time)
data.time{1,i} = data.time{1,1};
end

clear PLApost_fastICAcleaned
clear grad

cfg                     = [];
cfg.covariance          = 'yes';
cfg.channel             = 'MEG';
cfg.vartrllength        = 2;
cfg.covariancewindow    = 'all';
timelock                = ft_timelockanalysis(cfg, data);

ROIchan = cell(length(AAL90_list),1);
for indx = 1:length(AAL90_list)
    
    cfg                     = [];
    cfg.method              = 'lcmv';
    cfg.headmodel           = hdm_pla;
    cfg.sourcemodel.pos     = NetworkNodes(indx,:);
    cfg.lcmv.keepfilter     = 'yes';
    cfg.lcmv.lambda         = '20%';
    cfg.lcmv.normalize      = 'yes';
    cfg.lcmv.projectnoise   = 'yes';
    cfg.lcmv.reducerank     = 2;
    source                  = ft_sourceanalysis(cfg, timelock);

    BMF_pow                 = source.avg.filter{1};
    
    chansel                 = ft_channelselection('MEG', data.label); % find the MEG sensor names
    chansel                 = match_str(data.label, chansel); % find MEG sensor indices
    
    ROI                     = [];
    ROI.label               = {'x','y','z'};
    ROI.time                = data.time;
    
    for k = 1:length(data.trial)
        ROI.trial{k} = BMF_pow * data.trial{k}(chansel,:);
    end
        
    timeseries              = cat(2, ROI.trial{:});
    [u, s, v]               = svd(timeseries, 'econ');
    
    ROIchan{indx}.label     = cellstr(AAL90_labels{indx});
    ROIchan{indx}.time      = ROI.time;
    for m = 1:length(ROI.trial)
        ROIchan{indx}.trial{m} = u(:,1)' * BMF_pow * data.trial{m}(chansel,:);
    end
    
    % add important other info from data
    ROIchan{indx}.trialinfo   = data.trialinfo;
    ROIchan{indx}.sampleinfo  = data.sampleinfo;
    ROIchan{indx}.fsample     = data.fsample;
    ROIchan{indx}.grad        = data.grad;

end

% append data
cfg           = [];
AAL90_EC_PLApost = ft_appenddata(cfg, ROIchan{:});

% save output
save(['.\VIRTCHAN\DATA\', subjectdata.subjnr, '_AAL90_EC_PLApost'], 'AAL90_EC_PLApost', '-V7.3')

%% KETAMINE: obtaining (inverse) transformation matrix (4D to SPM and v.v.)

% read the single subject anatomical MRI and template grid
eval(['load .\BMFparts\' subjectdata.subjnr '_hdm_seg_mri_realigned_ket']); 
eval(['load .\BMFparts\' subjectdata.subjnr '_sourcemodel_ket']); 

% normalize this subjects MRI to the template MRI (4D to SPM), the purpose
% is to obtain obtain the transformation matrix
cfg                 = [];
cfg.templatefile    = '.\SCRIPTS\single_subj_T1_1mm.nii'; %is in MNI coordinates
cfg.nonlinear       = 'no';
norm                = ft_volumenormalise(cfg, mri_realigned_ket); % subjects mri to MNI template

%% KETAMINE: transform BMF locations to subject CTF locations

% AAL90 locations 
AAL90_list = [
        [-39, -6, 51];	 % LPreCG
        [41, -8, 48];	 % RPreCG
        [-18, 35, 42];   % LSFGdor
        [22, 31, 44];    % RSFGdor
        [-17, 47, -13];  % LORBsup
        [18, 48, -14];   % RORBsup
        [-33, 33, 36];   % LMFG
        [38, 33, 34];    % RMFG
        [-31, 50, -10];  % LORBmid
        [33, 53, -11];   % RORBmid
        [-48, 13, 19];   % LIFGoperc
        [50, 15, 21];    % RIFGoperc
        [-46, 30, 14];   % LIFGtriang
        [50, 30, 14];    % RIFGtriang
        [-36, 31, -12];  % LORBinf
        [41, 32, -12];   % RORBinf
        [-47, -8, 14];   % LROL
        [53, -6, 15];    % RROL
        [-5, 5, 61];     % LSMA
        [9, 0, 62];      % RSMA
        [-8, 15, -11];   % LOLF
        [10, 16, -11];   % ROLF
        [-5, 49, 31];    % LSFGmed
        [9, 51, 30];     % RSFGmed
        [-5, 54, -7];    % LORBsupmed
        [8, 52, -7];     % RORBsupmed
        [-5, 37, -18];   % LREC
        [8, 36, -18];    % RREC
        [-35, 7, 3];     % LINS
        [39, 6, 2];      % RINS
        [-4, 35, 14];    % LACG
        [8, 37, 16];     % RACG
        [-5, -15, 42];   % LDCG
        [8, -9, 40];     % RDCG
        [-5, -43, 25];   % LPCG
        [7, -42, 22];    % RPCG
        [-25, -21, -10]; % LHIP
        [29, -20, -10];  % RHIP
        [-22, -16, -21]; % LPHG
        [25, -15, -21];  % RPHG
        [-23, -1, -17];  % LAMYG
        [27, 1,	-17];    % RAMYG
        [-7, -79, 6];    % LCAL
        [16, -73, 9];    % RCAL
        [-6, -80, 27];   % LCUN
        [14, -79, 28];   % RCUN
        [-15, -68, -5];  % LLING
        [16, -67, -4];   % RLING
        [-17, -84, 28];  % LSOG
        [24, -78, 25];   % RSOG
        [-32, -73, 16];  % LMOG
        [37, -73, 19];   % RMOG
        [-36, -78, -8];  % LIOG
        [34, -76, -10];   % RIOG
        [-31, -40, -20]; % LFFG
        [34, -39, -20];  % RFFG
        [-40, -23, 49];  % LPoCG
        [39, -25, 51];   % RPoCG
        [-23, -56, 50];  % LSPG
        [26, -56, 49];   % RSPG
        [-43, -45, 43];  % LIPL
        [44, -45, 41];   % RIPL
        [-56, -34, 30];  % LSMG
        [56, -32, 34];   % RSMG
        [-43, -58, 35];  % LANG
        [43, -56, 35];   % RANG
        [-7, -56, 48];   % LPCUN
        [10, -56, 44];   % RPCUN
        [-8, -25, 68];   % LPCL
        [8, -32, 66];    % RPCL
        [-11, 11, 9];    % LCAU
        [15, 12, 9];     % RCAU
        [-24, 4, 2];     % LPUT
        [28, 5, 2];      % RPUT
        [-18, 0, 0];     % LPAL
        [21, 0, 0];      % RPAL
        [-11, -18, 8];   % LTHA
        [13, -18, 8];    % RTHA
        [-42, -19, 10];  % LHES
        [46, -17, 10];   % RHES
        [-53, -21, 7];   % LSTG
        [58, -22, 7];    % RSTG
        [-40, 15, -20];  % LTPOsup
        [44, 17, -16];   % RTPOsup
        [-56, -34, -2];  % LMTG
        [53, -37, -1];   % RMTG
        [-36, 15, -34];  % LTPOmid
        [36, 15, -33];   % RTPOmid
        [-50, -28, -23]; % LITG
        [50, -31, -20];  % RITG
    ];

NetworkNodes = [];
j = 1;
for i = 1:length(AAL90_list)
    % Warping locations back to single_subject volume
    NetworkNodes(j,:)   = ft_warp_apply(inv(norm.initial), AAL90_list(i,:), 'homogenous'); %in mm
    j = j + 1;
end

AAL90_labels = {'LPreCG';'RPreCG';'LSFGdor';'RSFGdor';'LORBsup';'RORBsup';'LMFG';'RMFG';'LORBmid';'RORBmid';...
                'LIFGoperc';'RIFGoperc';'LIFGtriang';'RIFGtriang';'LORBinf';'RORBinf';'LROL';'RROL';'LSMA';'RSMA';...
                'LOLF';'ROLF';'LSFGmed';'RSFGmed';'LORBsupmed';'RORBsupmed';'LREC';'RREC';'LINS';'RINS';...
                'LACG';'RACG';'LDCG';'RDCG';'LPCG';'RPCG';'LHIP';'RHIP';'LPHG';'RPHG';...
                'LAMYG';'RAMYG';'LCAL';'RCAL';'LCUN';'RCUN';'LLING';'RLING';'LSOG';'RSOG';...
                'LMOG';'RMOG';'LIOG';'RIOG';'LFFG';'RFFG';'LPoCG';'RPoCG';'LSPG';'RSPG';...
                'LIPL';'RIPL';'LSMG';'RSMG';'LANG';'RANG';'LPCUN';'RPCUN';'LPCL';'RPCL';...
                'LCAU';'RCAU';'LPUT';'RPUT';'LPAL';'RPAL';'LTHA';'RTHA';'LHES';'RHES';...
                'LSTG';'RSTG';'LTPOsup';'RTPOsup';'LMTG';'RMTG';'LTPOmid';'RTPOmid';'LITG';'RITG'};



%% KETAMINE pre EC: create virtual channel data for each VC nodes and append all data

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpre_fastICAcleaned']);
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);

data        = KETpre_fastICAcleaned; 
data.grad   = grad;

% making time axis of every trials the same
for i=1:length(data.time)
data.time{1,i} = data.time{1,1};
end

clear KETpre_fastICAcleaned
clear grad

cfg                     = [];
cfg.covariance          = 'yes';
cfg.channel             = 'MEG';
cfg.vartrllength        = 2;
cfg.covariancewindow    = 'all';
timelock                = ft_timelockanalysis(cfg, data);

ROIchan = cell(length(AAL90_list),1);
for indx = 1:length(AAL90_list)
    
    cfg                     = [];
    cfg.method              = 'lcmv';
    cfg.headmodel           = hdm_ket;
    cfg.sourcemodel.pos     = NetworkNodes(indx,:);
    cfg.lcmv.keepfilter     = 'yes';
    cfg.lcmv.lambda         = '20%';
    cfg.lcmv.normalize      = 'yes';
    cfg.lcmv.projectnoise   = 'yes';
    cfg.lcmv.reducerank     = 2;
    source                  = ft_sourceanalysis(cfg, timelock);

    BMF_pow                 = source.avg.filter{1};
    
    chansel                 = ft_channelselection('MEG', data.label); % find the MEG sensor names
    chansel                 = match_str(data.label, chansel); % find MEG sensor indices
    
    ROI                     = [];
    ROI.label               = {'x','y','z'};
    ROI.time                = data.time;
    
    for k = 1:length(data.trial)
        ROI.trial{k} = BMF_pow * data.trial{k}(chansel,:);
    end
        
    timeseries              = cat(2, ROI.trial{:});
    [u, s, v]               = svd(timeseries, 'econ');
    
    ROIchan{indx}.label     = cellstr(AAL90_labels{indx});
    ROIchan{indx}.time      = ROI.time;
    for m = 1:length(ROI.trial)
        ROIchan{indx}.trial{m} = u(:,1)' * BMF_pow * data.trial{m}(chansel,:);
    end
    
    % add important other info from data
    ROIchan{indx}.trialinfo   = data.trialinfo;
    ROIchan{indx}.sampleinfo  = data.sampleinfo;
    ROIchan{indx}.fsample     = data.fsample;
    ROIchan{indx}.grad        = data.grad;

end

% append data
cfg           = [];
AAL90_EC_KETpre  = ft_appenddata(cfg, ROIchan{:});

% save output
save(['.\VIRTCHAN\DATA\', subjectdata.subjnr, '_AAL90_EC_KETpre'], 'AAL90_EC_KETpre', '-V7.3')



%% KETAMINE post EC: create virtual channel data for each VC nodes and append all data

eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpost_fastICAcleaned']);
eval(['load ' subjectdata.outputdir filesep 'grad_ketamine']);

data        = KETpost_fastICAcleaned; 
data.grad   = grad;

% making time axis of every trials the same
for i=1:length(data.time)
data.time{1,i} = data.time{1,1};
end

clear KETpost_fastICAcleaned
clear grad

cfg                     = [];
cfg.covariance          = 'yes';
cfg.channel             = 'MEG';
cfg.vartrllength        = 2;
cfg.covariancewindow    = 'all';
timelock                = ft_timelockanalysis(cfg, data);

ROIchan = cell(length(AAL90_list),1);
for indx = 1:length(AAL90_list)
    
    cfg                     = [];
    cfg.method              = 'lcmv';
    cfg.headmodel           = hdm_ket;
    cfg.sourcemodel.pos     = NetworkNodes(indx,:);
    cfg.lcmv.keepfilter     = 'yes';
    cfg.lcmv.lambda         = '20%';
    cfg.lcmv.normalize      = 'yes';
    cfg.lcmv.projectnoise   = 'yes';
    cfg.lcmv.reducerank     = 2;
    source                  = ft_sourceanalysis(cfg, timelock);

    BMF_pow                 = source.avg.filter{1};
    
    chansel                 = ft_channelselection('MEG', data.label); % find the MEG sensor names
    chansel                 = match_str(data.label, chansel); % find MEG sensor indices
    
    ROI                     = [];
    ROI.label               = {'x','y','z'};
    ROI.time                = data.time;
    
    for k = 1:length(data.trial)
        ROI.trial{k} = BMF_pow * data.trial{k}(chansel,:);
    end
        
    timeseries              = cat(2, ROI.trial{:});
    [u, s, v]               = svd(timeseries, 'econ');
    
    ROIchan{indx}.label     = cellstr(AAL90_labels{indx});
    ROIchan{indx}.time      = ROI.time;
    for m = 1:length(ROI.trial)
        ROIchan{indx}.trial{m} = u(:,1)' * BMF_pow * data.trial{m}(chansel,:);
    end
    
    % add important other info from data
    ROIchan{indx}.trialinfo   = data.trialinfo;
    ROIchan{indx}.sampleinfo  = data.sampleinfo;
    ROIchan{indx}.fsample     = data.fsample;
    ROIchan{indx}.grad        = data.grad;

end

% append data
cfg           = [];
AAL90_EC_KETpost = ft_appenddata(cfg, ROIchan{:});

% save output
save(['.\VIRTCHAN\DATA\', subjectdata.subjnr, '_AAL90_EC_KETpost'], 'AAL90_EC_KETpost', '-V7.3')

clear all
end
