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

**Kijai 版が GGUF に対応したため、古い情報です。**

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
2. インストール先の **空フォルダ** を `C:/EasyWan/` や `D:/EasyWan/` などの浅いパスに用意して、ここに `EasyWanVideoInstaller.bat` を移動して実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
3. インストール先の `EasyWanVideo/vc_redist.x64.exe` で、`Microsoft Visual C++ Redistributable` をインストールします。

インストールが完了したら、ComfyUI が正常動作することを確認します。  
**まだ、I2V の生成はできません。チュートリアルで生成できるようになります。**

- `ComfyUi.bat` を実行すると、ComfyUI を起動できます。
	- **過去にインストールした ComfyUI のワークフローが開かれ、`Missing Node Types` が表示される場合があります。**  
関係のないワークフローですので、閉じてください。
- 黒いコンソール画面を閉じると、EasyWanVideo を終了できます。
- `Update.bat` を実行すると、EasyWanVideo を更新できます。
	- 利用するワークフローに合わせて `Download/*.bat` も実行してください。

インストールで問題が発生した場合は、『**[トラブルシューティング](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)**』を確認ください。  
次はチュートリアルに進みます。

- 手軽に NSFW 動画を生成するなら『[簡単高速 NSFW 動画生成のチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)』  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/NsfwFast.webp)

- ~~メインメモリが 48GB 以上なら『**[I2V Kijai 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Kijai-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)**』~~
- ~~メインメモリが 32GB なら『**[I2V Native 版チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/I2V-Native-%E7%89%88%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)**』~~

I2V のチュートリアルでは動画素材を生成します。  
お好みの動画素材を生成できたら、動画を仕上げます。

- 動画素材を公開用に整える 『**[動画の仕上げチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E5%8B%95%E7%94%BB%E3%81%AE%E4%BB%95%E4%B8%8A%E3%81%92%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)**』

よくある使い方についての問い合わせを、『**[よくある質問と回答](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%82%88%E3%81%8F%E3%81%82%E3%82%8B%E8%B3%AA%E5%95%8F%E3%81%A8%E5%9B%9E%E7%AD%94)**』にまとめています。

### ひとことワークフロー紹介

**動画編集系のワークフローを多用する際は、`劣化なしで重い webp 保存` を有効にすると再エンコードによる劣化を防げます、が重いです。**

|ワークフロー名|説明|
|-:|:-|
|`Kijai_I2v`|画像から動画を生成する I2V。|
|`Kijai_I2v_FramePack`|[FramePack](https://github.com/kijai/ComfyUI-FramePackWrapper) で画像から動画を生成する I2V。|
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
|`MosaicMp4`|mp4 動画にモザイクを掛ける。主に FramePack で生成した動画用。|
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
|`MMAudio`|動画とプロンプトから音声を生成する。|
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

- [簡単高速 NSFW 動画生成のチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
- [簡単 NSFW 動画生成のチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)
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

### 2025/07/28

- `Easy/Kijai_NsfwFast` ワークフローで `ComfyUI-VideoHelperSuite` の互換性のない変更によるエラーを修正しました。

### 2025/07/27

**`Update.bat` での更新後に、`Download\Kijai_NsfwFast.bat` で必要なファイルをダウンロードしてください。**

- `NsfwFast` のプリセットに `アニメ顔` を追加しました。
	- `SampleNsfw` にアニメモデルとの比較用サンプルも追加しました。
- `ComfyUI-Impact-Pack\requirements.txt` のインストール時に発生していたエラーを修正しました。
	- エラーが発生していても、実害は確認していません。
- `ComfyUI-VideoHelperSuite` のバージョンを、互換性のない変更が入る前に固定しました。
- すべてのカスタムノードのバージョンを固定しました。
- `Download/Kijai_NsfwFast.bat` への `BetterAnimeSexFaces_v40` の追加を漏れを修正しました。
	- `Update.bat` 後に `Download\Kijai_NsfwFast.bat` してください。

### 2025/07/26

**`Update.bat` での更新後に、`Download\Kijai_NsfwFast.bat` で必要なファイルをダウンロードしてください。**

- `Easy/Kijai_NsfwFast` ワークフローを更新しました。
	- 新しい高速化 LoRA でチューニングを見直しました。
		- 動画開始時の色変化を低減しました。
	- Anisora をマージしたモデルで、LoRA によっては顔がリアルになってしまう現象を低減できるようにしました。以下の設定で利用できます。  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/log/202507/Anisora.png)
	- Hires. Fix のステップ数を 4 から 3 に削減して高速化しました。
		- 通常生成を `3`ステップ、Hires. Fix を `2`ステップに減らすこともできますが、細部や動きが劣化します。
	- Pusa に対応しました。相性の良い LoRA ではクオリティが向上しています。以下のオプションで LoRA をマージするか、マージ済みモデルをダウンロードします。利用時にはサンプラーを `lcm` から `flowmatch_pusa` に変更してください。  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/log/202507/Pusa.png)
