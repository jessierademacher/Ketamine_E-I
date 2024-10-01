# Ketamine_E-I

This repository contains the scripts for the analysis of gamma-band and aperiodic slope alterations after sub-anesthetic Ketamine administration in 12 healthy volunteers, including the analysis of MEG data and computational modeling using a human cortical layer 2/3 model based on Yao et al. (2022), code available via:  https://doi.org/10.5281/zenodo.5771000.

Yao, H. K., Guet-McCreight, A., Mazza, F., Chameh, H. M., Prevot, T. D., Griffiths, J. D., ... & Hay, E. (2022). Reduced inhibition in depression impairs stimulus processing in human cortical microcircuits. Cell reports, 38(2).

# Short explanation of scripts:
Preprocessing:
- do_preICA_EC.m: segmenting, demeaning, notch-filtering, resampling data
- do_preICA_EC_cleanup.m: visually clean data from muscle artefacts and squid jumps
- do_fastICA_EC.m: perform independent component analysis
- do_fastICA_EC_cleanup.m: inspect independent component analysis results and reject bad components

Sensor Level Analysis
- do_dft_sensor_data.m: apply notch-filter with padding to remove remaining line noise
- do_FFTanalysis_norm.m: normalize data + hanning-tapered fast-fourier transform (0-90 Hz)
- Create_GA_sensors_FFT_norm.m: compute grand average of FFT transformed data over subjects
- PLOT_GA_sensor_FFT.m: create topoplots for FFT transformed data and inspect data at channel-level
- PLOT_GA_sensor_power.m: create topoplots for gamma-band power
- PLOT_GA_sensor_power_diff.m: create topoplots for difference in gamma-band power post-pre
- STATS_sensor_power_diff.m: cluster-based test for contrast Ketamine post-pre vs. Placebo post-pre gamma-band power + results plot

- do_IRASA_sensors_norm.m: normalize data + separate periodic and aperiodic component using IRASA
- Create_IRASA_FIT_output_sensors.m: Compute slope and offset of aperiodic component + slope differences post-pre + compute grand average of these estimates
- Create_GA_IRASA_sensors.m: Compute grand average of periodic and aperiodic spectral data over subjects
- PLOT_GA_sensor_IRASA_estimates.m: create topoplots of slope and offset estimates in all conditions
- PLOT_GA_sensor_IRASA_estimates_diff.m: create topoplots of difference in slope estimates post-pre
- PLOT_GA_sensor_IRASA_spectrum.m: inspect aperiodic spectral data on channel-level
- STATS_sensors_IRASA_estimates_diff.m: cluster-based test for contrast Ketamine post-pre vs. Placebo post-pre aperiodic slope estimates + results plot

Source Level Analysis
- do_dft_source_data.m: apply notch-filter with padding to remove remaining line noise
- do_create_AAL90_virtchan.m: compute virtual channel data in 90 AAL atlas regions
- do_AAL90_IRASA.m: normalize data + separate periodic and aperiodic component using IRASA
- do_AAL90_FFT_analysis_norm_hanning.m: normalize data + hanning-tapered fast-fourier transform (1-90 Hz)
- Create_GA_AAL90_FFT_norm_hanning.m: compute grand average of FFT transformed data over subjects
- Create_GA_AAL90_IRASA.m: Compute grand average of periodic and aperiodic spectral data over subjects
- STATS_AAL90_power_diff.m: statistical t-test for contrast Ketamine post-pre vs. Placebo post-pre gamma-band power
- STATS_AAL90_IRASA_estimates_diff.m: statistical t-test for contrast Ketamine post-pre vs. Placebo post-pre aperiodic slope estimates
- PLOT_prepare_plot_for_R.m: average data across significant regions and re-structure for easy plotting in R
- Source_Plots.R: create source level plots

Gene Correlations
- HPC_MMP1_to_MNI.m: convert coordinates of HPCMMP1 atlas regions into MNI coordinates
- MNI_to_AAL.R: give AAL region for MNI coordinates of each HPCMMP1 region
- prepare_gene_correlations.m: create symmetric Euclidian distance matrix of AAL regions (those of which we also have gene data), average gene data from the same AAL region, prepare gamma and slope data
- spatial_autocorrelation_maps.py: create surrogate maps using brainsmash, generate null models of correlations
- gene_expression_correlation.m: compute correlations and partial correlations of gene expressions and Ketamine effects
- gene_correlation_plots: create bar plots of correlations

Computational Modeling
For each condition, code is the same with the only difference: in the .mod files of respective manipulated connection (e.g. ProbAMPANMDA_pyrpv), the weight factor is reduced. Simulation were created by running “circuit_ketamine” (or “run_batch” for several simulations) in the respective folder

Simulation Analysis
- simulation_to_MEG.py: convert simulated neural activity to MEG signal 
- spike_rates.py: calculate spike rate and standard error by neuron type
- do_simulation_prepare_data.m: bring simulated MEG data into Fieldtrip structure + demean 
- do_simulation_FFT_analysis.m: hanning-tapered fast-fourier transform
- do_simulation_IRASA.m: separate periodic and aperiodic component using IRASA
- Create_IRASA_FIT_output_simulation.m: Compute slope and offset of aperiodic component
- stats_gamma_power.m: perform t-test for contrast baseline simulation vs. manipulated conditions gamma power
- stats_IRASA_FIT_estimates.m: perform t-test for contrast baseline simulation vs. manipulated conditions aperiodic slope
- PLOT_prepare_plot_for_R.m: re-structure data for easy plotting in R
- PLOT_simulation_plots.R: create frequency plots (gamma + aperiodic slope) for simulations
- PLOT_spike_rates.R: create spike rate plots




