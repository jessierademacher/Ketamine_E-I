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


condition <- c("Control","PV -10", "PV -20", "PV -40", "PV -60")
spikes_pyr <- c(0.744, 0.797, 0.814, 1.005, 1.573)
se_pyr <- c(0.023, 0.029, 0.028, 0.031, 0.042)
spikes_sst <- c(5.8, 6, 6.3, 7.49, 10.56)
se_sst <- c(0.19,0.165, 0.196, 0.175, 0.259)
spikes_pv <- c(9.8, 9.736, 9.214, 9.821, 11.543)
se_pv <- c(0.414, 0.389, 0.469, 0.466, 0.431)
spikes_vip <- c(3.619, 3.919, 3.806, 4.831, 8.244)
se_vip <- c(0.166, 0.149, 0.17, 0.162, 0.209)

PV_cond <- data.frame(condition, spikes_pyr, se_pyr, spikes_sst, se_sst, spikes_pv, se_pv, spikes_vip, se_vip)
PV_cond$condition <- factor(PV_cond$condition, levels = c("Control","PV -10", "PV -20", "PV -40", "PV -60"), labels = c("Control","PV\n-10%", "PV\n-20%", "PV\n-40%", "PV\n-60%"))

# Pyr
ggplot(PV_cond, aes(x=condition,y=spikes_pyr)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_pyr-se_pyr, ymax=spikes_pyr+se_pyr), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(0.75,1,1.25,1.5,1.75), limits=c(0.7,1.75)) +
  scale_y_continuous(breaks=c(0.25,0.5,0.75,1.0,1.25,1.5,1.75),limits=c(0.3,1.75)) +
  labs(y="Spike Rate Pyr", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_pvconds_Pyr_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# PV
ggplot(PV_cond, aes(x=condition,y=spikes_pv)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_pv-se_pv, ymax=spikes_pv+se_pv), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(9,11,13,15,17),limits=c(8.5,17)) +
  scale_y_continuous(breaks=c(5,7,9,11,13,15,17),limits=c(5,17)) +
  labs(y="Spike Rate PV", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_pvconds_PV_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


# SST
ggplot(PV_cond, aes(x=condition,y=spikes_sst)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_sst-se_sst, ymax=spikes_sst+se_sst), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(6,8,10,12)) +
  scale_y_continuous(breaks=c(3,5,7,9,11),limits=c(2.8,11)) +
  labs(y="Spike Rate SST", x="") +
  theme_minimal()

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_pvconds_SST.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


# VIP
ggplot(PV_cond, aes(x=condition,y=spikes_vip)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_vip-se_vip, ymax=spikes_vip+se_vip), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(4,6,8)) +
  #scale_y_continuous(breaks=c(3,5,7,9),limits=c(3,9)) +
  scale_y_continuous(breaks=c(1,3,5,7,9),limits=c(1,9)) +
  labs(y="Spike Rate VIP", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_pvconds_VIP_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)



###########################
######## SST conditions

condition <- c("Control","SST -40", "SST -60", "SST -80", "SST -100")
spikes_pyr <- c(0.744, 0.87, 0.976, 1.093, 1.224)
se_pyr <- c(0.023, 0.023, 0.033, 0.035, 0.04)
spikes_sst <- c(5.8, 5.44, 4.31, 4.05, 3)
se_sst <- c(0.19, 0.161, 0.195, 0.171, 0.161)
spikes_pv <- c(9.8, 11.307, 13.343, 14.036, 16.071)
se_pv <- c(0.414, 0.482, 0.523, 0.544, 0.655)
spikes_vip <- c(3.619, 4.219, 4.625, 5.594, 6.194)
se_vip <- c(0.166, 0.179, 0.171, 0.182, 0.192)