- 以下のファイルのダウンロードに対応しました。
	- `Download\diffusion_models\Native\Wan21-BothI2v-FastMix2-14B-Q3_K_M.bat`
	- `Download\diffusion_models\Native\Wan21-BothI2vAnisora-FastMix2-14B-Q3_K_M.bat`
	- `Download\loras\Fast\lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.bat`
	- `Download\loras\Fast\lightx2v_T2V_14B_cfg_step_distill_v2_lora_rank256_bf16.bat`
	- `Download\loras\Fast\Wan21_PusaV1_LoRA_14B_rank512_bf16.bat`
- 新しくマージした FastMix2 モデルを [HuggingFace で公開](https://huggingface.co/Zuntan/Wan21-FastMix) しています。
	- fp8 や高精度 GGUF のモデルをダウンロードできます。

描画のループや延長の VACE モデルはまだ見直していませんが、先に Wan 2.2 が出そうです。

### 2025/07/17

- `Download\loras\Fast\lightx2v_I2V_14B_480p_cfg_step_distill_rank(4~128)_bf16.bat` を追加しました。
- `Download\loras\Fast\lightx2v_T2V_14B_cfg_step_distill_v2_lora_rank(64~4)_bf16.bat` のリネームに対応しました。
- `Mosaic` 系ワークフローの自動検出モデルの更新忘れを修正しました。

### 2025/07/16

- `Download\loras\Fast\Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank64.bat` と `Download\loras\Fast\Wan21_I2V_14B_lightx2v_cfg_step_distill_lora_rank64.bat` を追加しました。
	- `Download\loras\Fast\Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank64.bat` はまともに動作しないようです。
- `Download\loras\Fast\lightx2v_T2V_14B_cfg_step_distill_v2_lora_rank(128~4)_bf16.bat` を追加しました。
	- Kijai 版の T2V LoRA は手元で VACE ループを試してみた範囲ではまともに動作しています。
	- 128 と 16 以外はファイル名末尾に `_` が残っていたため、修正でそのうちリンク切れするかもしれません。

### 2025/07/15

- `NsfwFast` のプリセットに `ガラスフロア` を追加し、`SampleNsfw` にサンプルも追加しました。
	- VRAM 12GB 環境で作成した、1728x2304 で 7秒のループ動画です。

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/Gguf2Fp8.png)

### 2025/07/14

- `NsfwFast` に `ループや延長の追加スワップ` を追加しました。
	- `画像から動画` で調整した `ブロックスワップ数` の指定のままで、`動画のループや延長` を利用できるようにします。

### 2025/07/13

- `NsfwFast` で Kijai 版 GGUF に対応する大規模な更新をしました。
	- **`NsfwFast` を 32GB RAM & 8GB VRAM で利用できるようになりました**（ドキュメント更新はそのうち）。
		- 余ったメモリはブロックスワップ削減で高速化・高解像度動画・長尺動画・並列作業などにご利用ください。
	- **`Update.bat` 後に `Download\Kijai_NsfwFast.bat` でモデルをダウンロードする必要があります。**
- `SampleNsfw` に GGUF 対応の `Dance` サンプルを追加しました。

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/log/202507/Gguf32GB.webp)

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/man/NsfwFast.webp)

### 2025/07/06

- `NsfwFast` で `長辺: 1024px` が効かない不具合を修正しました。
- `Download\loras\Fast\WanSelfForcingAccelerator_Rank16.bat` を追加しました。

### 2025/06/30

- `NsfwFast` で `アニメ胸揺れ` プリセットが動作していなかった不具合を修正しました。

### 2025/06/29

