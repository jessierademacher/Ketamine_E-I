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

##################################################
############### slope value comparison 

# one or nothing has to set to TRUE
EO = FALSE
EC = TRUE

# one or nothing has to set to TRUE
hz_range_7_80 = TRUE
hz_range_3_90 = FALSE

if(EO==TRUE){
  if(hz_range_7_80==TRUE){
    file = "slope_values_PLA_KET_EO_7_80.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired_EO_7_80.pdf"
  } else if(hz_range_3_90==TRUE){
    file = "slope_values_PLA_KET_EO_3_90.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired_EO_3_90.pdf"
  } else {
    file = "slope_values_PLA_KET_EO.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired_EO.pdf"
  }
} else if(EC==TRUE){
  if(hz_range_7_80==TRUE){
    file = "slope_values_PLA_KET_EC_7_80.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired_EC_7_80.pdf"
  } else if(hz_range_3_90==TRUE){
    file = "slope_values_PLA_KET_EC_3_90.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired_EC_3_90.pdf"
  } else {
    file = "slope_values_PLA_KET_EC.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired_EC.pdf"
  }
} else {
  if(hz_range_7_80==TRUE){
    file = "slope_values_PLA_KET_7_80.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired_7_80.pdf"
  } else if(hz_range_3_90==TRUE){
    file = "slope_values_PLA_KET_3_90.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired_3_90.pdf"
  } else {
    file = "slope_values_PLA_KET.csv"
    filename = "E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Slope_difference_paired.pdf"
  }
}

data <- read.csv(file, sep=',', header=F)
colnames(data) <- c('Placebo', 'Ketamine')

# longformat
slope <- data.frame('Slope' = c(data$Placebo, data$Ketamine),
                    'Condition' = c(rep('Placebo', nrow(data)), rep('Ketamine', nrow(data))),
                    'ID' = rep(c(1:12),2))
slope$Condition <- factor(slope$Condition, levels=c('Placebo','Ketamine'), labels=c('Placebo','Ketamine'))



pj <- position_jitter(width=0.1, seed=9)
f <- ggplot(slope, aes(x=Condition, y=Slope))
f +
  lemon::geom_pointpath(aes(group=ID),
                        position = pj, distance=0.5,
                        linecolor = "grey", color="#696969", size=2, alpha=0.8)+
  stat_summary(
    fun.y="mean", 
    geom = "point", color = "black", size = 3
  )  +
    stat_summary(
    fun.data="mean_sdl", fun.args = list(mult=1),
    geom = "errorbar", color = "black", width = 0.1, linewidth=1.2
  ) +
  theme_minimal() +
  labs(y="Slope difference (post-pre)", x="") 



