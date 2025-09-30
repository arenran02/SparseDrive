# How to execute SparseDrive with CUDA 12.1

you should have environment with CUDA 12.1.
I execute this repository in 2 A6000, CUDA 12.1, Ubuntu 22.04 also, in docker container.

## installation

```bash
conda create -n sparsedrive2 python=3.8 -y
conda activate sparsedrive2

sparsedrive_path="/home/mjkim/sparseDrive_ws/SparseDrive"
cd ${sparsedrive_path}
pip3 install --upgrade pip

# CUDA 12.1
pip install torch==2.1.0+cu121 torchvision==0.16.0+cu121 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu121

pip3 install -r requirement.txt

cd projects/mmdet3d_plugin/ops
python3 setup.py develop
cd ../../../

sh scripts/create_data.sh
sh scripts/kmeans.sh


mkdir ckpt
wget https://download.pytorch.org/models/resnet50-19c8e357.pth -O ckpt/resnet50-19c8e357.pth
```

## train & test
before train, you should modify the code of `train.py`, to be fit your number of gpus.

```
## stage1
bash ./tools/dist_train.sh \
   projects/configs/sparsedrive_small_stage1.py \
   2 \   # GPU num modified according to your device
   --deterministic

## stage2
bash ./tools/dist_train.sh \
   projects/configs/sparsedrive_small_stage2.py \
   2 \   # GPU num modified according to your device
   --deterministic
```

## train
```
sh scripts/train.sh
```

## test
```
sh scripts/test.sh
```

## Visualization
```
sh scripts/visualize.sh

```

## download nuscenes dataset

I use https://github.com/li-xl/nuscenes-download repository to set dataset.  
In addition, i also download CAN bus data.  

NuScenes dataset Structure for SparseDrive is like this.  

```bash
nuscenes
├── can_bus
├── maps
│   ├── basemap
│   ├── expansion
│   └── prediction
├── samples
├── sweeps
├── v1.0-test
└── v1.0-trainval
```

and also you should make a symbolic link that connects nuscenes.
```
mkdir data
ln -s path/to/nuscenes ./data/nuscenes
```
