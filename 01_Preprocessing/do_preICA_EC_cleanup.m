%% clean-up before fastICA
clear 
eval('Subject14');

%% 0) load data and concatenate conditions
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApre_preICA_ds']);
PLApre = data_ds;
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_PLApost_preICA_ds']);
PLApost = data_ds;
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpre_preICA_ds']);
KETpre = data_ds;
eval(['load ' subjectdata.outputdir filesep subjectdata.subjnr '_EC_KETpost_preICA_ds']);
KETpost = data_ds;

% select same 266 channels for all
cfg                 = [];
cfg.channel         = {'MLC11','MLC12','MLC13','MLC14','MLC15','MLC16','MLC17','MLC21','MLC22','MLC23',...
                       'MLC24','MLC25','MLC31','MLC32','MLC41','MLC42','MLC51','MLC52','MLC53','MLC54',...
                       'MLC55','MLC61','MLC62','MLC63','MLF11','MLF12','MLF13','MLF14','MLF21','MLF22',...
                       'MLF23','MLF24','MLF25','MLF31','MLF32','MLF33','MLF34','MLF35','MLF41','MLF42',...
                       'MLF43','MLF44','MLF45','MLF46','MLF51','MLF52','MLF53','MLF54','MLF55','MLF56',...
                       'MLF61','MLF62','MLF63','MLF64','MLF65','MLF66','MLF67','MLO11','MLO12','MLO13',...
                       'MLO14','MLO21','MLO22','MLO23','MLO24','MLO31','MLO32','MLO33','MLO34','MLO41',...
                       'MLO42','MLO43','MLO44','MLO51','MLO52','MLO53','MLP11','MLP21','MLP22','MLP23',...
                       'MLP31','MLP32','MLP33','MLP34','MLP35','MLP41','MLP42','MLP43','MLP44','MLP45',...
                       'MLP51','MLP52','MLP53','MLP54','MLP55','MLP56','MLP57','MLT11','MLT12','MLT13',...
                       'MLT14','MLT15','MLT16','MLT21','MLT22','MLT23','MLT24','MLT25','MLT26','MLT27',...
                       'MLT31','MLT32','MLT33','MLT34','MLT35','MLT36','MLT37','MLT42','MLT43','MLT44',...
                       'MLT45','MLT46','MLT47','MLT51','MLT52','MLT53','MLT54','MLT55','MLT56','MLT57',...
                       'MRC11','MRC13','MRC15','MRC16','MRC17','MRC21','MRC22','MRC23','MRC24','MRC31',...
                       'MRC32','MRC41','MRC42','MRC51','MRC52','MRC53','MRC54','MRC55','MRC61','MRC62',...
                       'MRC63','MRF11','MRF12','MRF13','MRF14','MRF21','MRF23','MRF25','MRF31','MRF32',...
                       'MRF33','MRF34','MRF35','MRF41','MRF42','MRF43','MRF44','MRF45','MRF46','MRF51',...
                       'MRF52','MRF53','MRF54','MRF55','MRF56','MRF61','MRF62','MRF63','MRF64','MRF65',...
                       'MRF66','MRF67','MRO11','MRO12','MRO13','MRO14','MRO21','MRO22','MRO23','MRO24',...
                       'MRO31','MRO32','MRO33','MRO34','MRO41','MRO42','MRO43','MRO44','MRO51','MRO52',...
                       'MRO53','MRP11','MRP12','MRP21','MRP22','MRP23','MRP31','MRP32','MRP33','MRP34',...
                       'MRP35','MRP41','MRP42','MRP43','MRP44','MRP45','MRP51','MRP52','MRP53','MRP54',...
                       'MRP55','MRP57','MRT11','MRT12','MRT13','MRT14','MRT15','MRT16','MRT22','MRT23',...
                       'MRT24','MRT25','MRT26','MRT27','MRT31','MRT32','MRT33','MRT34','MRT35','MRT36',...
                       'MRT37','MRT41','MRT42','MRT43','MRT44','MRT45','MRT46','MRT47','MRT51','MRT52',...
                       'MRT53','MRT54','MRT55','MRT56','MRT57','MZC01','MZC02','MZC03','MZC04','MZF01',...
                       'MZF02','MZF03','MZO01','MZO02','MZO03','MZP01'};
cfg.avgoverchan     = 'no';
PLApre2             = ft_selectdata(cfg, PLApre);
PLApost2            = ft_selectdata(cfg, PLApost);
KETpre2             = ft_selectdata(cfg, KETpre);
KETpost2            = ft_selectdata(cfg, KETpost);

cfg                 = [];
cfg.keepsampleinfo  = 'no'; 
data                = ft_appenddata (cfg, PLApre2, PLApost2, KETpre2, KETpost2);

% trialinfo for each cond: PLApre=0, PLApost=1, KETpre=2, KETpost=3 
data.trialinfo = [zeros(length(PLApre2.trial),1); ones(length(PLApost2.trial),1); 2*ones(length(KETpre2.trial),1); 3*ones(length(KETpost2.trial),1)];
clear data_ds PLApre* PLApost* KETpre* KETpost*


%% 1) VISUALLY CLEAN DATA FROM MUSCLE ARTIFACTS using only rim sensors
% write down trial number for later removal during summary view
% do not use output of these functions directly; read in data again or
% don't quit but close last figure
cfg                     = [];
cfg.channel             = {'MLF11','MLF12','MLF13','MLF14','MLT31','MLT41','MLT51','MLT52',...
                           'MLT53','MLT54','MLT55','MLT56','MLT57','MLO53','MLO52','MLO51',...
                           'MRF11','MRF12','MRF13','MRF14','MRT31','MRT41','MRT51','MRT52',...
                           'MRT53','MRT54','MRT55','MRT56','MRT57','MRO53','MRO52','MRO51'};
cfg.keepchannel         = 'yes';
dummy                   = ft_selectdata(cfg, data);

cfg                     = [];
cfg.method              = 'trial';
% cfg.ylim                = 5e-13; 
cfg.megscale            = 1;
cfg.layout              = 'CTF275.lay';
% The following settings are usefull for identifying muscle artifacts:
cfg.preproc.bpfilter    = 'yes';
cfg.preproc.bpfreq      = [110 140];
cfg.preproc.bpfiltord   =  8;
cfg.preproc.bpfilttype  = 'but';
dummy2                  = ft_rejectvisual(cfg, dummy);

%% 2) VISUALLY CLEAN DATA AGAIN, removing outliers
% just type in trail nrs found to be excluded, before you continue

cfg             = [];
cfg.channel     = 'MEG';
dummy           = ft_selectdata(cfg, data);
    
cfg             = [];
cfg.method      = 'summary';
cfg.layout      = 'CTF275.lay';
data_preICA     = ft_rejectvisual(cfg, dummy);
clear dummy


% save preICA data
save([subjectdata.outputdir, '\', subjectdata.subjnr, '_EC_data_preICA'], 'data_preICA', '-V7.3')
clear 