ggsave(
  filename,
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



############################################
################## gamma comparison

# one or nothing has to set to TRUE
EO = FALSE
EC = TRUE

# one or nothing has to set to TRUE (both FALSE: FFT)
periodic = FALSE
aperiodic = FALSE

if(EO==TRUE){
  if(periodic==TRUE){
    file = "gamma_values_PLA_KET_osci_EO.csv"
  } else if(aperiodic==TRUE){
    file = "gamma_values_PLA_KET_frac_EO.csv"
  } else {
    file = "gamma_values_PLA_KET_EO.csv"
  }
} else if(EC==TRUE){
  if(periodic==TRUE){
    file = "gamma_values_PLA_KET_osci_EC.csv"
  } else if(aperiodic==TRUE){
    file = "gamma_values_PLA_KET_frac_EC.csv"
  } else {
    file = "gamma_values_PLA_KET_EC.csv"
  }
} else {
  if(periodic==TRUE){
    file = "gamma_values_PLA_KET_osci.csv"
  } else if(aperiodic==TRUE){
    file = "gamma_values_PLA_KET_frac.csv"
  } else {
    file = "gamma_values_PLA_KET.csv"
  }
}

data <- read.csv(file, sep=',', header=F)
colnames(data) <- c('Placebo', 'Ketamine')

# longformat
gamma <- data.frame('Gamma' = c(data$Placebo, data$Ketamine),
                    'Condition' = c(rep('Placebo', nrow(data)), rep('Ketamine', nrow(data))),
                    'ID' = rep(c(1:12),2))
gamma$Condition <- factor(gamma$Condition, levels=c('Placebo','Ketamine'), labels=c('Placebo','Ketamine'))


# paired
pj <- position_jitter(width=0.1, seed=9)
ggplot(gamma, aes(x=Condition, y=Gamma))+ 
  lemon::geom_pointpath(aes(group=ID),
                        position = pj, distance=0.5,
                        linecolor = "grey", color="#696969", size=2, alpha=0.8)+
  stat_summary(
    fun.y="mean", 
    geom = "point", color = "black", size = 3
  )  +
  stat_summary(
    fun.data="mean_sdl", fun.args = list(mult=1),
    geom = "errorbar", color = "black", width = 0.1, linewidth=1.2
  ) +
  theme_minimal() +
  labs(y="Gamma difference (post-pre)", x="") 

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Gamma_difference_paired_EO.pdf", sep=""),
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



###################################
############ spectrum plot frac

# one or nothing has to set to TRUE
EO = FALSE
EC = TRUE

# one or nothing has to set to TRUE
hz_range_7_80 = TRUE
hz_range_3_90 = FALSE

if(EO==TRUE){
  if(hz_range_7_80==TRUE){
    file = "spectrum_frac_EO_7_80.csv"
    file_fit = "spectrum_frac_fit_EO_7_80.csv"
    file_se = 'spectrum_frac_se_EO_7_80.csv'
    suffix = "_EO_7_80"
  } else if(hz_range_3_90==TRUE){
    file = "spectrum_frac_EO_3_90.csv"
    file_fit = "spectrum_frac_fit_EO_3_90.csv"
    suffix = "_EO_3_90"
  } else {
    file = "spectrum_frac_EO.csv"
    file_fit = "spectrum_frac_fit_EO.csv"
    suffix = "_EO"
  }
} else if(EC==TRUE){
  if(hz_range_7_80==TRUE){
    file = "spectrum_frac_EC_7_80.csv"
    file_fit = "spectrum_frac_fit_EC_7_80.csv"
    file_se = 'spectrum_frac_se_EC_7_80.csv'
    suffix = "_EC_7_80"
  } else if(hz_range_3_90==TRUE){
    file = "spectrum_frac_EC_3_90.csv"
    file_fit = "spectrum_frac_fit_EC_3_90.csv"
    suffix = "_EC_3_90"
  } else {
    file = "spectrum_frac_EC.csv"
    file_fit = "spectrum_frac_fit_EC.csv"
    suffix = "_EC"
  }
} else {
  if(hz_range_7_80==TRUE){
    file = "spectrum_frac_7_80.csv"
    file_fit = "spectrum_frac_fit_7_80.csv"
    suffix = "_7_80"
  } else if(hz_range_3_90==TRUE){
    file = "spectrum_frac_3_90.csv"
    file_fit = "spectrum_frac_fit_3_90.csv"
    suffix = "_3_90"
  } else {
    file = "spectrum_frac.csv"
    file_fit = "spectrum_frac_fit.csv"
    suffix = ""
  }
}

data_frac <- read.csv(file, sep=',')

# for adding standard error of the mean
data_se <- read.csv(file_se, sep=',')

# longformat
frac <- data.frame('Frequency' = rep(data_frac$frequencies,4),
                   'Power' = c(data_frac$PLApre, data_frac$PLApost, data_frac$KETpre, data_frac$KETpost),
                   'Condition' = c(rep('Placebo pre', nrow(data_frac)), rep('Placebo post', nrow(data_frac)), 
                                    rep('Ketamine pre', nrow(data_frac)), rep('Ketamine post', nrow(data_frac))),
                   'upper' = c(data_frac$PLApre+data_se$PLApre, data_frac$PLApost+data_se$PLApost,
                               data_frac$KETpre+data_se$KETpre, data_frac$KETpost+data_se$KETpost),
                   'lower' = c(data_frac$PLApre-data_se$PLApre, data_frac$PLApost-data_se$PLApost,
                               data_frac$KETpre-data_se$KETpre, data_frac$KETpost-data_se$KETpost))
frac$Condition <- factor(frac$Condition, levels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'), 
                         labels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'))


# subsetting: until 30Hz
data_frac_short <- subset(data_frac, frequencies <= 30)
frac_short <- data.frame('Frequency' = rep(data_frac_short$frequencies,4),
                   'Power' = c(data_frac_short$PLApre, data_frac_short$PLApost, data_frac_short$KETpre, data_frac_short$KETpost),
                   'Condition' = c(rep('Placebo pre', nrow(data_frac_short)), rep('Placebo post', nrow(data_frac_short)), 
                                   rep('Ketamine pre', nrow(data_frac_short)), rep('Ketamine post', nrow(data_frac_short))))
frac_short$Condition <- factor(frac_short$Condition, levels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'), 
                         labels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'))

# subsetting: above 30Hz
data_frac_high <- subset(data_frac, frequencies >= 30)
frac_high <- data.frame('Frequency' = rep(data_frac_high$frequencies,4),
                         'Power' = c(data_frac_high$PLApre, data_frac_high$PLApost, data_frac_high$KETpre, data_frac_high$KETpost),
                         'Condition' = c(rep('Placebo pre', nrow(data_frac_high)), rep('Placebo post', nrow(data_frac_high)), 
                                         rep('Ketamine pre', nrow(data_frac_high)), rep('Ketamine post', nrow(data_frac_high))))
frac_high$Condition <- factor(frac_high$Condition, levels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'), 
                               labels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'))



# not log-scaled

ggplot(frac, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
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

q = ggplot(frac, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
  scale_x_continuous(breaks=seq(0,90,10))+
  # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
  #               labels = trans_format("log10", math_format(10^.x)))+
  labs(x="Frequency (Hz)", y="Power (log)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))

if(hz_range_7_80==TRUE){
  q + scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04),
                    minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04),
                    limits = c(4e-05, 4e-04))
} else {
  q + scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04),
                    minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04)) 
} 


ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_log",suffix,".pdf", sep=""),
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

# highlight until 30Hz
ggplot(frac_high, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8, alpha=0.2) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
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
  geom_line(data=frac_short,aes(x=Frequency, y=Power, colour = Condition, linetype=Condition),linewidth=0.8,) +
  scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04),
                minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04))

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_lowfreq_log",suffix,".pdf", sep=""),
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

