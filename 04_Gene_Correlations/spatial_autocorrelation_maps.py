import pandas as pd
import numpy as np
import nibabel
import matplotlib
import scipy
import sklearn
import pingouin as pg

import brainsmash.workbench
import brainsmash

import matplotlib



from brainsmash.mapgen.base import Base
brain_map_file_gamma = "D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/gamma_EC.txt"  # use absolute paths if necessary!
brain_map_file_slope = "D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/slope_EC.txt"  # use absolute paths if necessary!

#dist_mat_file = "D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/distmat.npy"
dist_mat_file = "D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/symmetric_distance_matrix.txt"

base_gamma = Base(x=brain_map_file_gamma, D=dist_mat_file, pv=10)
base_slope = Base(x=brain_map_file_slope, D=dist_mat_file, pv=10)

#from brainsmash.mapgen.eval import base_fit
# from brainsmash.utils.eval import sampled_fit  analogous function for Sampled class
#base_fit(brain_map_file, dist_mat_file, nsurr=100,nh=40)

surrogates_gamma = base_gamma(n=1000)
surrogates_slope = base_slope(n=1000)

np.save("D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/surrogates_gamma",surrogates_gamma)
np.save("D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/surrogates_slope",surrogates_slope)


np.load("D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/surrogates_gamma.npy")
np.load("D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/surrogates_slope.npy")

############################
# gamma

# load gene data
PV = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/PV_mni.txt')
SST = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/SST_mni.txt')
VIP = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/VIP_mni.txt')
GRIN2A = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/GRIN2A_mni.txt')
GRIN2B = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/GRIN2B_mni.txt')
GRIN2C = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/GRIN2C_mni.txt')
GRIN2D = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/GRIN2D_mni.txt')

