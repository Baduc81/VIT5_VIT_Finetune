import kagglehub, shutil, os

path = kagglehub.dataset_download("nguynrichard/auto-vqabest")
target = "/root/VIT5_VIT_Finetune/data"
os.makedirs(target, exist_ok=True)

for item in os.listdir(path):
    s = os.path.join(path, item)
    d = os.path.join(target, item)
    if os.path.isdir(s):
        shutil.copytree(s, d, dirs_exist_ok=True)
    else:
        shutil.copy2(s, d)

print("Done:", target)