# highlight above 30Hz
ggplot(frac_short, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8, alpha=0.2) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
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
  geom_line(data=frac_high,aes(x=Frequency, y=Power, colour = Condition, linetype=Condition),linewidth=0.8,) +
  scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04),
                minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04))

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_highfreq_log",suffix,".pdf", sep=""),
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

p = ggplot(frac, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
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
        legend.background = element_rect(fill="white", color="black", size=0.2))

if(hz_range_7_80==TRUE){
  p + scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04),
                    minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,3.6e-04,4e-04)) +
scale_x_log10(breaks=c(7,10,20,30,40,50,60,70,80),
                 minor_breaks=c(7,10,20,30,40,50,60,70,80))
} else {
  p + scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04),
                    minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04)) +
  scale_x_log10(breaks=c(0,10,20,30,40,50,90),
                minor_breaks=c(0,10,20,30,40,50,90))
} 

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_loglog",suffix,".pdf", sep=""),
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
## plot  (subject 14, LSFGmed or averaged)
file = 'spectrum_frac_EO_7_80_subject14_LSFGmed.csv'
#file = 'spectrum_frac_EO_7_80.csv'
data_frac <- read.csv(file, sep=',')

hz_range_7_80 = TRUE

# longformat
frac <- data.frame('Frequency' = rep(data_frac$frequencies,4),
                   'Power' = c(data_frac$PLApre, data_frac$PLApost, data_frac$KETpre, data_frac$KETpost),
                   'Condition' = c(rep('Placebo pre', nrow(data_frac)), rep('Placebo post', nrow(data_frac)), 
                                   rep('Ketamine pre', nrow(data_frac)), rep('Ketamine post', nrow(data_frac))))
