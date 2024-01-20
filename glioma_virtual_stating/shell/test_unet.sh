#!/bin/bash
#SBATCH --job-name=sl7
#SBATCH --output=test_unet.out
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

python ../../test.py --input_nc=7 --loadSize=512 --fineSize=1024 --resize_or_crop="scale_width_and_crop" --dataroot='/public/home/win0701/dataset/slices_11_20230308' --name="unet7" --no_flip --no_instance --serial_batches --use_encoded_image --netG=UNet_Usual --which_epoch=230