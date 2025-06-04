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

インストールで問題が発生した場合は、『**[トラブルシューティング](https://github.com/Zuntan03/EasyWanVideo/wiki/%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB%E3%82%B7%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0)**』を確認ください。  
次はチュートリアルに進みます。

- メインメモリが 48GB 以上で、手軽に NSFW 動画を生成するなら『[簡単高速 NSFW 動画生成のチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)』
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

## 2025/06/04

- `Kijai_NsfwFast` ワークフローで `動画のループや延長` の処理を整理しました。
	- チュートリアルの [動画のループ化](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB#%E5%8B%95%E7%94%BB%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%E5%8C%96) や [動画の延長](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB#%E5%8B%95%E7%94%BB%E3%81%AE%E5%BB%B6%E9%95%B7) も確認ください。
- `Kijai_NsfwFast` ワークフローに `アナル腹ボコ`, `アナル触手姦`, `触手ピット` のプリセットとサンプルを追加しました。

## 2025/06/02

- `Kijai_NsfwFast` ワークフローに VACE でブツ切りな動画を自然に延長する `動画の延長` に対応しました。
	- [動画のループ化](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB#%E5%8B%95%E7%94%BB%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%E5%8C%96) での `生成モードの選択` で、`動画のループ` の代わりに `動画の延長` を選択してください。  
	あとの操作は [動画のループ化](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB#%E5%8B%95%E7%94%BB%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%E5%8C%96) と同じです。
	- `VACE_Extension` サンプルも追加しました。
- 新しい `Kijai_NsfwFast` ワークフローで生成したサンプルを追加しました。
	- `proj_cum`, `fellatio_cum`, `doublejob_cum_GQ-A,B`, `doublejob_cum_MD`, `cowgirl`

## 2025/06/01

- VACE 簡単ループを一昨日リリースされた [CausVid v2.0](https://huggingface.co/Kijai/WanVideo_comfy/blob/main/Wan21_CausVid_14B_T2V_lora_rank32_v2.safetensors) を利用するように変更しました。
	- 色がズレにくく、よりスムーズに繋がるようになります。
	- `Download/Kijai_NsfwFast.bat` で必要なファイルをダウンロードしてください。
- 新しい `Kijai_NsfwFast` ワークフローで生成したサンプルを追加しました。
	- `deepthroat_tatsumaki`, `deepthroat_yachiyo`, `fellatio_deepthroat`, `fellatio_tekoki`, `missionary`

## 2025/05/31

- `Kijai_NsfwFast` ワークフローを [AccVideo LoRA](https://huggingface.co/Kijai/WanVideo_comfy/blob/main/Wan21_AccVid_T2V_14B_lora_rank32_fp16.safetensors) と [CausVid LoRA](https://huggingface.co/Kijai/WanVideo_comfy/blob/main/Wan21_CausVid_14B_T2V_lora_rank32.safetensors) を併用して大幅に改善しました。
	- 480p LoRA と 720p LoRA を併用でき、高速生成でもダイナミックな動きを実現します。
	- `Download/Kijai_NsfwFast.bat` で必要なファイルをダウンロードしてください。
- [簡単高速 NSFW 動画生成のチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB) の内容を変更に合わせて修正しました。
- 新しい `Kijai_NsfwFast` ワークフローで生成したサンプルを追加しました。
	- `paizuri`, `paizuri_proj_cum`

## 2025/05/25

- `Kijai_NsfwFast` ワークフローで 480p LoRA などを利用した際に、開始時に雷光のように動画が乱れることがあります。
	- この部分をカットするために `カットする開始フレーム数` ノードを追加しました。
- ドキュメントに『[簡単高速 NSFW 動画生成のチュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98%E9%AB%98%E9%80%9F-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB)』を追加しました。
- `Kijai_NsfwFast` ワークフローに手コキ の LoRA プリセットを追加しました。
- `Kijai_NsfwFast` ワークフローにフェラチオとダブルフェラの LoRA プリセットを追加しましたが、動画の開始時に雷光のような乱れが発生するため、`カットする開始フレーム数` に `8` で開始 0.5秒程度をカットする必要があります。
- `SampleNsfw` に `tekoki` と `tekoki_cum` を追加しました。

## 2025/05/24

- `Kijai_NsfwFast` ワークフローを追加しました。
	- Geforce RTX 3060 で 3秒動画のシードガチャが 100秒です。  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyWanVideo/log/202505/Fast100sec.png)
	- `Download/Kijai_NsfwFast.bat` で必要なファイルをダウンロードしてください。
	- CausVid との相性により、I2V 720p で学習した LoRA がよく効きます。
		- CausVid との相性の悪い LoRA は、効きが悪くなります。
	- VACE による手軽なループにも対応しています。
- `SampleNsfw` に `paizuri_VaceLoop` と `paizuri_proj_cum` を追加しました。

## 2025/05/14

- `SampleNsfw/` のサンプルに `ShiikoCosplay` を追加しました。
	- EasyReforge に追加したリアル系アジアモデルの [DivingIL_RealAsian_v20](https://civitai.com/models/1562047?modelVersionId=1778467) を利用しています。

## 2025/05/13

- 簡単 NSFW 動画生成のワークフロー `Kijai_NsfwI2v`, `Kijai_NsfwLoop` と[チュートリアル](https://github.com/Zuntan03/EasyWanVideo/wiki/%E7%B0%A1%E5%8D%98-NSFW-%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90%E3%81%AE%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB) を追加しました。
	- よくある構図のエロ画像から、お手軽に動画を生成します。
		- LoRA やプロンプトの調査や調整が不要
		- Wan なので動画生成の時間が短い
		- 実績のあるプリセットで高打率な動画生成
	- **メインメモリ 48GB と VRAM 6GB の NVIDIA ビデオカードが必要です。**  
	- **開発もサンプルの生成も、すべて Geforge RTX 3060 12GB・メインメモリ 64GB 環境で実施しています。**
- [モザイク自動検出モデル](https://civitai.com/models/1313556?modelVersionId=1749813) を更新しました。

## 2025/05/11

- FramePack 叡智で 1フレーム推論をする `FramePackEichi1Frame.bat` を追加しました。
- torch と triton のバージョンを更新しました。

## 2025/05/05

- SkyReelsV2 I2V モデルのダウンロードに対応しました。
	- I2V では `Cfg 5.0, Shift 3.0` が公式のおすすめ設定のようです。
	- `Download\diffusion_models\Kijai\Wan2_1-SkyReelsV2-I2V-14B-540P_fp8_e4m3fn.bat`
		- `Wan2_1-I2V-14B-480P_fp8_e4m3fn` の代わりに利用できます。
	- `Download\diffusion_models\Kijai\Wan2_1-SkyReelsV2-I2V-14B-720P_fp8_e4m3fn.bat`
		- `Wan2_1-I2V-14B-720P_fp8_e4m3fn` の代わりに利用できます。

## 2025/05/04

- ~~現時点では正常動作しませんが、~~`FramePackEichiF1.bat` を追加しました。
	- ~~自前で [仮対処](https://github.com/git-ai-code/FramePack-eichi/issues/40) を入れるか、[元リポジトリでの修正](https://github.com/git-ai-code/FramePack-eichi/commits/main/)をお待ち下さい。~~
		- `Update.bat` 実行時に FramePack-eichi を常に最新版に更新します。
			- ~~動作確認はできませんが、元リポジトリに修正が入れば `Update.bat` ですぐに試せます。~~
	- 5/4 9:30 頃の更新で修正されているようです。

## 2025/05/03

- [FramePack F1](https://github.com/lllyasviel/FramePack/commit/0f4df006cf38a47820514861e0076977967e6d51) 用の `FramePackF1.bat` を追加しました。
- `FramePackEichi.bat` で生成した動画にモザイクを掛けるための、`MosaicMp4` ワークフローを追加しました。

## 2025/04/29

- [Kijai WanVideoWrapper](https://github.com/kijai/ComfyUI-WanVideoWrapper) の Fantasy Talking 更新に伴い、既存ワークフローの `WanVideo Sampler` への接続が壊れています。
	- `Skip Layer Guidance` の `slg_args` を `slg_args` に繋ぎ直してください。
	- `CFG-Zero*` の `exp_args` を `experimental_args` に繋ぎ直してください。
- [FramePack-eichi](https://github.com/git-ai-code/FramePack-eichi) との互換性が失われたため、`FramePackEndFrame.bat` を削除しました。
	- `FramePackEichi.bat` をご利用ください。

## 2025/04/26

- `Sample/` に昨日の I2V と FunInP で 1枚の画像から動画を量産する `20250425_doublejob` サンプルから、開始画像を EasyReforge で書き換えてバリエーションを簡単に生成する `20250426_doublejob` サンプルを追加しました。
	- 今回は楽々モザイク・カラーマッチ・アップスケール・上下にラベル追加・補間しつつ結合・フレーム補間の仕上げのサンプルも追加しています。

## 2025/04/25

- [FramePack-eichi](https://github.com/git-ai-code/FramePack-eichi) を `v1.5` に更新しました。
- `Sample/` に I2V と FunInP で 1枚の画像から動画を量産する `doublejob` サンプルを追加しました。
- 以下の LoRA を追加しました。
	- `Download\loras\Nsfw\AmorousLesbianKisses.bat`
	- `Download\loras\Nsfw\Cumshot_v10.bat`
	- `Download\loras\Nsfw\DoubleSingleBlowjob_v10.bat`
	- `Download\loras\Nsfw\PassionateKissing_v10.bat`

## 2025/04/21

- サンプルに `20250421_framepack` を追加しました。
	- ComfyUI のワークフローで FramePack の最終フレーム画像、キーフレーム画像、キーフレームプロンプトを使用したサンプルです。
- [Kijai WanVideoWrapper](https://github.com/kijai/ComfyUI-WanVideoWrapper) の UniAnimate 更新に伴い、既存ワークフローの接続が壊れています。
	- `slg_args` から `WanVideo Sampler` の `unianimate_poses` への接続を `slg_args` に繋ぎ直します。
	- `exp_args` から `WanVideo Sampler` の `loop_args` または `sigmas` への接続を `experimental_args` に繋ぎ直します。

### 2025/04/20

- `Kijai_I2V_FramePack` ワークフローも [Kijai 版](https://github.com/kijai/ComfyUI-FramePackWrapper) から [nirvash 版](https://github.com/nirvash/ComfyUI-FramePackWrapper) に切り替えました。
	- 開始フレーム画像の他に、最終フレーム画像・キーフレーム画像・キーフレームプロンプトに対応しています。
	- FramePack のモデルで `fp8` と `bf16` の切り替えに対応しましたので、`Download/Kijai_FramePack.bat` でモデルをダウンロードしてください。
	- 最終フレーム画像とキーフレーム画像を同時に利用すると、動画の後半で最終フレーム画像の影響が支配的になるようです。
		- キーフレーム画像の効果を確認する場合は、最終フレーム画像を無効にしたほうがよいかもしれません。
	- 最終フレーム画像は影響力が強いため、開始フレーム画像から最終フレーム画像に 1秒で遷移する動画なども生成できます。
		- ふたつの動画 A, B の、A の最終フレーム画像から B の開始フレーム画像への遷移用の動画生成にも使えそうです。
- `ReversePlayback` ワークフローで `*.mp4` 入力に対応しました。

### 2025/04/19

- [Kijai WanVideoWrapper](https://github.com/kijai/ComfyUI-WanVideoWrapper) の更新に伴い、一部の既存ワークフローの接続が壊れます。
	1. `WanVideo Sampler` の `experimental_args` に `slg_args` からの線が繋がっている場合に、`WanVideo Sampler` の `slg_args` に繋ぎ直します。
	2. `WanVideo Sampler` の `loop_args` に `exp_args` からの線が繋がっている場合に、`WanVideo Sampler` の `experimental_args` に繋ぎ直します。
- [Kijai 版 FramePack](https://github.com/kijai/ComfyUI-FramePackWrapper) に対応した、`Kijai_I2V_FramePack` ワークフローを追加しました。
	- `Download/Kijai_FramePack.bat` で先にモデルをダウンロードしてください。
- 実験的対応な方の FramePack 環境を [nirvash 版](https://github.com/nirvash/FramePack) に切り替え、[EndFrame](https://x.com/nirvash/status/1913149548870156592) や [キーフレーム](https://x.com/nirvash/status/1913234244698357857) に対応する `FramePackEndFrame.bat` を追加しました。
- `SequentialImages` ワークフローで `*.mp4` の読み込みに対応しました。

### 2025/04/18

- FramePack の `*.mp4` が黒画面になるのを修正する `FramePack_FixBlackVideo.bat` を用意しました。
	- 動画を直接 `FramePack_FixBlackVideo.bat` にドラッグ＆ドロップするか、実行してからコンソールにドラッグ＆ドロップで変換します。
- FramePack での画像読み込み時に `h11._util.LocalProtocolError: Too little data for declared Content-Length` が出る問題は、ファイル名を変更するだけで読み込めるようになったりとよくわかりません。
- サンプルに `20250418_cowgirl` を追加しました。
- ~~FramePack の `*.mp4` が黒画面になるのを修正する `FixFramePackMp4` ワークフローを追加しました。~~
	- 削除しました。

### 2025/04/17

- 実験的に [FramePack](https://github.com/lllyasviel/FramePack) 対応を入れてみました。
	- `FramePack.bat` で長時間のインストール後に起動します。
	- `50GB` 程度のストレージが必要です。
	- Geforce RTX 50x0 対応に必要そうなので？ PyTorch や SageAttention のバージョンを引き上げています。
		- 不具合の原因になる可能性もありますが、とりあえず手元の Geforce RTX 3060 では動いています。

### 2025/04/15

- ワークフローに `MMAudio` を追加しました。
	- `*.mp4` の動画とプロンプトから音声を生成します。
	- `Download/MMAudio.bat` で利用前にモデルをダウンロードします。
- サンプルに `20250414_futanari.mp4` を追加しました。
	- I2V で生成した動画を InP で繋いでみるサンプルです。

### 2025/04/14

- サンプルに `20250414_yuri.mp4` を追加しました。
	- I2V で生成した動画を InP で繋いでみるサンプルです。

### 2025/04/13

- サンプルに `20250413_missionary.mp4` を追加しました。
	- 最初に ABCD の 4枚の画像を用意して、InP で `A>B`, `B>C`, `C>D`, `D>A` に遷移する動画を生成し、ガチャのあたりを `A>B>C>D` と繋げたものです。
		- 『[開始フレーム画像と終了フレーム画像に異なる絵を指定して Fun_I2vEnd](https://github.com/Zuntan03/EasyWanVideo/wiki/Wan-Fun-InP-%E3%81%A7%E3%81%8A%E6%89%8B%E8%BB%BD%E3%81%AB%E9%95%B7%E5%B0%BA%E3%81%AE%E5%8B%95%E7%94%BB%E7%94%9F%E6%88%90#%E9%96%8B%E5%A7%8B%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0%E7%94%BB%E5%83%8F%E3%81%A8%E7%B5%82%E4%BA%86%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0%E7%94%BB%E5%83%8F%E3%81%AB%E7%95%B0%E3%81%AA%E3%82%8B%E7%B5%B5%E3%82%92%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%A6-fun_i2vend)』
- サンプルに `20250413_missionary_I2VEnd+InP` を追加しました。
	- 最初に ABCD の 4枚の画像を用意して、I2vEnd で `A>B`, `(A>Bの最終画像)>C`, `(B>Cの最終画像)>D`, `(C>Dの最終画像)>A` を順番に生成します。
		- `(C>Dの最終画像)>A` の最終画像は A とズレるので、これを補間する 1秒の動画を Fun InP で生成してループが繋がるようにしています。
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
