import numpy as np
import matplotlib.pyplot as plt
import matplotlib.mlab as mlab
import seaborn as sns
import pandas as pd
import pickle
from lfpykit.eegmegcalc import NYHeadModel
from lfpykit.eegmegcalc import FourSphereVolumeConductor
from lfpykit.eegmegcalc import InfiniteHomogeneousVolCondMEG as MEG
import os
import re
import LFPy
from scipy import signal as ss


# define folder
folder = 'C:/Users/OEM/Documents/Uni/02_Master/Master_Thesis/modelling/simulations/VIP_80/'
files = [f for f in os.listdir(folder) if re.match(r'DIPOLEMOMENT_Seed*', f)]

for i,file in enumerate(files):

    # load dipolemoment file
    #dps = np.load('C:/Users/OEM/Documents/Uni/02_Master/Master_Thesis/modelling/simulations/PV_SST/DIPOLEMOMENT_Seed4015.npy')
    dps = np.load(folder + file)
    popnames = ['HL23PN1','HL23MN1','HL23BN1','HL23VN1']
    
    dp = dps['HL23PN1'] # summe aller dipole-momente
    for c,cellname in enumerate(dps.dtype.names):
        if c>0:
            dp=np.add(dp,dps[cellname])
    
    # FOUR SPHERE MODEL
    radii = [79000., 80000., 85000., 90000.]  # (µm) Radius der Kugeln
    sigmas = [0.47, 1.71, 0.02, 0.41]  # (S/m) from Mazza et al., PLoS Comp Biol, 2023 Leitfähigkeiten
    #sigmas = [0.047, 0.171, 0.02, 0.041]  # (S/m)
    r_electrodes = np.array([[0., 0., 90000.]])#, [0., 85000., 0.]]) # (µm) wo die Elektrode sitzt (in z-Richtung oben drüber)
    L23_pos = np.array([0., 0., 78275.]) # Mitte des Netzwerks, hier sitzt der Dipole
    #L23_pos = np.array([0., 0., 72500.])
    #sphere_model = LFPy.FourSphereVolumeConductor(r_electrodes,radii, sigmas)
    sphere_model = LFPy.FourSphereVolumeConductor(radii, sigmas,r_electrodes)
    # # current dipole moment
    #p = dp
    # # compute potential
    #signal = sphere_model.get_dipole_potential(p.transpose(), L23_pos)  # (mV)
    signal = sphere_model.calc_potential(dp, L23_pos)  # (mV)
    #%%
    
    #%%
    #time = np.arange(1000,3000,3000/(np.shape(signal)[1])) #geändert. vorher: (2000,30000,30000)
    eeg = signal[0]
    dt = 0.025
    fs = 1000./dt
    
    # remove first second
    startindex = int(1000*(1./dt)) #geändert. vorher 2000
    eeg_trial = eeg[startindex:]
    
    
    ## MEG part
    sensor_locations = np.array([[1E4,1E4,0],[-1E4,-1E4,0],[-1E4,1E4,0],[1E4,-1E4,0]])
    meg = MEG(sensor_locations)
    M = meg.get_transformation_matrix(L23_pos)
    H = M @ dp.transpose() 
    
    sensor1 = H[0]
    sensor2 = H[1]
    sensor3 = H[2]
    sensor4 = H[3]
    
    signal1 = np.empty(np.shape(sensor1)[1])
    for i in range(np.shape(sensor1)[1]):
        signal1[i] =  np.linalg.norm(sensor1[:,i])
        #signal1[i] = sensor1[0,i]

    signal2 = np.empty(np.shape(sensor2)[1])
    for i in range(np.shape(sensor2)[1]):
        signal2[i] =  np.linalg.norm(sensor2[:,i])

    signal3 = np.empty(np.shape(sensor3)[1])
    for i in range(np.shape(sensor3)[1]):
        signal3[i] =  np.linalg.norm(sensor3[:,i])
    
    signal4 = np.empty(np.shape(sensor4)[1])
    for i in range(np.shape(sensor4)[1]):
        signal4[i] =  np.linalg.norm(sensor4[:,i])
    
    signal1 = signal1[40000:]
    signal2 = signal2[40000:]
    signal3 = signal3[40000:]
    signal4 = signal4[40000:]
    
    meg_signal = np.sum([signal1,signal2,signal3,signal4],axis=0)/4. 

# downsample
    fs_new = 400
    nperseg = int(eeg_trial.shape[0]/((fs/fs_new)))
    meg_resampled = ss.resample(meg_signal, nperseg)

    seed_nr = str(re.findall(r'\d+', file)[0])

    # save
    #np.savetxt('C:/Users/OEM/Documents/Uni/02_Master/Master_Thesis/modelling/simulations/PV_SST/EEG_Seed4015.csv',eeg_resampled)
    np.savetxt(folder+'MEG_Seed'+seed_nr+'.csv', meg_resampled)


















