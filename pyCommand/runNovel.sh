#! /bin/bash
export CUDA_VISIBLE_DEVICES=0,1,2,3

cmd=rf_resyn
src=epfl
double=1
MtM=1
trf=1
trw=1
# -------------------NovelSyn Shell Script--------------------

if true; then
  model_name=novel_${cmd}

  nohup python -u autoCmd.py \
    --mode novel \
    --cmd ${cmd} \
    --src ${src} \
    --trw ${trw} \
    --trf ${trf} \
    --double ${double}\
    --mtm ${MtM} \
    >mgpu_logs/${model_name}_src:${src}_double:${double}_MtM:${MtM}_sDouble.log 2>&1 &
fi

    
# -------------------ABC Shell Script--------------------
if false; then
  model_name=abc_${cmd}

  nohup python -u autoCmd.py \
    --mode abc \
    --cmd ${cmd} \
    --src ${src} \
    --trw ${trw} \
    --trf ${trf} \
    --double ${double}\
    --mtm ${MtM} \
    >mgpu_logs//${model_name}_src:${src}_double:${double}_MtM:${MtM}_sDouble.log 2>&1 &
fi