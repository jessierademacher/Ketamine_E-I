
excel = readtable('E:\PROJECTS\HCP_MMP1_unique_region_list.xlsx');

labels = excel(:,1);
labels2 = table2struct(labels);
voxels = table2array(excel(:,[10,11,12]));

x = round(voxels(:,1))*-1 + 90;
y = round(voxels(:,2)) - 126;
z = round(voxels(:,3)) - 72;

mni = table(x, y ,z);

writetable(mni, 'E:\PROJECTS\HCP_MMP1_in_MNI.xlsx');



