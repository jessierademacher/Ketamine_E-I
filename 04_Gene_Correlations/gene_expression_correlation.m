clear

%% prepare gene data

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

%% load MEG data

% load MEG data: slope
% EO
load D:\PROJECTS\KETAMINE-RS\GRANDAVG\new\GA12_diff_diff_AAL90_frac_fit_EO_7_80
data_EO = GA12_diff_diff_AAL90_estimates_EO;

% EC
load D:\PROJECTS\KETAMINE-RS\GRANDAVG\new\GA12_diff_diff_AAL90_frac_fit_EC_7_80
data_EC = GA12_diff_diff_AAL90_estimates_EC;

% for combined EO and EC
load D:\PROJECTS\KETAMINE-RS\GRANDAVG\new\GA12_PLAdiff_AAL90_frac_fit_7_80
load D:\PROJECTS\KETAMINE-RS\GRANDAVG\new\GA12_KETdiff_AAL90_frac_fit_7_80

data = GA12_PLAdiff_AAL90_estimates;
data.powspctrm(:,2) = GA12_KETdiff_AAL90_estimates.powspctrm(:,2) - GA12_PLAdiff_AAL90_estimates.powspctrm(:,2);


% load MEG data: gamma

% EC
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
data_slope_EC_subset    = ft_selectdata(cfg, data_EC);
data_gamma_EC_subset    = ft_selectdata(cfg, data_gamma_EC_avg);

MEG_labels = data_slope_subset.label;

c = [];
for i=1:length(labels_new)
    label = labels_new(i);
    a = find(strcmp(MEG_labels,label));
    c(i) = a;
end

MEG_labels_new = MEG_labels(c);

MEG_slope_EC = data_slope_EC_subset.powspctrm(c,2);
MEG_gamma_EC = data_gamma_EC_subset.powspctrm(c);

%% Stats

% correlations
[r_s_EC,p_s_EC] = corrcoef([values_new MEG_slope_EC]) 
[r_g_EC,p_g_EC] = corrcoef([values_new MEG_gamma_EC]) 

addpath 'C:\Users\OEM\AppData\Roaming\MathWorks\MATLAB Add-Ons\Functions\fdr_bh';
FDR = fdr_bh(p_s(end,1:7))


% partial correlations
[rho_s_EC,pval_s_EC] = partialcorr([values_new MEG_slope_EC])
[rho_g_EC,pval_g_EC] = partialcorr([values_new MEG_gamma_EC])

FDR = fdr_bh(pval_s(end,1:7))





