﻿# EasyWanVideo

工事中。おすすめ設定の調査中で、まだ使いやすくなっていません。

- [Wan 2.1](https://github.com/Wan-Video/Wan2.1) を Geforce RTX 3060 などで簡単に試せる Win 用ローカル環境です。
	- Wan はプロンプトからの動画生成 (T2V) と、画像からの動画生成 (I2V) の両方に対応しています。
	- プロンプトからの軽量動画生成では、5秒の 480p 動画を 5分半で生成します。
		- T2V 1.3B, 832x480, 81 frames, 15step, sageattn, RTX 3060 12GB
	- 画像からの高品質動画生成では、5秒の 480p 動画を 20分で生成します。
		- T2V 14B 480p, 832x480, 81 frames, 10step, sageattn, RTX 3060 12GB
	- 解像度やフレーム数を半減すれば、それだけ生成時間が減りますが、品質への悪影響がありそうです。
- 現在は [Kijai 版](https://github.com/kijai/ComfyUI-WanVideoWrapper) をサポートしています。
	- 手元では ComfyUI の [Native 版](https://comfyui.org/blog/revolutionize-video-creation-comfyui) も GGUF & VRAM 12GB で動作しています。

## インストール

1. [EasyWanVideoInstaller.bat](https://github.com/Zuntan03/EasyWanVideo/raw/main/EasyWanVideo/EasyWanVideoInstaller.bat?ver=0) を右クリックから保存します。
2. インストール先の空フォルダを `C:/EasyWan/` や `D:/EasyWan/` などの浅いパスに用意して、ここに `EasyWanVideoInstaller.bat` を移動して実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**

**`ComfyUi.bat` で EasyWanVideo が起動し、`Update.bat` で更新できます。**

## 使い方

- T2V 1B（軽量版のプロンプトから動画生成）
	- `Easy/00_Kijai_T2v1B` ワークフローで生成します。
		- インストール時にモデルをダウンロードしていなかった場合は、`Download/Kijai_T2v1B.bat` でモデルをダウンロードします。
- T2V 14B（高品質版のプロンプトから動画生成）
	- **`Download/Kijai_T2v14B.bat` でモデルをダウンロードします。**
	- `Easy/01_Kijai_T2v14B` ワークフローで生成します。
- I2V 14B 480p（画像から動画生成の 480p 版）
	- **`Download/Kijai_I2v480p.bat` でモデルをダウンロードします。**
	- `Easy/05_Kijai_I2v480p` ワークフローで生成します。

メインメモリが 32GB の場合は 14B は動かないかもしれません。  
GGUF なら動きそう？なので近日中に用意します。

## SageAttention で高速生成

SageAttention をセットアップすると、手元では **大幅に短い時間** で生成できています。

セットアップ

1. `EasyWanVideo/SageAttention/` にある `SetupSageAttention.bat` を実行します。
2. `vs_buildtools.exe` で `C++ によるデスクトップ開発` を選択してインストールします。
3. `cuda_12.8.0_windows_network.exe` をインストールします。

利用方法

- **Kijai ワークフローの `WanVideo Model Loader` ノードで、`attention_mode` を `sageattn` にします。**

SageAttention のインストールに失敗して `ComfyUI.bat` がエラーになる場合は、`ComfyUI/venv/` の削除で元に戻せます。

## 生成メモ

いずれも少し試した範囲での印象です。  
また、急速に開発が進んでいるため、情報がすぐに古くなる可能性があります。

### Kijai I2V 生成メモ

- プロンプトには見た目や状態ではなく動きを記載しなくてはいけない。
	- 画像からのプロンプト生成はあまり使えなさそう。
- scheduler は `unipc` か `dpm++` の `10 steps`
- `480p` モデルの想定サイズ `832x480` から離れると劣化する
- 生成フレーム数は `81 frames` から増やしても減らしても劣化する
- `832x480` & `81 frames` での生成と比較しながらパラメータを調整したほうが無難
- 画像のサイズと `ImageClip Encode` のサイズは合わせておくと無難
- I2V では `Enhance A Video` は無し
- `Clip TextEncoder` は、`visual` 有無のどちらが良いのかわからず

## 更新履歴

### 2025/03/02

- リポジトリを公開しました。
- Kijai で `Wan2_1-I2V-14B-480P_fp8_e5m2` モデルのダウンロードに対応しました。
	- Geforce RTX 30X0 以前なら `fp8_e5m2` の `quantization` を使用します。
	- Geforce RTX 40X0 以降なら `fp8_e4m3fn_fast` の `quantization` を使用します？（未検証）

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