- `NsfwFast` の `壁紙ゆらぎ` プリセットの [サンプル](https://yyy.wpx.jp/EasyWanVideo/SampleNsfw/20250629-wallpaper.mp4) を追加しました。
- `NsfwFast` の `動画のループや延長` での明度調整をデフォルト無効にしました。

### 2025/06/24

- `NsfwFast` を調整しました。
	- `動画のループや延長` が正常に動作しない不具合を修正しました。
	- 埋め込みのオフロードを有効にしました。
	- コンパイルモードを `max-autotune-no-cudagraphs` から `default` に変更しました。

### 2025/06/22

- `NsfwFast` を [lightx2v/Wan2.1-T2V-14B-StepDistill-CfgDistill](https://huggingface.co/lightx2v/Wan2.1-T2V-14B-StepDistill-CfgDistill) を軸に再構成し、打率と速度を向上しました。
	- **`Download\Kijai_NsfwFast.bat` で追加ファイルをダウンロードしてください。**
	- 480p LoRA の打率が向上し、動画開始時のフラッシュが起こりにくくなりました。
	- Geforce RTX 30x0 系でもコンパイルを使えるようにし、デフォルトでコンパイルを有効にしました。
		- 推論時間の比率が高い Hires Fix 利用時に、高速化を実感しやすいです。
	- `動画のループや延長` での色ズレが起こりにくくなりました。
		- ループや延長部分の明るさを抑える機能も追加しています。
- プリセットプロンプトと入力欄プロンプトを、`(prompt: 1.5)` 構文で強化する `プロンプトの強化` を追加しました。
	- `画像からのプロンプト生成` は強化の対象外です。
- [ComfyUI-WanVideoWrapper](https://github.com/kijai/ComfyUI-WanVideoWrapper) の互換性の無い変更で、既存のワークフローが使えなくなる場合があります。
	- `WanVideo Sampler` の `image_embeds` と `text_embeds` を入れ替えるように接続し直すことで修正できます。

### 2025/06/16

- `Kijai_NsfwFast` に `ディルド乗り` のプリセットとサンプルを追加しました。
	- `Download\loras\Nsfw\DildoRide_v20.bat`

### 2025/06/15

- `Kijai_NsfwFast` にて高速化 LoRA を切り替えられるようにしました。
	- 高速化 LoRA 組み込み済みモデルの利用時に、無効化してください。
- `壁紙ゆらぎ` と `汎用プリセット` を利用した `wallpaper` サンプルを追加しました。
- 2倍アップスケーラと 4倍アップスケーラを切り替えられるようにしました。
	- `UltraSharpV2` などの 4倍アップスケーラ利用時には、アップスケール後に半分に縮小して 2倍の拡大率にします。

|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/log/202506/DisableFastLora.png)|![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/log/202506/Upscale_x2x4.png)|
|:-:|:-:|

### 2025/06/14

- `Kijai_NsfwFast` に `主観視点の積極的騎乗位`, `騎乗位`, `胸揺れ`, `アニメ胸揺れ` を比較する `cowgirl` サンプルを追加しました。
- `Kijai_NsfwFast` の HiresFix 利用時に、画像サイズのアスペクト比によって `The size of tensor a (xxx) must match the size of tensor b (xxx) at non-singleton dimension 3` のエラーになる不具合を修正しました。

### 2025/06/13

- `Kijai_NsfwFast` で HiresFix に対応しました。
	- ガチャの当たり動画に対して、後から画質を格段に向上できます。
		- `SampleNsfw/` にある元動画の `20250613-upscale_Original.mp4` と、HiresFix 後の `20250613-upscale_HiresFix.mp4` を見比べてみてください。
		- UltraSharpV2 や AnimeSharpV4 のアップスケーラでは、目のディティール改善が限定的です。
	- ガチャの当たり動画を読み込んで、`I2V HiresFix` ノードを `HiresFix あり` に変更して再生成します。  
**最初から HiresFix 有効で生成するのはオススメしません。**  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/log/202506/HiresFix.webp)

	- VRAM 消費は大きく、生成時間は長くなります。
		- 参考値: Geforce RTX 3060 12GB、長辺 576px
			- 3sec 動画なら HiresFix 2倍
			- 5sec 動画なら HiresFix 1.5倍
	- HiresFix 後に `動画のループ` や `動画の延長` も VRAM が足りればできます。
		- `動画の長さ` を `2秒` に縮めて VRAM を節約することで生成できたりします。
	- **VRAM 不足のエラーになっても、画面上部の `Free model and node cache` してから生成するとエラーにならない場合があります。**
- `Kijai_NsfwFast` のプリセットに `主観視点の積極的騎乗位` と `アニメ胸揺れ` の LoRA を変更しました。
	- `Download\loras\Nsfw\AssertiveCowgirl_v10.bat`
	- `Download\loras\Nsfw\BounceOfPleasure_v10.bat`
- `Kijai_NsfwFast` のプリセットで `騎乗位` の LoRA を変更しました。
	- `Download\loras\Nsfw\c0wg1rl_v10.bat`
- アップスケールモデルに `UltraSharpV2` を追加しました。
	- `Download\upscale_models\4x-UltraSharpV2.bat`
	- `Download\upscale_models\4x-UltraSharpV2_Lite.bat`

### 2025/06/10

- `Kijai_NsfwFast` プリセットの `貝合せ`, `胸揺れ` サンプルの `tribadism` を追加しました。

### 2025/06/09

- `Kijai_NsfwFast` プリセットに `汎用 NSFW`, `胸揺れ`, `貝合せ` のプリセットを追加しました。
- `triton` と `sageattention` のバージョンを更新しました。

### 2025/06/08

- `Kijai_NsfwFast` ワークフローに `足コキ`, `胸揉み` のプリセットと `footjob_grab_breast`  サンプルを追加しました。
- `Download\ultralytics\segm\AnimeNsfwDetectionAll_v4.bat` のバージョンを v3 から v4 に上げました。

### 2025/06/04

- `Kijai_NsfwFast` ワークフローで `動画のループや延長` の処理を整理しました。
	- チュートリアルの [動画のループ化](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB#%E5%8B%95%E7%94%BB%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%E5%8C%96) や [動画の延長](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB#%E5%8B%95%E7%94%BB%E3%81%AE%E5%BB%B6%E9%95%B7) も確認ください。
- `Kijai_NsfwFast` ワークフローに `アナル腹ボコ`, `アナル触手姦`, `触手ピット` のプリセットとサンプルを追加しました。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
