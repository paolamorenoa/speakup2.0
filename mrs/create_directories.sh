#!/bin/sh

# change
sub_id_number=''

# directories (change)
base_dir='/mri/'
analysis_dir='/mri_analysis'
mrs_data_dir="${base_dir}mrs"
anat_data_dir="${base_dir}anat"
raw_data_dir="${base_dir}raw"

mkdir -p "${analysis_dir}/${sub_id_number}"/{dlPFC,FPL,Occ,anat, raw}

cp "${mrs_data_dir}/${sub_id_number}"/*dlPFC_svs_press_glutamate.dat "${analysis_dir}/${sub_id_number}/dlPFC/${sub_id_number}.dlPFC_svs_press_glutamate.dat"
cp "${mrs_data_dir}/${sub_id_number}"/*FPL_svs_press_glutamate.dat "${analysis_dir}/${sub_id_number}/FPL/${sub_id_number}.FPL_svs_press_glutamate.dat"
cp "${mrs_data_dir}/${sub_id_number}"/*Occ_svs_press_glutamate.dat "${analysis_dir}/${sub_id_number}/Occ/${sub_id_number}.Occ_svs_press_glutamate.dat"

cp "${anat_data_dir}/${sub_id_number}_T1.nii" "${analysis_dir}/${sub_id_number}/anat/"

cp -r "${raw_data_dir}/${sub_id_number}/." "${analysis_dir}/${sub_id_number}/raw/"
