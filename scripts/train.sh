## stage1
bash ./tools/dist_train.sh \
   projects/configs/sparsedrive_small_stage1.py \
   2 \   # you should set the number of gpus according to your own environment
   --deterministic

## stage2
bash ./tools/dist_train.sh \
   projects/configs/sparsedrive_small_stage2.py \
   2 \   # you should set the number of gpus according to your own environment
   --deterministic