frac$Condition <- factor(frac$Condition, levels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'), 
                         labels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'))

# add fit line
fit_file = 'fit_values_PLA_KET_EO_7_80_subject14_LSFGmed.csv'
#fit_file = 'fit_values_PLA_KET_EO_7_80.csv'
data_fit <- read.csv(fit_file, sep=',', header=F)

#b <- data_fit$V1[1]
#s <- data_fit$V1[2]

fun.1 <- function(x) 10^data_fit$V1[1] * (1/(x^data_fit$V1[2]))
fun.2 <- function(x) 10^data_fit$V2[1] * (1/(x^data_fit$V2[2]))
fun.3 <- function(x) 10^data_fit$V3[1] * (1/(x^data_fit$V3[2]))
fun.4 <- function(x) 10^data_fit$V4[1] * (1/(x^data_fit$V4[2]))

# log-scaled (power): all conditions

q = ggplot(frac, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
  scale_x_continuous(breaks=seq(0,90,10))+
  # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
  #               labels = trans_format("log10", math_format(10^.x)))+
  labs(x="Frequency (Hz)", y="Power (log)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))

if(hz_range_7_80==TRUE){
  q + scale_y_log10(breaks=c(6e-05, 7e-05, 8e-05, 9e-05, 1e-04, 1.1e-04, 1.2e-04),
                    minor_breaks=c(6e-05, 7e-05, 8e-05, 9e-05, 1e-04, 1.1e-04, 1.2e-04))
} else {
  q + scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04),
                    minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04)) 
} 