SST_cond <- data.frame(condition, spikes_pyr, se_pyr, spikes_sst, se_sst, spikes_pv, se_pv, spikes_vip, se_vip)
SST_cond$condition <- factor(SST_cond$condition, levels = condition, labels = c("Control","SST\n-40%", "SST\n-60%", "SST\n-80%", "SST\n-100%"))

# Pyr
ggplot(SST_cond, aes(x=condition,y=spikes_pyr)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_pyr-se_pyr, ymax=spikes_pyr+se_pyr), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(0.8,1.0,1.2)) +
  #scale_y_continuous(breaks=c(0.75,1,1.25,1.5,1.75),limits=c(0.7,1.75)) +
  scale_y_continuous(breaks=c(0.25,0.5,0.75,1.0,1.25,1.5,1.75),limits=c(0.3,1.75)) +
  labs(y="Spike Rate Pyr", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_sstconds_Pyr_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# PV
ggplot(SST_cond, aes(x=condition,y=spikes_pv)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_pv-se_pv, ymax=spikes_pv+se_pv), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(9,11,13,15,17),limits=c(8.5,17)) +
  scale_y_continuous(breaks=c(5,7,9,11,13,15,17),limits=c(5,17)) +
  labs(y="Spike Rate PV", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_sstconds_PV_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# SST
ggplot(SST_cond, aes(x=condition,y=spikes_sst)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_sst-se_sst, ymax=spikes_sst+se_sst), width=.17,
                position=position_dodge(.9)) +
  scale_y_continuous(breaks=c(3,5,7,9,11),limits=c(2.8,11)) +
  labs(y="Spike Rate SST", x="") +
  theme_minimal()

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_sstconds_SST.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# VIP
ggplot(SST_cond, aes(x=condition,y=spikes_vip)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_vip-se_vip, ymax=spikes_vip+se_vip), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(3,5,7,9),limits=c(3,9)) +
  scale_y_continuous(breaks=c(1,3,5,7,9),limits=c(1,9)) +
  labs(y="Spike Rate VIP", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_sstconds_VIP_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


###########################
######## other conditions with gamma increase

condition <- c("Control","PV+SST -40", "interneurons -40", "spike rate -40")
spikes_pyr <- c(0.744, 1.571, 1.331, 1.059)
se_pyr <- c(0.023, 0.044, 0.04, 0.035)
spikes_sst <- c(5.8, 7.73, 7.67, 6.78)
se_sst <- c(0.19, 0.192, 0.221, 0.209)
spikes_pv <- c(9.8, 13.843, 12.614, 10.236)
se_pv <- c(0.414, 0.559, 0.522, 0.478)
spikes_vip <- c(3.619, 8.256, 4.838, 4.994)
se_vip <- c(0.166, 0.222, 0.184, 0.181)

others_cond <- data.frame(condition, spikes_pyr, se_pyr, spikes_sst, se_sst, spikes_pv, se_pv, spikes_vip, se_vip)
others_cond$condition <- factor(others_cond$condition, levels = condition, labels = c("Control","PV+SST\n-40%", "interneurons\n-40%", "spike rate"))

# Pyr
ggplot(others_cond, aes(x=condition,y=spikes_pyr)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_pyr-se_pyr, ymax=spikes_pyr+se_pyr), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(0.75,1,1.25,1.5,1.75), limits=c(0.7,1.75)) +
  scale_y_continuous(breaks=c(0.25,0.5,0.75,1.0,1.25,1.5,1.75),limits=c(0.3,1.75)) +
  labs(y="Spike Rate Pyr", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_otherconds_Pyr_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# PV
ggplot(others_cond, aes(x=condition,y=spikes_pv)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_pv-se_pv, ymax=spikes_pv+se_pv), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(10,12,14)) +
  #scale_y_continuous(breaks=c(9,11,13,15,17),limits=c(8.5,17)) +
  scale_y_continuous(breaks=c(5,7,9,11,13,15,17),limits=c(5,17)) +
  labs(y="Spike Rate PV", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_otherconds_PV_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# SST
ggplot(others_cond, aes(x=condition,y=spikes_sst)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_sst-se_sst, ymax=spikes_sst+se_sst), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(6,7,8)) +
  scale_y_continuous(breaks=c(3,5,7,9,11),limits=c(2.8,11)) +
  labs(y="Spike Rate SST", x="") +
  theme_minimal()

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_otherconds_SST.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# VIP
ggplot(others_cond, aes(x=condition,y=spikes_vip)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_vip-se_vip, ymax=spikes_vip+se_vip), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(4,6,8)) +
  #scale_y_continuous(breaks=c(3,5,7,9),limits=c(3,9)) +
  scale_y_continuous(breaks=c(1,3,5,7,9),limits=c(1,9)) +
  labs(y="Spike Rate VIP", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_otherconds_VIP_new.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


##########################
############# other conditions: no gamma increase

condition <- c("Control","VIP -80", "Pyr -40", "Pyr -80", "Neurons -40")
spikes_pyr <- c(0.744, 0.641, 0.464, 0.355, 0.689)
se_pyr <- c(0.023, 0.022, 0.012, 0.015, 0.023)
spikes_sst <- c(5.8, 6.2, 4.39, 3.33, 4.96)
se_sst <- c(0.19,0.147,0.141, 0.183, 0.179)
spikes_pv <- c(9.8, 8.721, 6.429, 5.343, 7.136)
se_pv <- c(0.414, 0.336, 0.334, 0.27, 0.274)
spikes_vip <- c(3.619, 1.169, 1.9, 1.331, 2.313)
se_vip <- c(0.166, 0.095, 0.1, 0.09, 0.123)

oth_cond <- data.frame(condition, spikes_pyr, se_pyr, spikes_sst, se_sst, spikes_pv, se_pv, spikes_vip, se_vip)
oth_cond$condition <- factor(oth_cond$condition, levels = c("Control","VIP -80", "Pyr -40", "Pyr -80", "Neurons -40"), labels = c("Control","VIP\n-80%", "Pyr\n-40%", "Pyr\n-80%", "neurons\n-40%"))

# Pyr
ggplot(oth_cond, aes(x=condition,y=spikes_pyr)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_pyr-se_pyr, ymax=spikes_pyr+se_pyr), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(0.75,1,1.25,1.5,1.75), limits=c(0.7,1.75)) +
  scale_y_continuous(breaks=c(0.25,0.5,0.75,1.0,1.25,1.5,1.75),limits=c(0.3,1.75)) +
  labs(y="Spike Rate Pyr", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_othconds_Pyr.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# PV
ggplot(oth_cond, aes(x=condition,y=spikes_pv)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_pv-se_pv, ymax=spikes_pv+se_pv), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(9,11,13,15,17),limits=c(8.5,17)) +
  scale_y_continuous(breaks=c(5,7,9,11,13,15,17),limits=c(5,17)) +
  labs(y="Spike Rate PV", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_othconds_PV.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# SST
ggplot(oth_cond, aes(x=condition,y=spikes_sst)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_sst-se_sst, ymax=spikes_sst+se_sst), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(6,7,8)) +
  scale_y_continuous(breaks=c(3,5,7,9,11),limits=c(2.8,11)) +
  labs(y="Spike Rate SST", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_othconds_SST.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

# VIP
ggplot(oth_cond, aes(x=condition,y=spikes_vip)) +
  geom_point(size=1.2) +
  geom_errorbar(aes(ymin=spikes_vip-se_vip, ymax=spikes_vip+se_vip), width=.17,
                position=position_dodge(.9)) +
  #scale_y_continuous(breaks=c(4,6,8)) +
  scale_y_continuous(breaks=c(1,3,5,7,9),limits=c(1,9)) +
  labs(y="Spike Rate VIP", x="") +
  theme_minimal()

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/simulation/spikes_oth_VIP.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 3.5,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)
