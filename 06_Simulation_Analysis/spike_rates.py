import numpy as np
import matplotlib.pyplot as plt
import matplotlib.mlab as mlab
import seaborn as sns
import pandas as pd
import re
import pickle
import LFPy
import os
from scipy import signal as ss
from scipy.stats import sem

tstart = 1000
tstop = 3000


folder = 'C:/Users/OEM/Documents/Uni/02_Master/Master_Thesis/modelling/simulations/VIP_80/'
files = [f for f in os.listdir(folder) if re.match(r'SPIKES_Seed*', f)]



popnames = ['HL23PN1','HL23MN1','HL23BN1','HL23VN1']

# FOUR SPHERE MODEL PARAMS
radii = [79000., 80000., 85000., 90000.]  # (µm)
sigmas = [0.47, 1.71, 0.02, 0.41]  # (S/m) from Mazza et al., PLoS Comp Biol, 2023
r_electrodes = np.array([[0., 0., 90000.]])# (µm)
L23_pos = np.array([0., 0., 78275.])

fs = 40000

spike_stats = {}
eegs = {}
psds = {}
for file in files:
    # Spikes
    #filename = './EI-Balance/'+app+'/SPIKES_Seed'+str(seed)+'.npy'
    spikes = np.load(folder + file,allow_pickle=True).item(0)
    
    seed = str(re.findall(r'\d+', file)[0])

    PN = []
    MN = []
    BN = []
    VN = []
    spike_list = [PN ,MN, BN, VN]
    spike_means = []
    spike_stdev = []
    spike_se = []
    for i in range(4):
        for j in range(len(spikes['times'][i])):
            scount = spikes['times'][i][j][spikes['times'][i][j]>tstart]
            Hz = np.array([(scount.size)/((tstop-tstart)/1000)])
            spike_list[i].append(Hz)
        spike_means.append(np.mean(spike_list[i]))
        spike_stdev.append(np.std(spike_list[i]))
        spike_se.append(sem(spike_list[i]))
    spike_stats.update({str(seed): {'Mean': {'Pyr': spike_means[0],'MN': spike_means[1],'BN': spike_means[2],
                                             'VN': spike_means[3]}, 'Stdev': {'Pyr': spike_stdev[0],
                                             'MN': spike_stdev[1],'BN': spike_stdev[2],'VN': spike_stdev[3]}}})
                                                                              
print(spike_means)
print(spike_stdev)
print(spike_se)
    