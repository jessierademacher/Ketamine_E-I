clear

labels_new = {'LCAL','LMTG','LCUN','LSOG','LIOG','LFFG','LPreCG', 'LPoCG',...
   'LPCG','LPCUN','LMOG','LSTG','LSMG','LSMA','LDCG','LSPG',...
   'LSFGdor','LIPL','LPCL','LACG','LSFGmed','LORBsupmed','LORBinf',...
   'LMFG','LIFGoperc','LIFGtriang','LREC','LORBmid','LORBsup','LROL',...
   'LINS','LTPOsup','LPHG','LITG','LANG','LLING'}';


AAL36_list = [
            [-7, -79, 6];    % LCAL
            [-56, -34, -2];  % LMTG
            [-6, -80, 27];   % LCUN
            [-17, -84, 28];  % LSOG
            [-36, -78, -8];  % LIOG
            [-31, -40, -20]; % LFFG
            [-39, -6, 51];	 % LPreCG
            [-40, -23, 49];  % LPoCG
            [-5, -43, 25];   % LPCG
            [-7, -56, 48];   % LPCUN
            [-32, -73, 16];  % LMOG
            [-53, -21, 7];   % LSTG
            [-56, -34, 30];  % LSMG
            [-5, 5, 61];     % LSMA
            [-5, -15, 42];   % LDCG
            [-23, -56, 50];  % LSPG
            [-18, 35, 42];   % LSFGdor
            [-43, -45, 43];  % LIPL
            [-8, -25, 68];   % LPCL
            [-4, 35, 14];    % LACG
            [-5, 49, 31];    % LSFGmed
            [-5, 54, -7];    % LORBsupmed
            [-36, 31, -12];  % LORBinf
            [-33, 33, 36];   % LMFG
            [-48, 13, 19];   % LIFGoperc
            [-46, 30, 14];   % LIFGtriang
            [-5, 37, -18];   % LREC
            [-31, 50, -10];  % LORBmid
            [-17, 47, -13];  % LORBsup
            [-47, -8, 14];   % LROL
            [-35, 7, 3];     % LINS
            [-40, 15, -20];  % LTPOsup
            [-22, -16, -21]; % LPHG
            [-50, -28, -23]; % LITG
            [-43, -58, 35];  % LANG
            [-15, -68, -5];  % LLING        
    ];

writematrix(AAL36_list, "D:\PROJECTS\KETAMINE-RS\SCRIPTS\03a_Additional_Analyses\aal36_mni.txt",'Delimiter','tab');



D = pdist2(AAL36_list,AAL36_list) % euclidian distance
writematrix(D, "D:\PROJECTS\KETAMINE-RS\SCRIPTS\03a_Additional_Analyses\symmetric_distance_matrix.txt",'Delimiter','tab');


%%%%%%%% gene data

% load cifti data
SST = ft_read_cifti('D:\PROJECTS\thesis_writing\Literature\Burt_et_al_2018_Hierarchy_Vj_Kx5n\SST.pscalar.nii');
sst_values = SST.pscalar;
clear SST

PV = ft_read_cifti('D:\PROJECTS\thesis_writing\Literature\Burt_et_al_2018_Hierarchy_Vj_Kx5n\PVALB.pscalar.nii');
pv_values = PV.pscalar;
clear PV

GRIN2A = ft_read_cifti('D:\PROJECTS\thesis_writing\Literature\Burt_et_al_2018_Hierarchy_Vj_Kx5n\GRIN2A.pscalar.nii');
grin2a_values = GRIN2A.pscalar;
clear GRIN2A

GRIN2B = ft_read_cifti('D:\PROJECTS\thesis_writing\Literature\Burt_et_al_2018_Hierarchy_Vj_Kx5n\GRIN2B.pscalar.nii');
grin2b_values = GRIN2B.pscalar;
clear GRIN2B

