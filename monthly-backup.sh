#!/bin/bash

GIT_HOME=/home/git

# List changed project list
LIST="
abar_5001_jetpack_5.1
adv_bmi_088
adv_bmp_390
adv_gmsl
framework_ria
gs3-bsp
jetson_bsp_web
mic_711_jetpack_6.2.0
mic_711on_8g_jetpack_6.2.0
mic_711on_jetpack_6.2.0
mic_712_jetpack_6.1.0
mic_712_jetpack_6.2.0
mic_713_jetpack_5.1.2
mic_713_jetpack_6.1.0
mic_713_jetpack_6.2.0
mic_713on_8g_jetpack_6.2.0
mic_715ox_jetpack_5.1.2
mic_732_64g_jetpack_6.0
mic_732_64g_jetpack_6.2
mic_733ao_64g_jetpack_6.0
mic_file_source
mic_tester
rootfs_bin_adv
vega_dud550_ca_jetpack_6.1.0
vega_dud550_jetpack_6.1_spe
"

# Clone if the repositories doesn't exist.
cd $GIT_HOME

for i in $LIST; do
  if [ ! -d ${i}.git ]; then
    $GIT_HOME/git-repo-utils/git-repo-clone.sh git@bitbucket.org:advantechisg/${i}.git
  fi
done
