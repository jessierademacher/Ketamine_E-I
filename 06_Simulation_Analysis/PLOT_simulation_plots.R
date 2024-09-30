rm(list = ls())

options(scipen = 999)


if(dir.exists('D:/PROJECTS/KETAMINE-RS/GRANDAVG')){
  .libPaths("D:/SOFTWARE/rpackages")
  setwd('D:/PROJECTS/KETAMINE-RS/GRANDAVG/new')
} else if(dir.exists('E:/PROJECTS/KETAMINE-RS/GRANDAVG')){
  .libPaths("E:/SOFTWARE/rpackages")
  setwd('E:/PROJECTS/KETAMINE-RS/GRANDAVG/new')
}

library(tidyverse)
library(ggplot2)
library(ggpubr)
library(scales)


###################################
############ spectrum plot frac: simulations

file = 'spectrum_frac_simulations_new.csv'
data_frac <- read.csv(file, sep=',')

# for adding standard error of the mean
file = 'spectrum_frac_se_simulations_new.csv'
data_se <- read.csv(file, sep=',')

# longformat
frac <- data.frame('Frequency' = rep(data_frac$frequencies,23),
                   'Power' = c(data_frac$control, data_frac$PV_80, data_frac$SST_80, data_frac$PV_SST_80,
                               data_frac$interneurons_80,data_frac$neurons_80,data_frac$spike.rate_80,
                               data_frac$PV_70,data_frac$PV_60, data_frac$PV_40, data_frac$PV_20, 
                               data_frac$SST_100,data_frac$SST_60,data_frac$SST_40,data_frac$VIP_80,
                               data_frac$spike.rate_40,data_frac$excit_PV_85, data_frac$PV_SST_40,
                               data_frac$interneurons_40, data_frac$PV_10, data_frac$Pyr_80,
                               data_frac$Pyr_40, data_frac$neurons_40),
                   'Condition' = c(rep('Control', nrow(data_frac)), rep('PV_80', nrow(data_frac)), 
                                   rep('SST_80', nrow(data_frac)), rep('PV+SST_80', nrow(data_frac)), 
                                   rep('interneurons_80', nrow(data_frac)), rep('neurons_80', nrow(data_frac)), 
                                   rep('spike_rate_80', nrow(data_frac)),rep('PV_70', nrow(data_frac)),
                                   rep('PV_60', nrow(data_frac)),rep('PV_40', nrow(data_frac)),
                                   rep('PV_20', nrow(data_frac)),
                                   rep('SST_100', nrow(data_frac)),rep('SST_60', nrow(data_frac)),
                                   rep('SST_40', nrow(data_frac)),rep('VIP_80', nrow(data_frac)),
                                   rep('spike_rate_40', nrow(data_frac)),rep('excit_PV_85', nrow(data_frac)),
                                   rep('PV+SST_40', nrow(data_frac)),rep('interneurons_40', nrow(data_frac)),
                                   rep('PV_10', nrow(data_frac)),rep('Pyr_80', nrow(data_frac)),
                                   rep('Pyr_40', nrow(data_frac)), rep('neurons_40', nrow(data_frac))),
                   'upper' = c(data_frac$control+data_se$control, data_frac$PV_80+data_se$PV_80,
                               data_frac$SST_80+data_se$SST_80, data_frac$PV_SST_80+data_se$PV_SST_80,
                               data_frac$interneurons_80+data_se$interneurons_80, data_frac$neurons_80+data_se$neurons_80,
                               data_frac$spike.rate_80+data_se$spike.rate_80, data_frac$PV_70+data_se$PV_70,
                               data_frac$PV_60+data_se$PV_60, data_frac$PV_40+data_se$PV_40,
                               data_frac$PV_20+data_se$PV_20,
                               data_frac$SST_100+data_se$SST_100, data_frac$SST_60+data_se$SST_60,
                               data_frac$SST_40+data_se$SST_40,data_frac$VIP_80+data_se$VIP_80,
                               data_frac$spike.rate_40+data_se$spike.rate_40,data_frac$excit_PV_85+data_se$excit_PV_85,
                               data_frac$PV_SST_40+data_se$PV_SST_40,data_frac$interneurons_40+data_se$interneurons_40,
                               data_frac$PV_10+data_se$PV_10,data_frac$Pyr_80+data_se$Pyr_80,
                               data_frac$Pyr_40+data_se$Pyr_40,data_frac$neurons_40+data_se$neurons_40),
                   'lower' = c(data_frac$control-data_se$control, data_frac$PV_80-data_se$PV_80,
                               data_frac$SST_80-data_se$SST_80, data_frac$PV_SST_80-data_se$PV_SST_80,
                               data_frac$interneurons_80-data_se$interneurons_80, data_frac$neurons_80-data_se$neurons_80,
                               data_frac$spike.rate_80-data_se$spike.rate_80, data_frac$PV_70-data_se$PV_70,
                               data_frac$PV_60-data_se$PV_60, data_frac$PV_40-data_se$PV_40,
                               data_frac$PV_20-data_se$PV_20,
                               data_frac$SST_100-data_se$SST_100, data_frac$SST_60-data_se$SST_60,
                               data_frac$SST_40-data_se$SST_40,data_frac$VIP_80-data_se$VIP_80,
                               data_frac$spike.rate_40-data_se$spike.rate_40,data_frac$excit_PV_85-data_se$excit_PV_85,
                               data_frac$PV_SST_40-data_se$PV_SST_40,data_frac$interneurons_40-data_se$interneurons_40,
                               data_frac$PV_10-data_se$PV_10,data_frac$Pyr_80-data_se$Pyr_80,
                               data_frac$Pyr_40-data_se$Pyr_40,data_frac$neurons_40-data_se$neurons_40))
                   