GRIN2C = ft_read_cifti('D:\PROJECTS\thesis_writing\Literature\Burt_et_al_2018_Hierarchy_Vj_Kx5n\GRIN2C.pscalar.nii');
grin2c_values = GRIN2C.pscalar;
clear GRIN2C

GRIN2D = ft_read_cifti('D:\PROJECTS\thesis_writing\Literature\Burt_et_al_2018_Hierarchy_Vj_Kx5n\GRIN2D.pscalar.nii');
grin2d_values = GRIN2D.pscalar;
clear GRIN2D

VIP = ft_read_cifti('D:\PROJECTS\thesis_writing\Literature\Burt_et_al_2018_Hierarchy_Vj_Kx5n\VIP.pscalar.nii');
vip_values = VIP.pscalar;
clear VIP

% for conversion of HCP MMP1 to AAL
aal_labels = readtable('D:\PROJECTS\KETAMINE-RS\SCRIPTS\03a_Additional_Analyses\HCP_MMP1_in_AAL.xlsx');
labels = aal_labels(1:180,2);

% means over AAL regions
grouped = table(table2array(labels), pv_values, sst_values, vip_values, grin2a_values, grin2b_values, grin2c_values, grin2d_values);
values_mean = grpstats(grouped,"Var1");
values_new = table2array(values_mean(:,3:9));


writematrix(values_new(:,7),"D:\PROJECTS\KETAMINE-RS\SCRIPTS\03a_Additional_Analyses\GRIN2D_mni.txt",'Delimiter','tab')



%% ketamine effects

load D:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_AAL90_EC_PLAdiff_FFT_norm_dft2
load D:\PROJECTS\KETAMINE-RS\GRANDAVG\GA12_AAL90_EC_KETdiff_FFT_norm_dft2
data_gamma_EC = GA12_KETdiff_EC;
data_gamma_EC.powspctrm = GA12_KETdiff_EC.powspctrm - GA12_PLAdiff_EC.powspctrm;


% for gamma data: average over frequencies
cfg                  = [];
cfg.frequency        = [30 90]; 
cfg.avgoverfreq      = 'yes';
data_gamma_EC_avg       = ft_selectdata(cfg, data_gamma_EC);

%% match labels

labels_new = {'LCAL','LMTG','LCUN','LSOG','LIOG','LFFG','LPreCG', 'LPoCG',...
   'LPCG','LPCUN','LMOG','LSTG','LSMG','LSMA','LDCG','LSPG',...
   'LSFGdor','LIPL','LPCL','LACG','LSFGmed','LORBsupmed','LORBinf',...
   'LMFG','LIFGoperc','LIFGtriang','LREC','LORBmid','LORBsup','LROL',...
   'LINS','LTPOsup','LPHG','LITG','LANG','LLING'}';


cfg                  = [];
cfg.channel          = labels_new;
data_slope_EO_subset    = ft_selectdata(cfg, data_EO);
data_slope_EC_subset    = ft_selectdata(cfg, data_EC);
data_gamma_EO_subset    = ft_selectdata(cfg, data_gamma_EO_avg);
data_gamma_EC_subset    = ft_selectdata(cfg, data_gamma_EC_avg);

MEG_labels = data_slope_EO_subset.label;

c = [];
for i=1:length(labels_new)
    label = labels_new(i);
    a = find(strcmp(MEG_labels,label));
    c(i) = a;
end

MEG_labels_new = MEG_labels(c);

MEG_slope_EC = data_slope_EC_subset.powspctrm(c,2);
MEG_gamma_EC = data_gamma_EC_subset.powspctrm(c);

writematrix(MEG_gamma_EC, "D:\PROJECTS\KETAMINE-RS\SCRIPTS\03a_Additional_Analyses\gamma_EC.txt",'Delimiter','tab');
writematrix(MEG_slope_EC, "D:\PROJECTS\KETAMINE-RS\SCRIPTS\03a_Additional_Analyses\slope_EC.txt",'Delimiter','tab');

