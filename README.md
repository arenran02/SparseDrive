# installation

```bash
conda create -n sparsedrive2 python=3.8 -y
conda activate sparsedrive2

sparsedrive_path="/home/mjkim/sparseDrive_ws/SparseDrive"
cd ${sparsedrive_path}
pip3 install --upgrade pip

# CUDA 12.1
pip install torch==2.1.0+cu121 torchvision==0.16.0+cu121 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu121

# before this execution of this command, modify the file of requirement.txt
# file context is down of this section
pip3 install -r requirement.txt

cd projects/mmdet3d_plugin/ops
python3 setup.py develop
cd ../../../
```

## modified requirement.txt
  
```bash
numpy==1.23.5
mmcv_full==1.7.2
mmdet==2.28.2
urllib3==1.26.16
pyquaternion==0.9.9
nuscenes-devkit==1.1.10
yapf==0.33.0
tensorboard==2.14.0
motmetrics==1.1.3
pandas==1.1.5
flash-attn==2.3.2
opencv-python==4.8.1.78
prettytable==3.7.0
scikit-learn==1.3.0
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

