# Đăng nhập
ssh <user_name>@giangnguyen.zapto.org -p 1234

# Tạo screen 
 screen -S aiai

# xóa screen job
screen -X -S id.<tên screen> kill

# Quay lại screen đã tạo 
screen -r <tên screen>

# Tạo job 
srun --nodes=1 --ntasks=1 --cpus-per-task=4 --mem=32G  --pty /bin/bash

# trung binh 1cpu = 2G ram  (máy LULU)  
srun --nodes=1 --ntasks=1 --cpus-per-task=16   --pty /bin/bash

# tải dữ liệu không chạy tools 
srun --nodes=1 --ntasks=1  --pty /bin/bash

# See jobs running 
squeue 

# Kill job 
scancel jobID

# kill you current job when is done 
ctrl + d

# Install conda 

curl -sL \
  "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > \
  "Miniconda3.sh"
bash Miniconda3.sh

# Tạo môi trường 
conda create -n <env_name>

# Install env and set path 
conda create -p ./path/to/<env_name>

# activate env conda 
mamba init 
mamba activate /mnt/d10t/user/ainguyen/HCC_env

# Download dữ liệu từ hpc về local pc
scp -r -P 1234 ainguyen@giangnguyen.zapto.org:/mnt/d10t/user/ainguyen/Summary/datasetnew/trainDT.tsv /home/nguyen/Documents/

# Upload dữ liệu từ local pc lên hpc 
scp -r -P 1234 /home/nguyen/Documents/dfstatistic.tsv ainguyen@giangnguyen.zapto.org:/mnt/d10t/user/ainguyen/Summary
