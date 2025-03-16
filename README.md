# EasyWanVideo

- [Wan 2.1](https://github.com/Wan-Video/Wan2.1) による画像から動画の生成 (I2V) を、ローカルで簡単に試せる環境です。
	- 最近の NVIDIA 製 GPU を搭載した、メインメモリ 32GB 以上の Win11 PC で動作します。
		- 動作確認環境は Geforce RTX 3060 12GB とメインメモリ 64GB です。
	- プロンプトからの動画の生成 (T2V) にも一応対応していますが、メインは I2V です。
- I2V の元画像は [EasyReforge](https://github.com/Zuntan03/EasyReforge) などでお好みのキャラやシチュエーションの画像を用意します。
	- 動画のアニメーションはプロンプトだけでなく、[Wan 用 LoRA](https://civitai.com/search/models?baseModel=Wan%20Video&modelType=LORA&sortBy=models_v9) も併用すると楽に制御できます。
- **動作確認環境で生成した作例（要 X ログイン）:  
[9](https://x.com/Zuntan03/status/1901052598607601850),
[8](https://x.com/Zuntan03/status/1900804662569431481), 
[7](https://x.com/Zuntan03/status/1899818287225242020), 
[6](https://x.com/Zuntan03/status/1899368720251920775), 
[5](https://x.com/Zuntan03/status/1899022954434056661), 
[4](https://x.com/Zuntan03/status/1898645052978770217), 
[3](https://x.com/Zuntan03/status/1898559953687961728),
[2](https://x.com/Zuntan03/status/1896103446983688362), 
[Day1](https://x.com/Zuntan03/status/1894893100025422207)**
	- **インストール後に 100 を超えるサンプル動画と、その生成設定を確認できます。**
- 紹介記事:
	- 2025/03/10『[動画生成AIの進化がすごい　「超リアル」「ローカルで動く」2つの方向に](https://ascii.jp/elem/000/004/255/4255982/)』 p. 3
	- 2025/03/14『[【動画生成AI】EasyWanVideoを使ってみる【Wan2.1】](https://note.com/aiaicreate/n/n5bf5060e4a14)』
	- 2025/03/09『[[紳士向け] オープンソース＆次世代AI「Wan 2.1」と「EasyWanVideo」で、簡単に叡智動画を生成できる使い方ガイド！](https://note.com/ryu_senpen/n/n017863a1a7cd)』

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/I2vAll.webp)

## [重要] Kijai 版と Native 版、2種類の Wan 生成環境

[ComfyUI](https://github.com/comfyanonymous/ComfyUI) での Wan 動画の生成環境には、[Kijai 版](https://github.com/kijai/ComfyUI-WanVideoWrapper) と [Native 版](https://comfyanonymous.github.io/ComfyUI_examples/wan/) の 2種類があります。

**現在はメインメモリが 48GB 以上なら、Kijai 版の利用を推奨しています。**

メインメモリの [DDR4 64GB(32GB * 2) は \15,000～](https://kakaku.com/pc/pc-memory/itemlist.aspx?pdf_Spec101=6&pdf_Spec105=2&pdf_Spec301=32) で、GPU よりもずっと安価です。ローカル AI 動画生成では、交換や増設を検討ください。メインメモリの交換や増設には [マザーボードの仕様確認が必要](https://www.google.com/search?q=%E3%83%9E%E3%82%B6%E3%83%BC%E3%83%9C%E3%83%BC%E3%83%89+DIMM+%E5%A2%97%E8%A8%AD+%E5%AF%BE%E5%BF%9C) です。わからない場合は PC 販売元のサポートやクラウド AI にお問い合わせください。

||Kijai 版|Native 版|メモ|
|-:|:-:|:-:|:-|
|メインメモリ|最低 48GB|最低 32GB|Kijai 版が GGUF 非対応の影響大。|
|VRAM|最低 8GB?|[最低 6GB](https://x.com/ooana11/status/1901116323763286063)|厳密な VRAM 下限は未確認だが、12GB で余裕あり。<br>Native 版は GGUF で、Kijai版は BlockSwap で削減。|
|生成時間|短い|長い|Kijai 版の FlowUniPCMultistepScheduler は 10ステップで I2V 可。<br> Native 版は倍以上のステップ数が必要。|

気づけていない点がありましたら、お知らせください。

## EasyWanVideo のインストールとチュートリアル

**[重要] インストールでは動画の生成速度がほぼ倍になる SageAttention を導入します。  
ただし、PC 環境によっては SageAttention が動作しない場合があります。**

SageAttention を利用できない PC 環境では、代わりに SPDA を利用することで動画を生成できます。  
ただし、ワークフローやサンプルは SageAttention を利用しているため、設定を SPDA に変更しないとエラーになります。

1. [EasyWanVideoInstaller.bat](https://github.com/Zuntan03/EasyWanVideo/raw/main/EasyWanVideo/EasyWanVideoInstaller.bat?ver=0) を右クリックから保存します。
2. インストール先の空フォルダを `C:/EasyWan/` や `D:/EasyWan/` などの浅いパスに用意して、ここに `EasyWanVideoInstaller.bat` を移動して実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
3. インストール先の `EasyWanVideo/SageAttention/` で、SageAttention を導入します。
	1. `SetupSageAttention.bat` を実行します。
	2. `vs_buildtools.exe` を実行して、`C++ によるデスクトップ開発` を選択して `Visual Studio Build Tolls 2022` をインストールします。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHunyuanVideo/Setup/VsBuildTools_Cpp.png)
	3. `EasyWanVideo/SageAttention/` にある`cuda_12.8.0_windows_network.exe` で `NVIDIA CUDA Toolkit` をインストールします。
		- CUDA Toolkit に合わせたグラフィックスドライバもインストールされます。
	4. この環境以外で SageAttention を利用していた場合は、`EasyWanVideo/SageAttention/DeleteTritonCache.bat` で Triton のキャッシュを削除してください。
	- SageAttention 導入に失敗する場合に『[Geforce RTX 50x0 で動作しない](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0#geforce-rtx-50x0-%E3%81%A7%E5%8B%95%E4%BD%9C%E3%81%97%E3%81%AA%E3%81%84)』で改善する可能性があります。

インストールが完了したら、ComfyUI が正常動作することを確認します。  
**まだ、I2V の生成はできません。チュートリアルで生成できるようになります。**

- `ComfyUi.bat` を実行すると、ComfyUI を起動できます。
	- **過去にインストールした ComfyUI のワークフローが開かれ、`Missing Node Types` が表示される場合があります。**  
関係のないワークフローですので、閉じてください。
- 黒いコンソール画面を閉じると、EasyWanVideo を終了できます。
- `Update.bat` を実行すると、EasyWanVideo を更新できます。

インストールで問題が発生した場合は、『**[トラブルシューティング](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)**』を確認ください。  
次はチュートリアルに進みます。

- メインメモリが 48GB 以上なら『**[I2V Kijai 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Kijai-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)**』
- メインメモリが 32GB なら『**[I2V Native 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Native-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)**』

I2V のチュートリアルでは動画素材を生成します。  
お好みの動画素材を生成できたら、動画を仕上げます。

- 動画素材を公開用に整える 『**[動画の仕上げチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E5%8B%95%E7%94%BB%E3%81%AE%E4%BB%95%E4%B8%8A%E3%81%92%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)**』

<!-- ワークフローの内容については『**[ワークフロー説明](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%AF%E3%83%BC%E3%82%AF%E3%83%95%E3%83%AD%E3%83%BC%E8%AA%AC%E6%98%8E)**』を確認ください。 -->

よくある使い方についての問い合わせを、『**[よくある質問と回答](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%82%88%E3%81%8F%E3%81%82%E3%82%8B%E8%B3%AA%E5%95%8F%E3%81%A8%E5%9B%9E%E7%AD%94)**』にまとめています。

## EasyWanVideo の更新方法

1. `Update.bat` を実行すると、EasyWanVideo を更新します。
	- `Workflow/Easy/*.json` が最新の状態になります。
2. ご利用のワークフローに合わせて `Download/` にある `Kijai_I2v.bat` や `Native_I2v.bat` を実行すると、LoRA などの新たに入手可能なファイルがあればダウンロードします。
3. `Sample/_Dwonload.bat` を実行すると、新たに入手可能なサンプルがあればダウンロードします。
	- 新たなサンプルは新たな LoRA を参照している場合があり、`2.` のダウンロードを必要とする場合があります。

`2.` と `3.` は必要に応じての実行で問題ありません。

## 最近の更新履歴

### 2025/03/16

- 720p 用の LoRA は長辺が `720 pixel` 程度ないと暴れる印象がありますので、把握できる範囲で `Model/loras/Nsfw720p/` に分離しました。
	- `Model/loras/Nsfw/` にある `her_breasts_are_bouncing_v01` は削除して問題ありません。
- `Download/Kijai_I2v.bat` と `Download/Native_I2v.bat` で 720p 用モデルもダウンロードするようにしました。
- `Kijai_I2v` ワークフローで、480p モデルと 720p モデルの切り替えに対応しました。
- 『**[トラブルシューティング](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)**』と『**[よくある質問と回答](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%82%88%E3%81%8F%E3%81%82%E3%82%8B%E8%B3%AA%E5%95%8F%E3%81%A8%E5%9B%9E%E7%AD%94)**』を更新しました。
- 動作確認済みの LoRA とサンプルを追加しました。
	- `Download/loras/Nsfw/deepthroat_blowjob_v10.bat`
		- 打率の高い LoRA だったので、量産テストとして 50動画を用意してみました。
- `Download/loras/Nsfw/Cowgirl_v12.bat` のバージョンを更新しました。
- 試験的な Geforce RTX 50x0 対応の Triton バージョンを更新しました。
	- `Update.bat` での更新後に `EasyWanVideo/SageAttention/` の `ExperimentalRtx50x0_CudaNightlyBuildSageAttention.bat` を実行でバージョンアップします。

### 2025/03/15

- [README](https://github.com/Zuntan03/EasyWanVideo) を刷新しました。
	- 『[I2V Kijai 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Kijai-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)』『[I2V Native 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Native-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)』『[動画の仕上げチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E5%8B%95%E7%94%BB%E3%81%AE%E4%BB%95%E4%B8%8A%E3%81%92%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)』を追加しました。
- `Easy/` のワークフローで SageAttention をデフォルトで有効にしました。
- `Download/loras/Bundle/NashikoneI2v720p.bat` を追加しました。
- SageAttention と Triton をアンインストールする `EasyWanVideo/SageAttention/UninstallSageAttention.bat` を追加しました。
- PyTorch 一式をアンインストールする `EasyWanVideo/SageAttention/UninstallPytorch.bat` を追加しました。
- 試験的に Geforce RTX 50x0 に対応する、`EasyWanVideo/SageAttention/ExperimentalRtx50x0_CudaNightlyBuildSageAttention.bat` を追加しました。
	- 通常の SageAttention のセットアップ（`vs_buildtools.exe` と `cuda_12.8.0_windows_network.exe` のインストール）を済ませた後に、`ExperimentalRtx50x0_CudaNightlyBuildSageAttention.bat` を実行してください。
		- PyTorch を Nightly にし、triton を最新版にして、SageAttention をビルドします。
		- トラブルにより SageAttention と Triton を巻き戻すなら `UninstallSageAttention.bat` を実行します。
		- トラブルにより PyTorch を巻き戻すなら、`UninstallPytorch.bat` を実行した後に、`EasyWanVideo/Setup.bat` を実行します。
	- Geforce RTX 30x0 や 40x0 で上手くインストールできていない環境でインストールすると、改善する可能性もあります。

### 2025/03/14

- `Easy/30_Mosaic` で [Segment Anything Model 2](https://github.com/facebookresearch/sam2) によるポイント指定でのモザイクに対応しました。
- `05_Kijai_I2v` でマスク指定によるモザイクの開始フレームと終了フレームの指定に対応しました。
- 動作確認済みの LoRA とサンプルを追加しました。
	- `Download/loras/Effect/r0t4tion_360_degrees_rotation_v10.bat`

### 2025/03/13

- `Easy/15_Native_I2v` と `Easy/00_Kijai_T2v1B` のワークフローを更新しました。
- カラーマッチ用の `Easy/31_ColorMatch` ワークフローを追加しました。
- 動作確認済みの LoRA とサンプルを追加しました。
	- `Download/loras/Nsfw/Cowgirl_v11.bat`
	- `Download/loras/Nsfw/her_breasts_are_bouncing_v01.bat`

### 2025/03/12

- **[重要] 3/10 にあった ComfyUI-WanVideoWrapper の [LoRA のロード方式変更](https://github.com/kijai/ComfyUI-WanVideoWrapper/commit/2f085b8511aa0668926283adaa75317b364202f8) により、Geforce RTX 3060 12GB 環境で `WanVideoModelLoader` が `Allocation on device` エラーを起こしていました。**
	- `Update.bat` を実行すると、この変更前に巻き戻します。  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/log/202503/OomError.png)
- 動作確認済みの LoRA とサンプルを追加しました。
	- `Download/loras/Nsfw/tekoki_v028.bat`
- `05_Kijai_I2v` ワークフローの `画像からのプロンプト生成` のデフォルトを無効にしました。

## ドキュメント

- [I2V Kijai 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Kijai-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
- [I2V Native 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Native-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
- [動画の仕上げチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E5%8B%95%E7%94%BB%E3%81%AE%E4%BB%95%E4%B8%8A%E3%81%92%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
<!-- - [ワークフロー説明](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%AF%E3%83%BC%E3%82%AF%E3%83%95%E3%83%AD%E3%83%BC%E8%AA%AC%E6%98%8E) -->
- [よくある質問と回答](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%82%88%E3%81%8F%E3%81%82%E3%82%8B%E8%B3%AA%E5%95%8F%E3%81%A8%E5%9B%9E%E7%AD%94)
- [トラブルシューティング](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)
- [更新履歴](https://github.com/Zuntan03/EasyWanVideo/wiki/%E6%9B%B4%E6%96%B0%E5%B1%A5%E6%AD%B4)

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
