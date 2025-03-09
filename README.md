# EasyWanVideo

**作例: 
[4](https://x.com/Zuntan03/status/1898645052978770217), 
[3](https://x.com/Zuntan03/status/1898559953687961728),
[2](https://x.com/Zuntan03/status/1896103446983688362), 
[Day1](https://x.com/Zuntan03/status/1894893100025422207)**  
いずれも Geforce RTX 3060 12GB 環境で生成  
**インストールしてから `Sample/_Download.bat` で、より多くの作例を確認できます。**  

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/I2vAll.webp)

- [Wan 2.1](https://github.com/Wan-Video/Wan2.1) を Geforce RTX 3060 12GB などで簡単に試せる Win 用ローカル環境です。
	- 画像からの高品質動画生成 (I2V) では、3秒の 368x480 動画を 5分半、5秒の 432x576 動画を 12分で生成します。
- [Kijai 版](https://github.com/kijai/ComfyUI-WanVideoWrapper) の I2V を主にサポートしています。 
	- ComfyUI [Native 版](https://comfyui.org/blog/revolutionize-video-creation-comfyui) や T2I も一応サポートしています。
- 自動＆手動モザイク、アップスケーラ、フレーム補間にも対応しています。

**現在は Kijai 版 I2V を中心に環境を整えています。**  
**Kijai 版はメインメモリが 64GB 推奨な点にご注意ください。**  
**キャラや構図は [EasyReforge](https://github.com/Zuntan03/EasyReforge) などで固めて、動きは LoRA で補助すると、効率良く I2V 生成ができます。**

## インストール

1. [EasyWanVideoInstaller.bat](https://github.com/Zuntan03/EasyWanVideo/raw/main/EasyWanVideo/EasyWanVideoInstaller.bat?ver=0) を右クリックから保存します。
2. インストール先の空フォルダを `C:/EasyWan/` や `D:/EasyWan/` などの浅いパスに用意して、ここに `EasyWanVideoInstaller.bat` を移動して実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**

**重要事項**

- **`ComfyUi.bat` で EasyWanVideo が起動し、`Update.bat` で更新できます。**  
- **`Easy/` 以下のワークフローは更新 (`Update.bat`) で最新状態になります。**  
	- **編集したワークフローを残したい場合は別名で保存してください。**
- **まずは `Sample/_Download.bat` で、どんな動画を生成できるのかを確認ください。**  
	- `Sample/*.png` はサンプルのワークフローが含まれており、ComfyUI にドラッグ＆ドロップすると生成時の設定を確認できます。  
サンプルのワークフローは更新により `Download/Kijai_I2v480p.bat` などによる追加ファイルのダウンロードや、ファイルパス指定の修正が必要な場合があります。

## 使い方

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/I2vKijai.webp)  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/I2vAllInfo.webp)

- **オススメ！** I2V 14B 480p（画像から動画生成の 480p 版）
	1. **`Download/Kijai_I2v480p.bat` でモデルをダウンロードします。**
	2. `Easy/05_Kijai_I2v480p` ワークフローを開いて生成します。
- `Easy/30_Mosaic` では自動検出と画像のアルファ値でモザイクをかけられます。
	- 画像のアルファ値は ComfyUI 内の `MaskEditor` で編集できます。
- `Easy/40_Upscale` でアップスケーラによる拡大ができます。
- `Easy/70_Interpolate` で動画を滑らかにするフレーム補間ができます。
	- 補間数とフレームレートで再生速度をコントロールできます。
	- ネットで共有するための MP4 形式への変換や、PingPong ループ再生変換もできます。

## オススメ！SageAttention で高速生成

SageAttention をセットアップすると、**生成時間が約半分になります**。

### セットアップ

1. `EasyWanVideo/SageAttention/` にある `SetupSageAttention.bat` を実行します。
2. `vs_buildtools.exe` で `C++ によるデスクトップ開発` を選択してインストールします。  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHunyuanVideo/Setup/VsBuildTools_Cpp.png)
3. `cuda_12.8.0_windows_network.exe` をインストールします。

### 利用方法

- **`Easy/05_Kijai_I2v480p` ワークフローでは、以下で `spda` を `sageattn` に変更します。**  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/SageAttn.png)
- **Native I2V ワークフローの `SageAttension 切り替え` ノードで有効にします。**

SageAttention のインストールに失敗して `ComfyUI.bat` がエラーになる場合は、`ComfyUI/venv/` の削除で元に戻せます。

## その他のワークフロー

- I2V 14B 480p ComfyUI Native 版
	- **`Download/Native_I2v480p.bat` でモデルをダウンロードします。**
	- `Easy/15_Native_I2v480p` ワークフローで生成します。
	- メインメモリが 32GB でも動作しますが、とても遅いです。
- T2V 1B（軽量版のプロンプトから動画生成）
	- `Easy/00_Kijai_T2v1B` ワークフローで生成します。
		- インストール時にモデルをダウンロードしていなかった場合は、`Download/Kijai_T2v1B.bat` でモデルをダウンロードします。
		- 小さいモデルですので、品質も相応です。
- T2V 14B（高品質版のプロンプトから動画生成）
	- **`Download/Kijai_T2v14B.bat` でモデルをダウンロードします。**
	- `Easy/01_Kijai_T2v14B` ワークフローで生成します。

## 更新履歴

### 2025/03/09

- `05_Kijai_I2v480p` ワークフローのパラメータチューニングが一段落しましたので正式公開します。
	- まずは `Sample/_Download.bat` でダウンロードされるサンプルを確認ください。  
Geforce RTX 3060 12GB で短期間に動画を量産できるポテンシャルがあります。 
	- 3/7 に LTX Video と Hunyuan I2V を評価しましたが、この用途で一日触った範囲では、Wan が圧倒的でした。
- [Nashikone さんの LoRA バンドル](https://huggingface.co/nashikone/iroiroLoRA/tree/main/Wan2.1-T2V-14B) のダウンロード `Download/loras/Bundle/Nashikone.bat` に対応しました。
	- T2I 用ですが I2V でも微妙に効いている気がしています。
- 動作確認済みの LoRA とサンプルを追加しました。
	- `Download\loras\Bundle\Nashikone.bat`
	- `Download\loras\Nsfw\nsfwsks_InAndOut_v014.bat`
	- `Download\loras\Nsfw\missionary_sex_v10.bat`
- SEGS 検出モデルを追加しました。
	- `Download\ultralytics\segm\2DCockAndBallYolo8x.bat`
	- `Download\ultralytics\segm\CockAndBallYolo8x.bat`
	- `Download\ultralytics\segm\pussy_yolo11s_seg_best.bat`

[過去の更新内容](https://github.com/Zuntan03/EasyWanVideo/wiki/%E9%81%8E%E5%8E%BB%E3%81%AE%E6%9B%B4%E6%96%B0%E5%86%85%E5%AE%B9)

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