# generate null models of correlations for gamma
null_PV_corr = []
null_SST_corr = []
null_VIP_corr = []
null_GRIN2A_corr = []
null_GRIN2B_corr = []
null_GRIN2C_corr = []
null_GRIN2D_corr = []
for i in range(len(surrogates_gamma)):
    df = pd.DataFrame({'gamma': surrogates_gamma[i,:],'PV': PV, 'SST': SST,'VIP': VIP, 'GRIN2A': GRIN2A, 'GRIN2B': GRIN2B,  'GRIN2C': GRIN2C, 'GRIN2D': GRIN2D})
    corr_PV = pg.partial_corr(data=df, x='gamma', y='PV', covar=['SST','VIP','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
    null_PV_corr.append(float(corr_PV.r[0]))
    corr_SST = pg.partial_corr(data=df, x='gamma', y='SST', covar=['PV','VIP','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
    null_SST_corr.append(float(corr_SST.r[0]))
    corr_VIP = pg.partial_corr(data=df, x='gamma', y='VIP', covar=['PV','SST','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
    null_VIP_corr.append(float(corr_VIP.r[0]))
    corr_GRIN2A = pg.partial_corr(data=df, x='gamma', y='GRIN2A', covar=['PV','SST','VIP','GRIN2B','GRIN2C','GRIN2D'])
    null_GRIN2A_corr.append(float(corr_GRIN2A.r[0]))
    corr_GRIN2B = pg.partial_corr(data=df, x='gamma', y='GRIN2B', covar=['PV','SST','VIP','GRIN2A','GRIN2C','GRIN2D'])
    null_GRIN2B_corr.append(float(corr_GRIN2B.r[0]))
    corr_GRIN2C = pg.partial_corr(data=df, x='gamma', y='GRIN2C', covar=['PV','SST','VIP','GRIN2A','GRIN2B','GRIN2D'])
    null_GRIN2C_corr.append(float(corr_GRIN2C.r[0]))
    corr_GRIN2D = pg.partial_corr(data=df, x='gamma', y='GRIN2D', covar=['PV','SST','VIP','GRIN2A','GRIN2B','GRIN2C'])
    null_GRIN2D_corr.append(float(corr_GRIN2D.r[0]))

# calculate calculations of real gamma values and gene data
gamma = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/gamma_EC.txt')
df = pd.DataFrame({'gamma': gamma,'PV': PV, 'SST': SST,'VIP': VIP, 'GRIN2A': GRIN2A, 'GRIN2B': GRIN2B,  'GRIN2C': GRIN2C, 'GRIN2D': GRIN2D})
corr_gamma_PV = pg.partial_corr(data=df, x='gamma', y='PV', covar=['SST','VIP','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
corr_gamma_SST = pg.partial_corr(data=df, x='gamma', y='SST', covar=['PV','VIP','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
corr_gamma_VIP = pg.partial_corr(data=df, x='gamma', y='VIP', covar=['PV','SST','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
corr_gamma_GRIN2A = pg.partial_corr(data=df, x='gamma', y='GRIN2A', covar=['PV','SST','VIP','GRIN2B','GRIN2C','GRIN2D'])
corr_gamma_GRIN2B = pg.partial_corr(data=df, x='gamma', y='GRIN2B', covar=['PV','SST','VIP','GRIN2A','GRIN2C','GRIN2D'])
corr_gamma_GRIN2C = pg.partial_corr(data=df, x='gamma', y='GRIN2C', covar=['PV','SST','VIP','GRIN2A','GRIN2B','GRIN2D'])
corr_gamma_GRIN2D = pg.partial_corr(data=df, x='gamma', y='GRIN2D', covar=['PV','SST','VIP','GRIN2A','GRIN2B','GRIN2C'])

#np.percentile(PV_corr,95)
#np.percentile(VIP_corr,97.5)

# calculate percentiles for statistics (p-value doubled because of two-sided test)
scipy.stats.percentileofscore(null_PV_corr,corr_gamma_PV.r[0]) # r=0.679, perc= 99.7, p=0.006
scipy.stats.percentileofscore(null_SST_corr,corr_gamma_SST.r[0]) # r=0.283, perc= 74, p=0.52
scipy.stats.percentileofscore(null_VIP_corr,corr_gamma_VIP.r[0]) # r=0.012, perc= 52.2, p=0.96
scipy.stats.percentileofscore(null_GRIN2A_corr,corr_gamma_GRIN2A.r[0]) # r=-0.393, perc= 8.1, p=0.16
scipy.stats.percentileofscore(null_GRIN2B_corr,corr_gamma_GRIN2B.r[0]) # r=0.174, perc= 75.8, p=0.46
scipy.stats.percentileofscore(null_GRIN2C_corr,corr_gamma_GRIN2C.r[0]) # r=0.113, perc= 67.2, p=0.66
scipy.stats.percentileofscore(null_GRIN2D_corr,corr_gamma_GRIN2D.r[0]) # r=0.202, perc= 81.2, p=0.38

#matplotlib.pyplot.hist(null_SST_corr)

# standard deviation of null distribution (= standard error)
np.std(null_PV_corr) # 0.276
np.std(null_SST_corr) # 0.40
np.std(null_VIP_corr) # 0.216
np.std(null_GRIN2A_corr) # 0.269
np.std(null_GRIN2B_corr) # 0.259
np.std(null_GRIN2C_corr) # 0.260
np.std(null_GRIN2D_corr) # 0.215

######
# slope

# generate null models of correlations for slope
null_PV_slope = []
null_SST_slope = []
null_VIP_slope = []
null_GRIN2A_slope = []
null_GRIN2B_slope = []
null_GRIN2C_slope = []
null_GRIN2D_slope = []
for i in range(len(surrogates_slope)):
    df = pd.DataFrame({'slope': surrogates_slope[i,:],'PV': PV, 'SST': SST,'VIP': VIP, 'GRIN2A': GRIN2A, 'GRIN2B': GRIN2B,  'GRIN2C': GRIN2C, 'GRIN2D': GRIN2D})
    corr_PV = pg.partial_corr(data=df, x='slope', y='PV', covar=['SST','VIP','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
    null_PV_slope.append(float(corr_PV.r[0]))
    corr_SST = pg.partial_corr(data=df, x='slope', y='SST', covar=['PV','VIP','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
    null_SST_slope.append(float(corr_SST.r[0]))
    corr_VIP = pg.partial_corr(data=df, x='slope', y='VIP', covar=['PV','SST','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
    null_VIP_slope.append(float(corr_VIP.r[0]))
    corr_GRIN2A = pg.partial_corr(data=df, x='slope', y='GRIN2A', covar=['PV','SST','VIP','GRIN2B','GRIN2C','GRIN2D'])
    null_GRIN2A_slope.append(float(corr_GRIN2A.r[0]))
    corr_GRIN2B = pg.partial_corr(data=df, x='slope', y='GRIN2B', covar=['PV','SST','VIP','GRIN2A','GRIN2C','GRIN2D'])
    null_GRIN2B_slope.append(float(corr_GRIN2B.r[0]))
    corr_GRIN2C = pg.partial_corr(data=df, x='slope', y='GRIN2C', covar=['PV','SST','VIP','GRIN2A','GRIN2B','GRIN2D'])
    null_GRIN2C_slope.append(float(corr_GRIN2C.r[0]))
    corr_GRIN2D = pg.partial_corr(data=df, x='slope', y='GRIN2D', covar=['PV','SST','VIP','GRIN2A','GRIN2B','GRIN2C'])
    null_GRIN2D_slope.append(float(corr_GRIN2D.r[0]))

# calculate calculations of real slope values and gene data
slope = np.loadtxt('D:/PROJECTS/KETAMINE-RS/SCRIPTS/03a_Additional_Analyses/slope_EC.txt')
df = pd.DataFrame({'slope': slope,'PV': PV, 'SST': SST,'VIP': VIP, 'GRIN2A': GRIN2A, 'GRIN2B': GRIN2B,  'GRIN2C': GRIN2C, 'GRIN2D': GRIN2D})
corr_slope_PV = pg.partial_corr(data=df, x='slope', y='PV', covar=['SST','VIP','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
corr_slope_SST = pg.partial_corr(data=df, x='slope', y='SST', covar=['PV','VIP','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
corr_slope_VIP = pg.partial_corr(data=df, x='slope', y='VIP', covar=['PV','SST','GRIN2A','GRIN2B','GRIN2C','GRIN2D'])
corr_slope_GRIN2A = pg.partial_corr(data=df, x='slope', y='GRIN2A', covar=['PV','SST','VIP','GRIN2B','GRIN2C','GRIN2D'])
corr_slope_GRIN2B = pg.partial_corr(data=df, x='slope', y='GRIN2B', covar=['PV','SST','VIP','GRIN2A','GRIN2C','GRIN2D'])
corr_slope_GRIN2C = pg.partial_corr(data=df, x='slope', y='GRIN2C', covar=['PV','SST','VIP','GRIN2A','GRIN2B','GRIN2D'])
corr_slope_GRIN2D = pg.partial_corr(data=df, x='slope', y='GRIN2D', covar=['PV','SST','VIP','GRIN2A','GRIN2B','GRIN2C'])

#np.percentile(PV_corr,95)
#np.percentile(VIP_corr,97.5)

# calculate percentiles for statistics (p-value doubled because of two-sided test)
scipy.stats.percentileofscore(null_PV_slope,corr_slope_PV.r[0]) # r=-0.671, perc= 0.5, p=0.010
scipy.stats.percentileofscore(null_SST_slope,corr_slope_SST.r[0]) # r=-0.363, perc= 20.3, p=0.406
scipy.stats.percentileofscore(null_VIP_slope,corr_slope_VIP.r[0]) # r=0.200, perc= 82.6, p=0.348
scipy.stats.percentileofscore(null_GRIN2A_slope,corr_slope_GRIN2A.r[0]) # r=0.424, perc= 94.1, p=0.12
scipy.stats.percentileofscore(null_GRIN2B_slope,corr_slope_GRIN2B.r[0]) # r=-0.236, perc= 17.7, p=0.35
scipy.stats.percentileofscore(null_GRIN2C_slope,corr_slope_GRIN2C.r[0]) # r=-0.165, perc= 28.6, p=0.57
scipy.stats.percentileofscore(null_GRIN2D_slope,corr_slope_GRIN2D.r[0]) # r=-0.426, perc= 1.9, p=0.04


# standard deviation of null distribution (= standard error)
np.std(null_PV_slope) # 0.280
np.std(null_SST_slope) # 0.398
np.std(null_VIP_slope) # 0.211
np.std(null_GRIN2A_slope) # 0.266
np.std(null_GRIN2B_slope) # 0.256
np.std(null_GRIN2C_slope) # 0.262
np.std(null_GRIN2D_slope) # 0.211
