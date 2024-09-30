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


# gamma

condition_gamma <- c("PV","SST", "VIP", "GRIN2A", "GRIN2B", "GRIN2C", "GRIN2D")
corr_gamma <- c(0.679, 0.283, 0.012, -0.393, 0.174, 0.113, 0.202)
se_gamma <- c(0.276, 0.4, 0.216, 0.269, 0.258, 0.26, 0.215)
condition_slope <- c("PV","SST", "VIP", "GRIN2A", "GRIN2B", "GRIN2C", "GRIN2D")
corr_slope <- c(-0.671, -0.363, 0.2, 0.424, -0.236, -0.165, -0.426)
se_slope <- c(0.28, 0.398, 0.211, 0.266, 0.256, 0.262, 0.211)

df_gamma <- data.frame(condition_gamma, corr_gamma, se_gamma)
df_gamma$condition_gamma <- factor(df_gamma$condition_gamma, levels = c("PV","SST", "VIP", "GRIN2A", "GRIN2B", "GRIN2C", "GRIN2D"), labels = c("PV","SST", "VIP", "GRIN\n2A", "GRIN\n2B", "GRIN\n2C", "GRIN\n2D"))

df_slope <- data.frame(condition_slope, corr_slope, se_slope)
df_slope$condition_slope <- factor(df_slope$condition_slope, levels = c("PV","SST", "VIP", "GRIN2A", "GRIN2B", "GRIN2C", "GRIN2D"), labels = c("PV","SST", "VIP", "GRIN\n2A", "GRIN\n2B", "GRIN\n2C", "GRIN\n2D"))


# gamma
ggplot(df_gamma, aes(x=condition_gamma,y=corr_gamma)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin=corr_gamma-se_gamma, ymax=corr_gamma+se_gamma), width=.17,
                position=position_dodge(.9)) +
  labs(y="Correlation (r)", x="") +
  theme_minimal()

  #theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=0.2))


ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/gene_correlations_with_gamma.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 4,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)


# slope
ggplot(df_slope, aes(x=condition_slope,y=corr_slope)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin=corr_slope-se_slope, ymax=corr_slope+se_slope), width=.17,
                position=position_dodge(.9)) +
  labs(y="Correlation (r)", x="") +
  theme_minimal()

#theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=0.2))


ggsave(
  filename=paste("D:/PROJECTS/KETAMINE-RS/PLOTS/R-Plots/gene_correlations_with_slope.pdf", sep=""),
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 4,
  height = 2.01,
  units = c("in"),
  dpi = 300,
  limitsize = TRUE,
  bg = NULL
)