#Placebo pre
 r <- ggplot(subset(frac, Condition %in% "Placebo pre"), aes(x=Frequency, y=Power)) +
  geom_line(linewidth=0.8, alpha=0.4) +
  #scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  #scale_color_manual(values=c("white","white","white","black")) +
   labs(x="Frequency (Hz) (log)", y="Power (log)")+
  theme_minimal()

 # linear
 r + stat_function(fun = fun.1) +
   scale_x_continuous(breaks=seq(0,90,10))
 
 # log
 r + stat_function(fun = fun.1) +
   scale_x_continuous(breaks=seq(0,90,10)) +
   scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04),
                 minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04))
 
 # log-log
 r + stat_function(fun = fun.1) +
   scale_x_log10(breaks=c(0,5,6,7,8,10,20,30,40,50,80,90),
                 minor_breaks=c(0,5,6,7,8,10,20,30,40,50,80,90)) +
   scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04),
                 minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,6e-04))
 
 
 
 # all conditions with fit line
 r <- ggplot(frac, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
   geom_line(linewidth=0.8, alpha=0.4) +
   scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
   scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
   theme_minimal() +
   theme(legend.title = element_blank(),
         legend.position = c(0.8, 0.8),
         legend.text = element_text(size=10),
         legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
         legend.background = element_rect(fill="white", color="black", size=0.2)) +
   stat_function(fun = fun.1, colour="black", linetype="dotted", alpha=1, linewidth=1.2) +
   stat_function(fun = fun.2, colour="black", linetype="solid", alpha=1, linewidth=1.2) +
   stat_function(fun = fun.3, colour="#B34A58", linetype="dotted", alpha=1, linewidth=1.2) +
   stat_function(fun = fun.4, colour="#B34A58", linetype="solid", alpha=1, linewidth=1.2) 
 
 # linear
 r +   scale_x_continuous(breaks=seq(0,90,10)) +
   labs(x="Frequency (Hz)", y="Power")
 
 ggsave(
   filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_sub14_LSFGmed.pdf", sep=""),
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
 
 # log
 r +    scale_x_continuous(breaks=seq(0,90,10)) +
   scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,4.4e-04),
                 minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,4.4e-04))+
   labs(x="Frequency (Hz)", y="Power (log)")
 
 ggsave(
   filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_sub14_LSFGmed_log.pdf", sep=""),
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
 
 # log-log
 r +    scale_x_log10(breaks=c(7,10,20,30,40,50,60,70,80),
                 minor_breaks=c(7,10,20,30,40,50,60,70,80)) +
   scale_y_log10(breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,4.4e-04),
                 minor_breaks=c(4e-05,8e-05,1.2e-04,1.6e-04,2e-04,2.4e-04,2.8e-04,3.2e-04,4.4e-04)) +
   labs(x="Frequency (Hz) (log)", y="Power (log)")

 ggsave(
   filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/Aperiodic_spectrum_sub14_LSFGmed_loglog.pdf", sep=""),
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



## spectrum for gamma

file = "spectrum_FFT_EC_hanning_new.csv"
#file = "spectrum_osci_EC.csv"
#file = "spectrum_frac_EC.csv"
data_FFT <- read.csv(file, sep=',')

# for adding standard error of the mean
file = 'spectrum_FFT_se_EC_hanning.csv'
#file = 'spectrum_osci_se_EC.csv'
#file = 'spectrum_frac_se_EC_3_90.csv'
data_se <- read.csv(file, sep=',')

# longformat
FFT <- data.frame('Frequency' = rep(data_FFT$frequencies,4),
                   'Power' = c(data_FFT$PLApre, data_FFT$PLApost, data_FFT$KETpre, data_FFT$KETpost),
                   'Condition' = c(rep('Placebo pre', nrow(data_FFT)), rep('Placebo post', nrow(data_FFT)), 
                                   rep('Ketamine pre', nrow(data_FFT)), rep('Ketamine post', nrow(data_FFT))),
                  'upper' = c(data_FFT$PLApre+data_se$PLApre, data_FFT$PLApost+data_se$PLApost,
                              data_FFT$KETpre+data_se$KETpre, data_FFT$KETpost+data_se$KETpost),
                  'lower' = c(data_FFT$PLApre-data_se$PLApre, data_FFT$PLApost-data_se$PLApost,
                              data_FFT$KETpre-data_se$KETpre, data_FFT$KETpost-data_se$KETpost))
FFT$Condition <- factor(FFT$Condition, levels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'), 
                         labels=c('Placebo pre','Placebo post','Ketamine pre','Ketamine post'))


# full spectrum, not log-scaled

ggplot(FFT, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  geom_line(linewidth=0.8) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(3,90))+
  scale_y_continuous(limits=c(0,0.0025)) +
  #scale_y_continuous(limits=c(0,1e-26), labels=scientific) +
  labs(x="Frequency (Hz)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/FFT_spectrum_hanning_EO.pdf", sep=""),
  #filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/periodic_spectrum_EC.pdf", sep=""),
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

# full spectrum, log-scaled

ggplot(FFT, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
  scale_x_continuous(breaks=seq(0,90,10), limits=c(3,90))+
  scale_y_log10( )+
  labs(x="Frequency (Hz)", y="Power (log)")+
  labs(x="Frequency (Hz)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))

ggsave(
  filename=paste("E:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/FFT_spectrum_log_hanning_EO.pdf", sep=""),
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

# 30-90Hz, not log-scaled

ggplot(FFT, aes(x=Frequency, y=Power, colour = Condition, linetype=Condition)) +
  geom_line(linewidth=0.8) +
  geom_ribbon(aes(ymin=lower, ymax=upper), alpha=0.1, linetype=0) +
  scale_linetype_manual(values=c("dotted", "solid","dotted", "solid")) +
  scale_color_manual(values=c("black","black","#B34A58","#B34A58")) +
  scale_x_continuous(breaks=seq(30,90,10), limits=c(30,90))+
  #scale_y_continuous(limits=c(1.2e-4,4e-4)) + # for FFT
 # scale_y_continuous(limits=c(0, 0.0001)) + # for periodic
  scale_y_continuous(limits=c(3e-28,1e-27), labels=scientific) + # for not normalized
  labs(x="Frequency (Hz)")+
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.8, 0.8),
        legend.text = element_text(size=10),
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.background = element_rect(fill="white", color="black", size=0.2))

ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/periodic_spectrum_30_90_EO_notnorm.pdf", sep=""),
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


