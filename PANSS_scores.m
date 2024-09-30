questionnaires = readtable('D:\PROJECTS\KETAMINE-RS\ANALYSES\KETAMINE_PROJECT_assessment_data.xlsx', 'sheet', 'KET-PLA', Range="C27:P38");

[h,p,ci,stats] = ttest(questionnaires.Var1, questionnaires.Var8) % neg: t(11) = 4.735, p < 0.001
[h,p,ci,stats] = ttest(questionnaires.Var2, questionnaires.Var9) % neg: t(11) = 2.530, p = 0.028
[h,p,ci,stats] = ttest(questionnaires.Var3, questionnaires.Var10) % neg: t(11) = 6.536, p < 0.001
[h,p,ci,stats] = ttest(questionnaires.Var4, questionnaires.Var11) % neg: t(11) = 6.189, p < 0.001
[h,p,ci,stats] = ttest(questionnaires.Var5, questionnaires.Var12) % neg: t(11) = 9.950, p < 0.001
[h,p,ci,stats] = ttest(questionnaires.Var6, questionnaires.Var13) % neg: t(11) = 4.054, p = 0.002
[h,p,ci,stats] = ttest(questionnaires.Var7, questionnaires.Var14) % neg: t(11) = 11.102, p < 0.001