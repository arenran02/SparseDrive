# installation

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

