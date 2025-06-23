# ZINC実行環境構築用のDockerfileです
このリポジトリは東京農工大学3年次実験の金子先生回用のDockerfileを管理するためのものです.

# Dockerfileのビルド方法
```bash
docker build -t zinc-env .
```

# Dockerイメージの実行方法
```bash
docker run -it --rm zinc-env
```

# Dockerイメージの実行方法(コンテナ内での作業ディレクトリを指定)
```bash
# このコマンドは, 現在のディレクトリをコンテナ内の`/home`にマウントします.
# これにより, ホストマシンのファイルをコンテナ内で直接操作できます.
# 他のディレクトリをマウントしたい場合は, `$(pwd)`の部分を変更してください.
docker run -it --rm -v $(pwd):/work zinc-env
```

# 連絡先
このDockerfileに関する質問や問題がある場合は, `upiscium@gmail.com`までお問い合わせください.
