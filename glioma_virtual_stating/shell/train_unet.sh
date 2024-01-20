#!/bin/bash
#SBATCH --job-name=sl7
#SBATCH --output=train.out
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=20G
#SBATCH -t 168:0:0
#SBATCH -p gpu
#SBATCH --gres=gpu:1              # 每个节点上申请一块GPU卡


cd $SLURM_SUBMIT_DIR

module load apps/anaconda3/2021.05
module load compiler/cuda/11.0-with-cuDNN8.2.1

source activate pytorch

python ../../train.py --input_nc=7 --loadSize=512 --fineSize=1024 --resize_or_crop="scale_width_and_crop" --dataroot='/public/home/win0701/dataset/slices_11_20230308' --name="unet7" --label_nc=0 --no_instance --nThreads=0 --dir_data_A='/public/home/win0701/dataset/slices_11_20230308/train_A' --dir_data_B='/public/home/win0701/dataset/slices_11_20230308/train_B'