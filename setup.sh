#!/bin/bash
set -e

# Tên môi trường (có thể đổi tuỳ ý)
ENV_NAME=myenv

echo ">>> Tạo môi trường ảo: $ENV_NAME"
python3 -m venv $ENV_NAME

echo ">>> Kích hoạt môi trường ảo"
source $ENV_NAME/bin/activate

echo ">>> Cập nhật pip..."
pip install --upgrade pip

echo ">>> Cài đặt các thư viện từ requirements.txt"
pip install -r requirements.txt

echo ">>> Đăng ký kernel cho Jupyter"
python -m ipykernel install --user --name=$ENV_NAME --display-name "Python ($ENV_NAME)"

echo ">>> Hoàn tất. Để sử dụng môi trường, chạy:"
echo "source $ENV_NAME/bin/activate"

# 6. Chạy script Python
echo ">>> Chạy script data_downloader.py..."
python data_downloader.py
echo

# chmod +x setup.sh
# ./setup.sh