frac$Condition <- factor(frac$Condition, levels=c('PV_80','SST_100','SST_80','PV+SST_80','interneurons_80','neurons_80',
                                                  'spike_rate_80','PV_70','PV_60','PV_40','PV_20',
                                                  'SST_60','SST_40','VIP_80','spike_rate_40','excit_PV_85',
                                                  'PV+SST_40','interneurons_40','PV_10','Pyr_80','Pyr_40',
                                                  'neurons_40','Control'), 
                         labels=c('PV_80','SST_100','SST_80','PV+SST_80','interneurons_80','neurons_80','spike_rate_80',
                                  'PV_70','PV_60','PV_40','PV_20','SST_60','SST_40','VIP_80',
                                  'spike_rate_40','excit_PV_85','PV+SST_40','interneurons_40','PV_10','Pyr_80',
                                  'Pyr_40','neurons_40','Control'))



# not log-scaled

ggplot(frac, aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  #scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  #scale_color_manual(values=c("black","grey","#B34A58","green","blue","violet","orange")) +
  scale_x_continuous(breaks=seq(0,90,10))+
  labs(x="Frequency (Hz)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum",suffix,".pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


# log-scaled (power)

q = ggplot(frac, aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  #scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  #scale_color_manual(values=c("black","grey","#B34A58","green","blue","violet","orange")) +
  scale_x_continuous(breaks=seq(0,90,10))+
  # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
  #               labels = trans_format("log10", math_format(10^.x)))+
  labs(x="Frequency (Hz)", y="Power (log)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_y_log10(); q
  #scale_y_log10(breaks=c(4e-07,8e-06,1.2e-06,1.6e-06,2e-06,2.4e-06,2.8e-06,3.2e-06,3.6e-06,4e-06),
  #              minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04)); q


ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_log_simulation.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


# log-log-scaled

p = ggplot(frac, aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  #scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  #scale_color_manual(values=c("black","grey","#B34A58","green","blue","violet","orange")) +
  # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
  #               labels = trans_format("log10", math_format(10^.x)))+
  # scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
  #               labels = trans_format("log10", math_format(10^.x)))+
  labs(x="Frequency (Hz) (log)", y="Power (log)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_log10(breaks=c(7,10,20,30,40,50,60,70,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10() ; p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_loglog_simulation.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


# PV conditions
p = ggplot(subset(frac, Condition %in% "Control" | Condition %in% "PV_10"| Condition %in% "PV_60" | Condition %in% "PV_40" | Condition %in% "PV_20"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.5) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#e09fa8","#8fcbf2","#0072bd","black"), labels=c("PV -60%","PV -40%", "PV -20%", "PV -10%", "Control")) +
  scale_linetype_manual(values=c("solid","solid", "solid","solid","dotted"), labels=c("PV -60%","PV -40%", "PV -20%", "PV -10%", "Control")) +
  labs(x="Frequency (log, Hz)", y="Power (log, a.u.)")+
  theme_minimal() +
  theme(axis.title.x = element_text(size = 8),
        axis.title.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = c(0.80,0.80),
        legend.key.width = unit(0.4, 'cm'),
        legend.key.height = unit(0.15, 'cm'),
        legend.text = element_text(size=8),
        legend.margin = margin(0, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0,0.1,0.1,0.1,"cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_log10(breaks=c(7,10,20,30,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10(labels = trans_format("log10", math_format(10^.x))) ; p


ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/Aperiodic_spectrum_loglog_simulation_PV_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 6.5,
  height = 5.5,
  units = c("cm"),
  dpi = 400,
  limitsize = TRUE,
  bg = NULL
)


# SST conditions
p = ggplot(subset(frac, Condition %in% "Control" | Condition %in% "SST_80" |Condition %in% "SST_100" | Condition %in% "SST_60" | Condition %in% "SST_40"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.5) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#e09fa8","#8fcbf2","#0072bd","black"), labels=c("SST -100%","SST -80%", "SST -60%", "SST -40%", "Control")) +
  scale_linetype_manual(values=c("solid","solid", "solid","solid","dotted"), labels=c("SST -100%","SST -80%", "SST -60%", "SST -40%", "Control")) +
  labs(x="Frequency (log, Hz)", y="Power (log, a.u.)")+
  theme_minimal() +
  theme(axis.title.x = element_text(size = 8),
        axis.title.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = c(0.79,0.83),
        legend.key.width = unit(0.4, 'cm'),
        legend.key.height = unit(0.15, 'cm'),
        legend.text = element_text(size=8),
        legend.margin = margin(0, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0,0.1,0.1,0.1,"cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_log10(breaks=c(7,10,20,30,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10(labels = trans_format("log10", math_format(10^.x))) ;p
  

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/Aperiodic_spectrum_loglog_simulation_SST_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 6.5,
  height = 5.5,
  units = c("cm"),
  dpi = 400,
  limitsize = TRUE,
  bg = NULL
)

# VIP conditions
p = ggplot(subset(frac, Condition %in% "Control" | Condition %in% "VIP_80"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","black"), labels=c("VIP -80%","Control")) +
  scale_linetype_manual(values=c( "solid","dotted"), labels=c("VIP -80%","Control")) +
  labs(x="Frequency (Hz) (log)", y="Power (log)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_log10(breaks=c(7,10,20,30,40,50,60,70,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10(labels = trans_format("log10", math_format(10^.x))) ; p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/Aperiodic_spectrum_loglog_simulation_VIP_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# Pyr conditions
p = ggplot(subset(frac, Condition %in% "Control" | Condition %in% "Pyr_80" | Condition %in% "Pyr_40" | Condition %in% "VIP_80" ), 
           aes(x=Frequency, y=Power, colour = Condition,linetype=Condition)) +
  geom_line(linewidth=0.5) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#0072bd","#B34A58","#e09fa8","black"), labels=c("VIP -80%","Pyr -80%","Pyr -40%","Control")) +
  scale_linetype_manual(values=c("solid","solid","solid","dotted"), labels=c("VIP -80%","Pyr -80%","Pyr -40%","Control")) +
  labs(x="Frequency (log, Hz)", y="Power (log, a.u.)")+
  theme_minimal() +
  theme(axis.title.x = element_text(size = 8),
        axis.title.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = c(0.80,0.80),
        legend.key.width = unit(0.4, 'cm'),
        legend.key.height = unit(0.15, 'cm'),
        legend.text = element_text(size=8),
        legend.margin = margin(0, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0,0.1,0.1,0.1,"cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_log10(breaks=c(7,10,20,30,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10(labels = trans_format("log10", math_format(10^.x))) ; p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/Aperiodic_spectrum_loglog_simulation_VIP_Pyr_notnorm.pdf", sep=""),
  plot = p,
  device = NULL,
  path = NULL,
  scale = 1,
  width = 6.5,
  height = 5.5,
  units = c("cm"),
  dpi = 400,
  limitsize = TRUE,
  bg = NULL
)


# Pyr + VIP + all neurons 
p = ggplot(subset(frac, Condition %in% "Control" | Condition %in% "Pyr_80" | Condition %in% "Pyr_40" | Condition %in% "VIP_80" | Condition %in% "neurons_40"), 
           aes(x=Frequency, y=Power, colour = Condition,linetype=Condition)) +
  geom_line(linewidth=0.5) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#0072bd","#B34A58","#e09fa8","#8fcbf2","black"), labels=c("VIP -80%","Pyr -80%","Pyr -40%","all -40%","Control")) +
  scale_linetype_manual(values=c("solid","solid","solid","solid","dotted"), labels=c("VIP -80%","Pyr -80%","Pyr -40%","all -40%","Control")) +
  labs(x="Frequency (log, Hz)", y="Power (log, a.u.)")+
  theme_minimal() +
  theme(axis.title.x = element_text(size = 8),
        axis.title.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = c(0.80,0.80),
        legend.key.width = unit(0.4, 'cm'),
        legend.key.height = unit(0.15, 'cm'),
        legend.text = element_text(size=8),
        legend.margin = margin(0, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0,0.1,0.1,0.1,"cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_log10(breaks=c(7,10,20,30,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10(labels = trans_format("log10", math_format(10^.x))) ; p

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/Aperiodic_spectrum_loglog_simulation_VIP_Pyr_all_notnorm.pdf", sep=""),
  plot = p,
  device = NULL,
  path = NULL,
  scale = 1,
  width = 6.5,
  height = 5.5,
  units = c("cm"),
  dpi = 400,
  limitsize = TRUE,
  bg = NULL
)



# other conditions
p = ggplot(subset(frac, Condition %in% "Control" | Condition %in% "PV+SST_40" | Condition %in% "interneurons_40" | Condition %in% "neurons_40" | Condition %in% "spike_rate_40"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#f0c5ca","#0072bd","#8fcbf2", "black"), labels=c("spike rate -40", "PV+SST -40","PV+SST+VIP -40","PV+SST+VIP+Pyr -40","Control")) +
  #scale_linetype_manual(values=c("dotted", "solid","solid", "solid")) +
  labs(x="Frequency (Hz) (log)", y="Power (log)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        #legend.position = c(0.8, 0.8),
        legend.position="top",
        legend.box="vertical",
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.1)) +
  scale_x_log10(breaks=c(7,10,20,30,40,50,60,70,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10(labels = trans_format("log10", math_format(10^.x))) +
  guides(color = guide_legend(nrow = 2));p

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/Aperiodic_spectrum_loglog_simulation_someothers_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# other conditions: interneurons
p = ggplot(subset(frac, Condition %in% "Control" | Condition %in% "PV+SST_40" | Condition %in% "interneurons_40"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#0072bd","#B34A58","black"), labels=c("PV+SST -40%","PV+SST+VIP -40%","Control")) +
  scale_linetype_manual(values=c("solid","solid", "dotted"), labels=c("PV+SST -40%","PV+SST+VIP -40%","Control")) +
  labs(x="Frequency (Hz) (log)", y="Power (log)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        #legend.position="top",
        #legend.box="vertical",
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.1)) +
  scale_x_log10(breaks=c(7,10,20,30,40,50,60,70,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10(labels = trans_format("log10", math_format(10^.x))) ;p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/Aperiodic_spectrum_loglog_simulation_interneurons_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# other conditions: all neurons
p = ggplot(subset(frac, Condition %in% "Control" | Condition %in% "neurons_40" | Condition %in% "spike_rate_40"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#0072bd", "black"), labels=c("PV-40% SST-20% VIP-15% Pyr-5%", "PV-40% SST-40% VIP-40% Pyr-40%","Control")) +
  scale_linetype_manual(values=c("solid","solid","dotted"), labels=c("PV-40% SST-20% VIP-15% Pyr-5%", "PV-40% SST-40% VIP-40% Pyr-40%","Control")) +
  labs(x="Frequency (Hz) (log)", y="Power (log)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        #legend.position = c(0.8, 0.8),
        legend.position="top",
        legend.box="vertical",
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.1)) +
  scale_x_log10(breaks=c(7,10,20,30,40,50,60,70,80),
                minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
  scale_y_log10(labels = trans_format("log10", math_format(10^.x))) +
  guides(color = guide_legend(nrow = 2));p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/Aperiodic_spectrum_loglog_simulation_all_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


##################### fit line


# add fit line
slope_file = 'slope_values_simulations.csv'
offset_file = 'offset_values_simulations.csv'
#fit_file = 'fit_values_PLA_KET_EO_7_80.csv'
data_slope <- read.csv(slope_file, sep=',', header=F)
data_offset <- read.csv(offset_file, sep=',', header=F)

#b <- data_fit$V1[1]
#s <- data_fit$V1[2]

fun.1 <- function(x) 10^data_offset$V1[1] * (1/(x^data_slope$V1[1])) # control
fun.2 <- function(x) 10^data_offset$V1[2] * (1/(x^data_slope$V1[2])) # PV
fun.3 <- function(x) 10^data_offset$V1[3] * (1/(x^data_slope$V1[3])) # SST
fun.4 <- function(x) 10^data_offset$V1[4] * (1/(x^data_slope$V1[4])) # PV+SST
fun.5 <- function(x) 10^data_offset$V1[5] * (1/(x^data_slope$V1[5])) # PV_60
fun.6 <- function(x) 10^data_offset$V1[6] * (1/(x^data_slope$V1[6])) # PV_40
fun.7 <- function(x) 10^data_offset$V1[7] * (1/(x^data_slope$V1[7])) # SST_60



# control
 r <- ggplot(subset(frac, Condition %in% "PV"), aes(x=Frequency, y=Power)) +
  geom_line(linewidth=0.8, alpha=0.4) +
  #scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  #scale_color_manual(values=c("white","white","white","black")) +
   labs(x="Frequency (Hz) (log)", y="Power (log)")+
  theme_minimal()

 # linear
 r + stat_function(fun = fun.4) +
   scale_x_continuous(breaks=seq(0,90,10))
 
 # log
 r + stat_function(fun = fun.4) +
   scale_x_continuous(breaks=seq(0,90,10)) +
   scale_y_log10()
 
 # log-log
 r + stat_function(fun = fun.4) +
   scale_x_log10(breaks=c(0,5,6,7,8,10,16,20,30,40,50,80,90),
                 minor_breaks=c(0,5,6,7,8,10,16,20,30,40,50,80,90)) +
   scale_y_log10()
 
 
 
 # all conditions with fit line
 r <- ggplot(frac, aes(x=Frequency, y=Power, colour = Condition)) +
   geom_line(linewidth=0.8, alpha=0.4) +
   #scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
   scale_color_manual(values=c("black","grey","#B34A58","green","blue","violet","orange")) +
   theme_minimal() +
   theme(legend.title = element_blank(),
         legend.position = c(0.8, 0.8),
         legend.text = element_text(size=10),
         legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
         legend.background = element_rect(fill="white", color="black", size=0.2)) +
   stat_function(fun = fun.1, colour="black",  alpha=1, linewidth=1.2) +
   stat_function(fun = fun.2, colour="grey",  alpha=1, linewidth=1.2) +
   stat_function(fun = fun.3, colour="#B34A58",  alpha=1, linewidth=1.2) +
   stat_function(fun = fun.4, colour="green",  alpha=1, linewidth=1.2) +
   stat_function(fun = fun.5, colour="blue",  alpha=1, linewidth=1.2) +
   stat_function(fun = fun.6, colour="violet",  alpha=1, linewidth=1.2) +
   stat_function(fun = fun.7, colour="orange",  alpha=1, linewidth=1.2) 
 
 
 # linear
 r +   scale_x_continuous(breaks=seq(0,90,10)) +
   labs(x="Frequency (Hz)", y="Power")
 
 # log
 r +    scale_x_continuous(breaks=seq(0,90,10)) +
   scale_y_log10()+
   labs(x="Frequency (Hz)", y="Power (log)")
 
 # log-log
 r +    scale_x_log10(breaks=c(7,10,20,30,40,50,60,70,80),
                 minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
   scale_y_log10() +
   labs(x="Frequency (Hz) (log)", y="Power (log)")



#####################################################
## spectrum for gamma (periodic or FFT)

 
 file = 'spectrum_FFT_simulations_new.csv'
 #file = 'spectrum_FFT_simulations_hanning_new.csv'
 data_FFT <- read.csv(file, sep=',')
 
 # for adding standard error of the mean
 file = 'spectrum_FFT_se_simulations_new.csv'
 #file = 'spectrum_FFT_se_simulations_hanning_new.csv'
 data_se <- read.csv(file, sep=',')

 FFT <- data.frame('Frequency' = rep(data_FFT$frequencies,23),
                    'Power' = c(data_FFT$control, data_FFT$PV_80, data_FFT$SST_80, data_FFT$PV_SST_80,
                                data_FFT$interneurons_80,data_FFT$neurons_80,data_FFT$spike.rate_80,
                                data_FFT$PV_70,data_FFT$PV_60, data_FFT$PV_40, data_FFT$PV_20, 
                                data_FFT$SST_100,data_FFT$SST_60,data_FFT$SST_40,data_FFT$VIP_80,
                                data_FFT$spike.rate_40,data_FFT$excit_PV_85, data_FFT$PV_SST_40,
                                data_FFT$interneurons_40,data_FFT$PV_10,data_FFT$Pyr_80,
                                data_FFT$Pyr_40,data_FFT$neurons_40),
                    'Condition' = c(rep('Control', nrow(data_FFT)), rep('PV_80', nrow(data_FFT)), 
                                    rep('SST_80', nrow(data_FFT)), rep('PV+SST_80', nrow(data_FFT)), 
                                    rep('interneurons_80', nrow(data_FFT)), rep('neurons_80', nrow(data_FFT)), 
                                    rep('spike_rate_80', nrow(data_FFT)),rep('PV_70', nrow(data_FFT)),
                                    rep('PV_60', nrow(data_FFT)),rep('PV_40', nrow(data_FFT)),
                                    rep('PV_20', nrow(data_FFT)),
                                    rep('SST_100', nrow(data_FFT)),rep('SST_60', nrow(data_FFT)),
                                    rep('SST_40', nrow(data_FFT)),rep('VIP_80', nrow(data_FFT)),
                                    rep('spike_rate_40', nrow(data_FFT)),rep('excit_PV_85', nrow(data_FFT)),
                                    rep('PV+SST_40', nrow(data_FFT)),rep('interneurons_40', nrow(data_FFT)),
                                    rep('PV_10', nrow(data_FFT)),rep('Pyr_80', nrow(data_FFT)),
                                    rep('Pyr_40', nrow(data_FFT)),rep('neurons_40', nrow(data_FFT))),
                   'upper' = c(data_FFT$control+data_se$control, data_FFT$PV_80+data_se$PV_80,
                               data_FFT$SST_80+data_se$SST_80, data_FFT$PV_SST_80+data_se$PV_SST_80,
                               data_FFT$interneurons_80+data_se$interneurons_80, data_FFT$neurons_80+data_se$neurons_80,
                               data_FFT$spike.rate_80+data_se$spike.rate_80, data_FFT$PV_70+data_se$PV_70,
                               data_FFT$PV_60+data_se$PV_60, data_FFT$PV_40+data_se$PV_40,
                               data_FFT$PV_20+data_se$PV_20,
                               data_FFT$SST_100+data_se$SST_100, data_FFT$SST_60+data_se$SST_60,
                               data_FFT$SST_40+data_se$SST_40, data_FFT$VIP_80+data_se$VIP_80,
                               data_FFT$spike.rate_40+data_se$spike.rate_40,data_FFT$excit_PV_85+data_se$excit_PV_85,
                               data_FFT$PV_SST_40+data_se$PV_SST_40,data_FFT$interneurons_40+data_se$interneurons_40,
                               data_FFT$PV_10+data_se$PV_10,data_FFT$Pyr_80+data_se$Pyr_80,
                               data_FFT$Pyr_40+data_se$Pyr_40,data_FFT$neurons_40+data_se$neurons_40),
                   'lower' = c(data_FFT$control-data_se$control, data_FFT$PV_80-data_se$PV_80,
                               data_FFT$SST_80-data_se$SST_80, data_FFT$PV_SST_80-data_se$PV_SST_80,
                               data_FFT$interneurons_80-data_se$interneurons_80, data_FFT$neurons_80-data_se$neurons_80,
                               data_FFT$spike.rate_80-data_se$spike.rate_80, data_FFT$PV_70-data_se$PV_70,
                               data_FFT$PV_60-data_se$PV_60, data_FFT$PV_40-data_se$PV_40,
                               data_FFT$PV_20-data_se$PV_20,
                               data_FFT$SST_100-data_se$SST_100, data_FFT$SST_60-data_se$SST_60,
                               data_FFT$SST_40-data_se$SST_40, data_FFT$VIP_80-data_se$VIP_80,
                               data_FFT$spike.rate_40-data_se$spike.rate_40,data_FFT$excit_PV_85-data_se$excit_PV_85,
                               data_FFT$PV_SST_40-data_se$PV_SST_40,data_FFT$interneurons_40-data_se$interneurons_40,
                               data_FFT$PV_10-data_se$PV_10,data_FFT$Pyr_80-data_se$Pyr_80,
                               data_FFT$Pyr_40-data_se$Pyr_40,data_FFT$neurons_40-data_se$neurons_40))

 
FFT$Condition <- factor(FFT$Condition, levels=c('PV_80','SST_100','SST_80','PV+SST_80','interneurons_80',
                                                'neurons_80','spike_rate_80','PV_70','PV_60','PV_40','PV_20',
                                                'SST_60','SST_40', 'VIP_80','spike_rate_40','excit_PV_85',
                                                'PV+SST_40','interneurons_40','PV_10','Pyr_80','Pyr_40','neurons_40',
                                                'Control'), 
                          labels=c('PV_80','SST_100','SST_80','PV+SST_80','interneurons_80','neurons_80',
                                   'spike_rate_80','PV_70','PV_60','PV_40','PV_20','SST_60','SST_40','VIP_80',
                                   'spike_rate_40','excit_PV_85','PV+SST_40','interneurons_40','PV_10','Pyr_80',
                                   'Pyr_40','neurons_40','Control'))
 

 
# full spectrum, not log-scaled

ggplot(FFT, aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  #scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  #scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(3,90))+
  scale_y_continuous(limits=c(0,0.0002)) +
  labs(x="Frequency (Hz)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))

# full spectrum, log-scaled

ggplot(FFT, aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
 # scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
 # scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(3,90))+
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x)))+
  labs(x="Frequency (Hz)", y="Power (log)")+
  labs(x="Frequency (Hz)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))

# 30-90Hz, not log-scaled

ggplot(FFT, aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  #scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  #scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90))+
  scale_y_continuous(limits=c(0,0.00002)) +
  labs(x="Frequency (Hz)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))


scientific_10 <- function(x) {
  parse(text=gsub("e", " %*% 10^", scales::scientific_format()(x)))
}

# PV conditions
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "PV_20" | Condition %in% "PV_10" | Condition %in% "PV_60" | Condition %in% "PV_40"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.5) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#e09fa8","#8fcbf2","#0072bd","black"), labels=c("PV -60%","PV -40%", "PV -20%", "PV -10%", "Control")) +
  scale_linetype_manual(values=c("solid","solid", "solid","solid","dotted"), labels=c("PV -60%","PV -40%", "PV -20%", "PV -10%", "Control")) +
  labs(x="Frequency (Hz)", y="Power (a.u.)")+
  theme_minimal() +
  theme(axis.title.x = element_text(size = 8),
        axis.title.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = c(0.80,0.80),
        legend.key.width = unit(0.4, 'cm'),
        legend.key.height = unit(0.15, 'cm'),
        legend.text = element_text(size=8),
        legend.margin = margin(0, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0,0.1,0.1,0.1,"cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90))+
  #scale_y_continuous(limits=c(0,0.0003));p
  scale_y_continuous(limits=c(0,1.2e-20),
                     breaks=c(0,3e-21,6e-21,9e-21,12e-21),
                     labels=scientific_10);p
                     
                     #labels = trans_format("log10", math_format(10^.x)));p
                     #labels = scientific); p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_30-90_simulation_PV_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 7,
  height = 5.5,
  units = c("cm"),
  dpi = 400,
  limitsize = TRUE,
  bg = NULL
)

# PV conditions: full spectrum
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "PV_10" |Condition %in% "PV_20" | Condition %in% "PV_60" | Condition %in% "PV_40"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#e09fa8","#8fcbf2","#0072bd","black"), labels=c("PV -60%", "PV -40%","PV -20%", "PV -10%", "Control")) +
  #scale_linetype_manual(values=c("dotted", "solid","solid", "solid")) +
  #scale_linetype_manual(values=c("solid","solid", "solid","solid","dotted"), labels=c("PV -60%","PV -40%", "PV -20%", "PV -10%", "Control")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  #scale_y_log10(labels=scientific)+
  scale_y_continuous(labels=scientific) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(0,90)); p
  #scale_y_continuous(limits=c(0,0.00006)); p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_simulation_PV_hanning_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# SST conditions
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "SST_80" |Condition %in% "SST_100" | Condition %in% "SST_60" | Condition %in% "SST_40"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype = Condition)) +
  geom_line(linewidth=0.5) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#e09fa8","#8fcbf2","#0072bd","black"), labels=c("SST -100%","SST -80%", "SST -60%", "SST -40%", "Control")) +
  scale_linetype_manual(values=c("solid","solid", "solid","solid","dotted"), labels=c("SST -100%","SST -80%", "SST -60%", "SST -40%", "Control")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(axis.title.x = element_text(size = 8),
        axis.title.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = c(0.78,0.80),
        legend.key.width = unit(0.4, 'cm'),
        legend.key.height = unit(0.15, 'cm'),
        legend.text = element_text(size=8),
        legend.margin = margin(0, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0,0.1,0.1,0.1,"cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90)) +
 # scale_y_continuous(limits=c(0,0.0004));p
  scale_y_continuous(limits=c(0,1.2e-20),
                     breaks=c(0,3e-21,6e-21,9e-21,12e-21),
                     labels=scientific_10);p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_30-90_simulation_SST_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 7,
  height = 5.5,
  units = c("cm"),
  dpi = 400,
  limitsize = TRUE,
  bg = NULL
)

# SST conditions full spectrum
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "SST_80" |Condition %in% "SST_100" | Condition %in% "SST_60" | Condition %in% "SST_40"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#e09fa8","#8fcbf2","#0072bd","black"), labels=c("SST -100%","SST -80%", "SST -60%", "SST -40%", "Control")) +
  #scale_linetype_manual(values=c("dotted", "solid","solid", "solid")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
scale_y_continuous(labels=scientific) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(0,90)) ;p
  scale_y_continuous(limits=c(0,0.00002)); p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_simulation_SST_hanning_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# VIP conditions
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "VIP_80"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","black"), labels=c("VIP -80%","Control")) +
  scale_linetype_manual(values=c("solid","dotted"), labels=c("VIP -80%","Control")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90)) +
 # scale_y_continuous(limits=c(0,0.0004));p
  scale_y_continuous(limits=c(0,1.2e-20),
                     labels = scientific); p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_30-90_simulation_VIP_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# VIP conditions full spectrum
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "VIP_80"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","black"), labels=c("VIP -80%","Control")) +
  #scale_linetype_manual(values=c("dotted", "solid","solid", "solid")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_y_continuous(labels=scientific) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(0,90)) ;p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_simulation_VIP_hanning_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# Pyr conditions
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "Pyr_80" | Condition %in% "Pyr_40"| Condition %in% "VIP_80"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.5) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#0072bd","#B34A58","#e09fa8","black"), labels=c("VIP -80%","Pyr -80%","Pyr -40%","Control")) +
  scale_linetype_manual(values=c("solid","solid","solid","dotted"), labels=c("VIP -80%","Pyr -80%","Pyr -40%","Control")) +
  labs(x="Frequency (Hz)", y="Power (a.u.)")+
  theme_minimal() +
  theme(axis.title.x = element_text(size = 8),
        axis.title.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = c(0.78,0.80),
        legend.key.width = unit(0.4, 'cm'),
        legend.key.height = unit(0.15, 'cm'),
        legend.text = element_text(size=8),
        legend.margin = margin(0, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0,0.1,0.1,0.1,"cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90)) +
  # scale_y_continuous(limits=c(0,0.0004));p
  scale_y_continuous(limits=c(0,1.2e-20),
                     breaks=c(0,3e-21,6e-21,9e-21,12e-21),
                     labels=scientific_10);p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_30-90_simulation_VIP_Pyr_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 7,
  height = 5.5,
  units = c("cm"),
  dpi = 400,
  limitsize = TRUE,
  bg = NULL
)


# Pyr + VIP + all
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "Pyr_80" | Condition %in% "Pyr_40"| Condition %in% "VIP_80" | Condition %in% "neurons_40"), 
           aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.5) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#0072bd","#B34A58","#e09fa8","#8fcbf2","black"), labels=c("VIP -80%","Pyr -80%","Pyr -40%","all -40%","Control")) +
  scale_linetype_manual(values=c("solid","solid","solid","solid","dotted"), labels=c("VIP -80%","Pyr -80%","Pyr -40%","all -40%","Control")) +
  labs(x="Frequency (Hz)", y="Power (a.u.)")+
  theme_minimal() +
  theme(axis.title.x = element_text(size = 8),
        axis.title.y = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = c(0.78,0.80),
        legend.key.width = unit(0.4, 'cm'),
        legend.key.height = unit(0.15, 'cm'),
        legend.text = element_text(size=8),
        legend.margin = margin(0, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0,0.1,0.1,0.1,"cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90)) +
  # scale_y_continuous(limits=c(0,0.0004));p
  scale_y_continuous(limits=c(0,1.2e-20),
                     breaks=c(0,3e-21,6e-21,9e-21,12e-21),
                     labels=scientific_10);p

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_30-90_simulation_VIP_Pyr_all_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 7,
  height = 5.5,
  units = c("cm"),
  dpi = 400,
  limitsize = TRUE,
  bg = NULL
)

# Pyr conditions full spectrum
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "Pyr_80" | Condition %in% "Pyr_40"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#e09fa8","black"), labels=c("Pyr -80%", "Pyr -40%","Control")) +
  #scale_linetype_manual(values=c("dotted", "solid","solid", "solid")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_y_continuous(labels=scientific) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(0,90)) ;p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_simulation_Pyr_hanning_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


# other conditions full spectrum
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "neurons_40" | Condition %in% "spike_rate_40" | Condition %in% "PV+SST_40" | Condition %in% "interneurons_40"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#0072bd","#e09fa8","#8fcbf2","black"), labels=c("spike rate -40", "PV+SST -40", "interneurons -40","PV+SST+VIP+Pyr -40", "Control")) +
  #scale_linetype_manual(values=c("dotted", "solid","solid", "solid")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_y_continuous(labels=scientific) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(0,90)) ;p

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_simulation_someothers_hanning_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# other conditions: interneurons
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "PV+SST_40" | Condition %in% "interneurons_40"), 
           aes(x=Frequency, y=Power, colour = Condition,linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#0072bd","#B34A58", "black"), labels=c("PV+SST -40%", "PV+SST+VIP -40%", "Control")) +
  scale_linetype_manual(values=c("solid","solid", "dotted"), labels=c("PV+SST -40%", "PV+SST+VIP -40%", "Control")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90)) +
  #scale_y_continuous(limits=c(0,0.0004));p
  scale_y_continuous(limits=c(0,1.2e-20),
                     labels = scientific); p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_30-90_simulation_interneurons_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# other conditions: interneurons full spectrum
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "PV+SST_40" | Condition %in% "interneurons_40"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#0072bd","#B34A58", "black"), labels=c("PV+SST -40%", "PV+SST+VIP -40%", "Control")) +
  #scale_linetype_manual(values=c("solid","solid", "dotted"), labels=c("PV+SST -40%", "PV+SST+VIP -40%", "Control")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_y_continuous(labels=scientific) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(0,90)) ;p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_simulation_interneurons_hanning_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# other conditions: all neurons
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "neurons_40" | Condition %in% "spike_rate_40"), 
           aes(x=Frequency, y=Power, colour = Condition,linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#0072bd","black"), labels=c("PV-40% SST-20% VIP-15% Pyr-5%", "PV-40% SST-40% VIP-40% Pyr-40%","Control")) +
  scale_linetype_manual(values=c("solid","solid", "dotted"), labels=c("PV-40% SST-20% VIP-15% Pyr-5%", "PV-40% SST-40% VIP-40% Pyr-40%","Control")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.65, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90)) +
  #scale_y_continuous(limits=c(0,0.0004));p
  scale_y_continuous(limits=c(0,1.2e-20),
                     labels = scientific); p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_30-90_simulation_all_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# other conditions: all neurons full spectrum
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "neurons_40" | Condition %in% "spike_rate_40"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","#0072bd","black"), labels=c("PV-40% SST-20% VIP-15% Pyr-5%", "PV-40% SST-40% VIP-40% Pyr-40%","Control")) +
  #scale_linetype_manual(values=c("solid","solid", "dotted"), labels=c("PV-40% SST-20% VIP-15% Pyr-5%", "PV-40% SST-40% VIP-40% Pyr-40%","Control")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.65, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_y_continuous(labels=scientific) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(0,90)) ;p

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_simulation_all_hanning_notnorm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)



# PV excit conditions
p = ggplot(subset(FFT, Condition %in% "Control" | Condition %in% "excit_PV_85"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_color_manual(values=c("#B34A58","black"), labels=c("PV -85 excit","Control")) +
  #scale_linetype_manual(values=c("dotted", "solid","solid", "solid")) +
  labs(x="Frequency (Hz)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
 # scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90)) +
  scale_y_continuous(limits=c(0,1e-20),
                     labels = scientific)+
#scale_y_continuous(labels=scientific) +
#  scale_y_continuous(limits=c(0,0.0004))+
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90)) ;p

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/FFT_30-90_simulation_excit_PV_85_norm.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 5.31,
  height = 4.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


# one condition
p = ggplot(subset(FFT, Condition %in% "Control"), 
           aes(x=Frequency, y=Power, colour = Condition)) +
  geom_line(linewidth=1) +
  #scale_color_manual(values=c("#802a35","#b56b75","#e09fa8","black"), labels=c("PV -80", "PV -60", "PV -40", "Control")) +
  #scale_linetype_manual(values=c("dotted", "solid","solid", "solid")) +
  labs(x="Frequency (Hz) (log)", y="Power")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2)) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(3,90)) +
  scale_y_continuous(limits=c(0,0.0003)); p
  #scale_y_log10() ;p



