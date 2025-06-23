# ZINC実行環境構築用のDockerfileです
このリポジトリは東京農工大学3年次実験の金子先生回用のDockerfileを管理するためのものです. 

# Dockerfileのビルド方法
```bash
docker build -t zinc-env .
```

# Dockerイメージの実行方法
```bash
docker run -it --rm -v $(pwd):/home/ zinc-env
```
