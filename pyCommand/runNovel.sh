#! /bin/bash
export CUDA_VISIBLE_DEVICES=0

cmd=rf_resyn
src=case
double=1
MtM=0
# -------------------NovelSyn Shell Script--------------------

if true; then
  model_name=novel_${cmd}

  nohup python -u autoCmd.py \
    --mode novel \
    --cmd ${cmd} \
    --src ${src} \
    --double ${double}\
    --mtm ${MtM} \
    >logs/${model_name}_src:${src}_double:${double}_MtM:${MtM}.log 2>&1 &
fi

    
# -------------------ABC Shell Script--------------------
if true; then
  model_name=abc_${cmd}

  nohup python -u autoCmd.py \
    --mode abc \
    --cmd ${cmd} \
    --src ${src} \
    --double ${double}\
    --mtm ${MtM} \
    >logs/${model_name}_src:${src}_double:${double}_MtM:${MtM}.log 2>&1 &
fi