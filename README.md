# EasyWanVideo

- [Wan 2.1](https://github.com/Wan-Video/Wan2.1) による画像から動画の生成 (I2V) を、ローカルで簡単に試せる環境です。
	- 最近の NVIDIA 製 GPU を搭載した、メインメモリ 32GB 以上の Win11 PC で動作します。
		- 動作確認環境は Geforce RTX 3060 12GB とメインメモリ 64GB です。
	- プロンプトからの動画の生成 (T2V) にも一応対応していますが、メインは I2V です。
- I2V の元画像は [EasyReforge](https://github.com/Zuntan03/EasyReforge) などでお好みのキャラやシチュエーションの画像を用意します。
	- 動画のアニメーションはプロンプトだけでなく、[Wan 用 LoRA](https://civitai.com/search/models?baseModel=Wan%20Video&modelType=LORA&sortBy=models_v9) も併用すると楽に制御できます。
- **動作確認環境の Geforce RTX 3060 12GB で生成した作例（要 X ログイン）：  
[13](https://x.com/Zuntan03/status/1903297439840231636), 
[12](https://x.com/Zuntan03/status/1902557483383525596), 
[11](https://x.com/Zuntan03/status/1901936730238030302), 
[10](https://x.com/Zuntan03/status/1901421174359461985), 
[9](https://x.com/Zuntan03/status/1901052598607601850),
[8](https://x.com/Zuntan03/status/1900804662569431481), 
[7](https://x.com/Zuntan03/status/1899818287225242020), 
[6](https://x.com/Zuntan03/status/1899368720251920775), 
[5](https://x.com/Zuntan03/status/1899022954434056661), 
[4](https://x.com/Zuntan03/status/1898645052978770217), 
[3](https://x.com/Zuntan03/status/1898559953687961728),
[2](https://x.com/Zuntan03/status/1896103446983688362), 
[Day1](https://x.com/Zuntan03/status/1894893100025422207)**
	- **インストール後に 100 超えのサンプル動画と、その生成設定を確認できます。**
- 紹介記事：
	- 2025/03/31『[動画生成AI、革命の兆し 「Stable Diffusion」級の衝撃再び](https://ascii.jp/elem/000/004/260/4260102/)』 p. 4
	- 2025/03/10『[動画生成AIの進化がすごい　「超リアル」「ローカルで動く」2つの方向に](https://ascii.jp/elem/000/004/255/4255982/)』 p. 3
	- 2025/03/14『[【動画生成AI】EasyWanVideoを使ってみる【Wan2.1】](https://note.com/aiaicreate/n/n5bf5060e4a14)』
	- 2025/03/09『[[紳士向け] オープンソース＆次世代AI「Wan 2.1」と「EasyWanVideo」で、簡単に叡智動画を生成できる使い方ガイド！](https://note.com/ryu_senpen/n/n017863a1a7cd)』
- 利用事例（[「EasyWanVideo」検索にかかった投稿](https://x.com/search?q=EasyWanVideo) より）：
	- [「画像からのプロンプト生成」のオンオフで変わる効き方の傾向ちょっとずつ分かってきた](https://x.com/Alone1Moon/status/1902162041454117353)  
[@shibaben](https://x.com/shibaben/status/1903022334908506461),
[@wann_waf](https://x.com/wann_waf/status/1902766615881764871),
[@MultusDim_AI](https://x.com/MultusDim_AI/status/1902632239495835816),
[@Alone1Moon](https://x.com/Alone1Moon/status/1901997760582398191),
[@shibaben](https://x.com/shibaben/status/1901956637503500675),
[@tailtales](https://x.com/tailtales/status/1901937917410361816),
[@atakatadai](https://x.com/atakatadai/status/1900036189777699010),
[@Kuze0x0_](https://x.com/Kuze0x0_/status/1899871791025455299),
[@kiyoshi_shin](https://x.com/kiyoshi_shin/status/1899324353998627021),
[@kagami_kami_m](https://x.com/kagami_kami_m/status/1898958790470639923)

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/I2vAll.webp)

## [重要] Kijai 版と Native 版、2種類の Wan 生成環境

[ComfyUI](https://github.com/comfyanonymous/ComfyUI) での Wan 動画の生成環境には、[Kijai 版](https://github.com/kijai/ComfyUI-WanVideoWrapper) と [Native 版](https://comfyanonymous.github.io/ComfyUI_examples/wan/) の 2種類があります。

**現在はメインメモリが 48GB 以上なら、Kijai 版の利用を推奨しています。**

メインメモリの [DDR4 64GB(32GB * 2) は \15,000～](https://kakaku.com/pc/pc-memory/itemlist.aspx?pdf_Spec101=6&pdf_Spec105=2&pdf_Spec301=32) で、GPU よりもずっと安価です。ローカル AI 動画生成では、交換や増設を検討ください。メインメモリの交換や増設には [マザーボードの仕様確認が必要](https://www.google.com/search?q=%E3%83%9E%E3%82%B6%E3%83%BC%E3%83%9C%E3%83%BC%E3%83%89+DIMM+%E5%A2%97%E8%A8%AD+%E5%AF%BE%E5%BF%9C) です。わからない場合は PC 販売元のサポートやクラウド AI にお問い合わせください。

||Kijai 版|Native 版|メモ|
|-:|:-:|:-:|:-|
|メインメモリ|最低 48GB|[最低 16GB](https://x.com/T22901800417/status/1903550766163619856)|Kijai 版が GGUF 非対応の影響大。|
|VRAM|最低 8GB?|[最低 6GB](https://x.com/ooana11/status/1901116323763286063)|厳密な VRAM 下限は未確認だが、12GB で余裕あり。<br>Native 版は GGUF で、Kijai版は BlockSwap で削減。|
|生成時間|短い|長い|Kijai 版の FlowUniPCMultistepScheduler は 10ステップで I2V 可。<br> Native 版は倍以上のステップ数が必要。|

気づけていない点がありましたら、お知らせください。  
特に Native 版で FlowUniPCMultistepScheduler を利用する方法があれば、知りたいです。

## EasyWanVideo のインストールとチュートリアル

1. [EasyWanVideoInstaller.bat](https://github.com/Zuntan03/EasyWanVideo/raw/main/EasyWanVideo/EasyWanVideoInstaller.bat?ver=0) を右クリックから保存します。
2. インストール先の空フォルダを `C:/EasyWan/` や `D:/EasyWan/` などの浅いパスに用意して、ここに `EasyWanVideoInstaller.bat` を移動して実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
3. インストール先の `EasyWanVideo/vc_redist.x64.exe` で、`Microsoft Visual C++ Redistributable` をインストールします。

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

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/SampleError.webp)

### ひとことワークフロー紹介

**動画編集系のワークフローを多用する際は、`劣化なしで重い webp 保存` を有効にすると再エンコードによる劣化を防げます、が重いです。**

|ワークフロー名|説明|
|-:|:-|
|`Kijai_I2v`|画像から動画を生成する I2V。|
|`Kijai_I2vEnd`|開始と終了の画像から動画を生成する I2V。|
|`Kijai_T2v1B`|テキストから動画を生成する T2V の軽量版。|
|`Kijai_T2v14B`|テキストから動画を生成する T2V の高品質版。|
|`KijaiFun_Vi2v`|動画と静止画から動画を生成する VI2V。|
|`Native_I2v`|ComfyUI ネイティブ版の I2V。<br>メインメモリ 32GB で動作するが、FlowUniPCMultistepScheduler が利用できない問題あり。|
|`GetLastImage`|動画の最終フレームの画像を取得する。|
|`TwoImageInterpolate`|2枚の画像を補間する動画を生成する。|
|`Cut`|指定したフレームで動画の前や後ろを切り取る。|
|`ReversePlayback`|動画を逆再生にする。|
|`ColorMatch`|動画の色合いを指定した画像に合わせる。|
|`FadeIn`|動画をフェードインする。|
|`FadeOut`|動画をフェードアウトする。|
|`Mosaic`|動画にモザイクを掛ける。|
|`ConcatInterpolate`|ふたつの動画を滑らかに繋げる。|
|`Concat`|ふたつの動画を繋げる。|
|`TileUpscale`|コントロールネットの Tile を利用して書き換えつつ拡大する。|
|`Upscale`|動画を ESRGAN 系アップスケーラーで拡大する。|
|`Crop`|動画の一部を切り抜く。|
|`Resize`|動画のサイズを変更する。|
|`AddLabel`|動画にテキストのラベルをつける。日本語対応済み。|
|`Tiling`|動画を縦や横に並べる。|
|`Interpolate`|動画のフレームを補間して `*.mp4` に変換する。|
|`InterpolateWebp`|動画のフレームを補間して `*.webp` のまま保存する。|
|`ConvertMp4`|動画を `*.mp4` に変換する。`Interpolate` の利用を推奨。|
|`SequentialImages`|動画を連番画像に変換する。|
|[`Kijai_I2v_LoraChecker`](https://github.com/Zuntan03/EasyWanVideo/wiki/LoraChecker-%E3%83%AF%E3%83%BC%E3%82%AF%E3%83%95%E3%83%AD%E3%83%BC)|LoRA 設定の組み合わせパターンで動画を生成し、最適な設定を探す。|
|`AudioSeparation`|音声を `Vocal`, `Bass`, `Drums`, `Other` に分離します。|
|`AudioCombine`|音声を平均や加算で結合します。<br>`AudioCombine` のエラーは入力音声を `AudioSeparation` でとりあえず回避できます。 |
|`CannyCheck`|VI2V で利用する動画キャニーのパラメータを調査します。|
|`Vi2vPreprocess`|`KijaiFun_Vi2v` 用の元動画や、改変元の開始イメージを用意します。|

## EasyWanVideo の更新方法

1. `Update.bat` を実行すると、EasyWanVideo を更新します。
	- `Workflow/Easy/*.json` が最新の状態になります。
2. ご利用のワークフローに合わせて `Download/` にある `Kijai_I2v.bat` や `Native_I2v.bat` を実行すると、LoRA などの新たに入手可能なファイルがあればダウンロードします。
3. `Sample/_Dwonload.bat` を実行すると、新たに入手可能なサンプルがあればダウンロードします。
	- 新たなサンプルは新たな LoRA を参照している場合があり、`2.` のダウンロードを必要とする場合があります。

`2.` と `3.` は必要に応じての実行で問題ありません。

## ドキュメント

- [I2V Kijai 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Kijai-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
- [I2V Native 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Native-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
- [動画の仕上げチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E5%8B%95%E7%94%BB%E3%81%AE%E4%BB%95%E4%B8%8A%E3%81%92%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
- [I2V 連結で状況変化する動画を生成](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-%E9%80%A3%E7%B5%90%E3%81%A7%E7%8A%B6%E6%B3%81%E5%A4%89%E5%8C%96%E3%81%99%E3%82%8B%E5%8B%95%E7%94%BB%E3%82%92%E7%94%9F%E6%88%90)
- [長尺の動画生成](https://github.com/Zuntan03/EasyWanVideo/wiki/%E9%95%B7%E5%B0%BA%E3%81%AE%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90)
- [Wan Fun InP でお手軽に長尺の動画生成](https://github.com/Zuntan03/EasyWanVideo/wiki/Wan-Fun-InP-%E3%81%A7%E3%81%8A%E6%89%8B%E8%BB%BD%E3%81%AB%E9%95%B7%E5%B0%BA%E3%81%AE%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90)
- [動画と画像から動画生成 VI2V チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E5%8B%95%E7%94%BB%E3%81%A8%E7%94%BB%E5%83%8F%E3%81%8B%E3%82%89%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90-VI2V-%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
- [より高速な動画生成](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%82%88%E3%82%8A%E9%AB%98%E9%80%9F%E3%81%AA%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90)
- [LoraChecker ワークフロー](https://github.com/Zuntan03/EasyWanVideo/wiki/LoraChecker-%E3%83%AF%E3%83%BC%E3%82%AF%E3%83%95%E3%83%AD%E3%83%BC)
- [よくある質問と回答](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%82%88%E3%81%8F%E3%81%82%E3%82%8B%E8%B3%AA%E5%95%8F%E3%81%A8%E5%9B%9E%E7%AD%94)
- [トラブルシューティング](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)
- [更新履歴](https://github.com/Zuntan03/EasyWanVideo/wiki/%E6%9B%B4%E6%96%B0%E5%B1%A5%E6%AD%B4)

## 最近の更新履歴

### 2025/04/13

- サンプルに `20250413_missionary.mp4` を追加しました。
	- 最初に ABCD の 4枚の画像を用意して、InP で `A>B`, `B>C`, `C>D`, `D>A` に遷移する動画を生成し、ガチャのあたりを `A>B>C>D` と繋げたものです。
		- 『[開始フレーム画像と終了フレーム画像に異なる絵を指定して Fun_I2vEnd](https://github.com/Zuntan03/EasyWanVideo/wiki/Wan-Fun-InP-%E3%81%A7%E3%81%8A%E6%89%8B%E8%BB%BD%E3%81%AB%E9%95%B7%E5%B0%BA%E3%81%AE%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90#%E9%96%8B%E5%A7%8B%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0%E7%94%BB%E5%83%8F%E3%81%A8%E7%B5%82%E4%BA%86%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0%E7%94%BB%E5%83%8F%E3%81%AB%E7%95%B0%E3%81%AA%E3%82%8B%E7%B5%B5%E3%82%92%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%A6-fun_i2vend)』
- 以下の LoRA を追加しました。
	- `Download\loras\Nsfw\BulgePovMissionary_v10.bat`
	- `Download\loras\Nsfw\PovMissionary_v11.bat`

### 2025/04/12

- [Wan2.1-Fun-14B-InP モデル](https://huggingface.co/alibaba-pai/Wan2.1-Fun-14B-InP) でより高精度な開始・終了フレーム画像の指定ができる `KijaiFun_I2vEnd` ワークフローを追加しました。
	- `Download\Kijai_I2v.bat` または `Download\diffusion_models\Kijai\Wan2_1-FunInP-14B_fp8_e4m3fn.bat` でモデルをダウンロードします。
- ドキュメントに『[Wan Fun InP でお手軽に長尺の動画生成](https://github.com/Zuntan03/EasyWanVideo/wiki/Wan-Fun-InP-%E3%81%A7%E3%81%8A%E6%89%8B%E8%BB%BD%E3%81%AB%E9%95%B7%E5%B0%BA%E3%81%AE%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90)』を追加しました。
- サンプルに `20250412_fingering` を追加しました。
- 以下の LoRA を追加しました。
	- `Download\loras\Nsfw\Fingering_v10.bat`
	- `Download\loras\Nsfw\SquirtingVag_v101.bat`
	- `Download\loras\Nsfw\BoobGrab_v01.bat`

### 2025/04/11

- `Visual Studio Build Tolls 2022` のインストールを不要にしました。
	- 代わりに `Microsoft Visual C++ Redistributable` のインストールが必要になります。
- VAE と seed の接続でエラーが表示される問題を修正しました。
- Kijai 版で `WanVideo Model Loader` の `quantization` を `fp8_e4m3fn` にするために、バージョンを巻き戻しました。

### 2025/04/10

- Kijai 版で `WanVideo Model Loader` の `quantization` が `fp8_e4m3fn` の状態で LoRA を利用すると、`RuntimeError: Promotion for Float8 Types is not supported, attempted to promote Float8_e4m3fn and Float` のエラーになるようです。
	- `quantization` を `disable` にすると回避できています。

### 2025/04/09

- 特定の環境で `python setup.py bdist_wheel did not run successfully.` のエラーでインストールに失敗する問題に対処しました。

### 2025/04/08

- インストール方法を変更し、追加のインストール作業なしで Geforce RTX 50x0、SageAttention、Triton に対応できるようにしました。
	- CUDA Toolkit のインストールは不要になりましたので、アンインストールしても問題ありません。
	- TorchCompile を利用する場合は、引き続き `Visual Studio Build Tolls 2022` のインストールが必要です。
- 以下のダウンロードに対応しました。
	- `Download\diffusion_models\Kijai\Wan2_1-FunInP-1_3B_bf16.bat`
	- `Download\diffusion_models\Kijai\Wan2_1-FunInP-14B_fp8_e4m3fn.bat`
	- `Download\loras\Fun\FunInP_1B_RewardHps.bat`
	- `Download\loras\Fun\FunInP_1B_RewardMps.bat`
	- `Download\loras\Fun\FunInP_14B_RewardHps.bat`
	- `Download\loras\Fun\FunInP_14B_RewardMps.bat`

### 2025/04/04

- 『[動画と画像から動画生成 VI2V チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E5%8B%95%E7%94%BB%E3%81%A8%E7%94%BB%E5%83%8F%E3%81%8B%E3%82%89%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90-VI2V-%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)』をひとまず完成させました。
- `Download\loras\Bundle\nims1.bat` を追加しました。
- `Download\loras\T2v1B\TinkerWan_v10.bat` を追加しました。
- サンプルに `20250404_vi2v_*` を追加しました。
- 更新時に `kijai/ComfyUI-WanVideoWrapper` の `example_workflows` を、ワークフローの `Kijai/` にコピーするようにしました。
- `Download\diffusion_models\Kijai\Wan2_1-VacePreview-1_3B.bat` を追加しました。
- `Download\diffusion_models\Kijai\Wan2_1-VacePreview-1_3B_bf16.bat` を追加しました。
	- `WanVideo VACE Model Select` ノードが必要です。
- ワークフローの `Kijai/wanvideo_1_3B_VACE_examples_01` を試せます。
	- 動いているっぽいですが、まだ良い結果を得られていません。

### 2025/03/31

- コントロールネットの Tile を利用して書き換えつつ拡大する `TileUpscale` ワークフローを追加しました。
- `KijaiFun_Vi2v` で OpenPose に対応しました。
	- 弱めのデプスと組み合わせると良い感じかもしれません。

### 2025/03/30

- 動画と画像からの動画生成 (VI2V) の準備中です。
	- `Download/Kijai_Ti2v.bat` でモデルをダウンロードします。
	- ワークフローに `KijaiFun_Vi2v`, `Vi2vPreprocess`, `AudioSeparation`, `AudioCombine`, `CannyCheck` を追加しました。
	- `VideoTool/` に動画を FFmpeg で前処理する `SetPlaySpeed`, `Cut_16FPS_81frames`, `6_Cut_16FPS_81frames_Mirror`, `Cut_16FPS_49frames`, `6_Cut_16FPS_49frames_Mirror` を追加しましたi。
- 調査＆執筆中の『[動画と画像から動画生成 VI2V チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E5%8B%95%E7%94%BB%E3%81%A8%E7%94%BB%E5%83%8F%E3%81%8B%E3%82%89%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90-VI2V-%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)』
	- 素材の準備部分を参考にしてください。

### 2025/03/29

- `Update.bat` を更新したため、更新に失敗する可能性があります。
	- 更新に失敗した場合は `Update.bat` を再度実行してください。
- Kijai 版の本家更新に伴い、既存ワークフローの接続がずれて壊れています。
	- エラー箇所を正しく繋ぎ直すか、`Easy/` 以下のワークフローをご利用ください。

### 2025/03/27

- `Easy/` の Kijai 版ワークフローのパラメータを、公式サンプルの更新に合わせつつ調整しました。
	- `ClipVision Encode` の `tile` 無効化。
	- `WanVideo Sampler` の `rope_function` を `comfy` に変更。
- Kijai I2V 系ワークフローに [`CFG Zero*`](https://github.com/WeichenFan/CFG-Zero-star) の品質調整オプションを追加しました。

### 2025/03/26

- LoRA 設定の組み合わせパターンで動画を生成し、最適な設定を探す `LoraChecker` のワークフローと [ドキュメント](https://github.com/Zuntan03/EasyWanVideo/wiki/LoraChecker-%E3%83%AF%E3%83%BC%E3%82%AF%E3%83%95%E3%83%AD%E3%83%BC) を追加しました。
- `Download\loras\Motion\Turn_Spin_Rotation_Pirouette_v05.bat` の LoRA を追加しました。

### 2025/03/24

- 『[長尺の動画生成](https://github.com/Zuntan03/EasyWanVideo/wiki/%E9%95%B7%E5%B0%BA%E3%81%AE%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90)』のサンプルを追加しました。
	- `20250324_long.mp4` は 20 動画を連結しています。
- 動画を連番画像に変換する `SequentialImages` ワークフローを追加しました。

### 2025/03/23

- Florence2 が [最新の transformers の 不具合](https://github.com/kijai/ComfyUI-Florence2/issues/134) で動作しないため、`Update.bat` で巻き戻すようにしました。
- ドキュメントにガチャった動画を長くする『[長尺の動画生成](https://github.com/Zuntan03/EasyWanVideo/wiki/%E9%95%B7%E5%B0%BA%E3%81%AE%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90)』を追加しました。
- ドキュメントに『[より高速な動画生成](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%82%88%E3%82%8A%E9%AB%98%E9%80%9F%E3%81%AA%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90)』を追加しました。
- 動画の一部を切り抜く `Crop` ワークフローを追加しました。

### 2025/03/22

- [重要] `Kijai_I2v` と `Kijai_I2vEnd` で TeaCache をデフォルト無効に変更しました。
	- LoRA との相性で効果がとても弱まる場合がありました。
		- サンプルでも TeaCache の無効化で LoRA の効果がより得られる可能性があります。
	- 高速化や品質調整について、ノードのラベル説明を追加しました。
- 代わりといっては何ですが、`Skip Layer Guidance` をデフォルト有効にしました。
	- が、また意図しない箇所で悪影響が出る可能性はあります。

### 2025/03/21

- ドキュメントに『[I2V 連結で状況変化する動画を生成](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-%E9%80%A3%E7%B5%90%E3%81%A7%E7%8A%B6%E6%B3%81%E5%A4%89%E5%8C%96%E3%81%99%E3%82%8B%E5%8B%95%E7%94%BB%E3%82%92%E7%94%9F%E6%88%90)』を追加しました。
	- 作例（X ログインが必要）: [2](https://x.com/Zuntan03/status/1903297439840231636), [1](https://x.com/Zuntan03/status/1902557483383525596)
	- サンプルも追加済みです。
- 実験的な機能として I2V で終了時の画像も指定できる `Kijai_I2vEnd` ワークフローを追加しました。
	- `ComfyUI-WanVideoStartEndFrames` と異なり、LoRA を利用できます。
- `FadeIn` と `FadeOut` のワークフローを追加しました。
- 以下の LoRA を追加しました。
	- `DownloadUnconfirmed\loras\Nsfw\thick_whitish_translucent_semen_v10.bat`
	- `DownloadUnconfirmed\loras\Nsfw720p\FutanariCowgirl_v10.bat`
	- `DownloadUnconfirmed\loras\Nsfw\SexyEnhancer_v10.bat`
	- `DownloadUnconfirmed\loras\Nsfw\Pl0wView_FrontDoggy_v10.bat`

### 2025/03/20

- `InterpolateWebp` ワークフローを追加しました。
- 以下の LoRA を追加しました。
	- `DownloadUnconfirmed\loras\Nsfw\doggystyle_sex_v10.bat`
	- `DownloadUnconfirmed\loras\Nsfw\doggystyle_v10.bat`
- 以下の LoRA のバージョンを更新しました。
	- `Download\loras\Nsfw\PovBlowjob_v11.bat`
	- `DownloadUnconfirmed\loras\Nsfw\POVdog_v11.bat`
- I2V 動画を複数連結するサンプルを追加しました。

### 2025/03/18

- Kijai 版のメモリ不足問題が解消されたので、3/10 のバージョン固定から最新版を追跡するように戻しました。
	- **VRAM が潤沢でない環境では、`WanVideoLoraSelect` ノードで `low_mem_load` を `true` にする必要があります。**
	- `WanVideo BlockSwap` ノードの `use_non_blocking` が有効だと、メモリの消費量が大きくなります。
	- **更新に問題がある場合は、`EasyWanVideo\ComfyUi\KijaiRollback_20250310.bat` でバージョンを巻き戻せます。**
- 動画編集系のワークフローを多数追加しました。
	- 各ワークフローについては『[ひとことワークフロー紹介](https://github.com/Zuntan03/EasyWanVideo#%E3%81%B2%E3%81%A8%E3%81%93%E3%81%A8%E3%83%AF%E3%83%BC%E3%82%AF%E3%83%95%E3%83%AD%E3%83%BC%E7%B4%B9%E4%BB%8B)』を参照ください。
- `DownloadUnconfirmed` に `LiveWallpaper`, `dabaichui_v10`, `l1v3w4llp4p3r_720p`, `BdsmBondage_T2v_ep17`, `Cumshot_T2v_v10`, `doggystyle_T2v_v10`, `shoejob_v10`, `MasturbationCumshot_v10` を追加しました。
- CUDA Toolkit のバージョンを 12.8.1 に更新。

### 2025/03/17

- 動作確認できていないファイルを `DownloadUnconfirmed/` からダウンロードできるようにしました。
	- `DownloadUnconfirmed\UnconfirmedAll.bat` で全てダウンロードできます。
	- `*.bat` 内に配布元 URL を記載しており、エディタによってはダブルクリックや Ctrl クリックで配布元を確認できます。
- 動作確認済みの LoRA とサンプルを追加しました。
	- 三種類の LoRA を同時使用しています。

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
	- 通常の SageAttention のセットアップ（`vs_buildtools.exe` と `cuda_12.8.1_windows_network.exe` のインストール）を済ませた後に、`ExperimentalRtx50x0_CudaNightlyBuildSageAttention.bat` を実行してください。
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

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
