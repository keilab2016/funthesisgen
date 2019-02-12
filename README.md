# funthesisgen
未来大卒業論文提出支援ツール

## 卒論関連提出ファイル生成ツール
* TeXで作られた卒業論文PDFから、概要PDF、概要テキスト、論文情報CSVファイルを生成
## 提出ファイルチェックツール

## 必要なライブラリ等
* Popplerで提供されるpdftocairoコマンド、pdftotextコマンド
* pdftotextコマンドを日本語対応させるxpdf-japanese.tar.gz
* Gnu Bashおよびgawk

## インストール手順(Mac)
1. HomeBrewをインストール
1. brew install poppler
1. xpdf用の日本語サポートファイルを用意
 1. xpdfのダウンロードサイトから日本語用のlanguage support files(xpdf-japanese.tar.gz)をダウンロード
 1. 展開したファイルを /usr/local/share/xpdf/japanese に置く
 1. 以下の内容で /usr/local/etc/xpdfrc を作成する
 ```
    textEncoding UTF-8
    cidToUnicode    Adobe-Japan1    /usr/local/share/xpdf/japanese/Adobe-Japan1.cidToUnicode
    unicodeMap  ISO-2022-JP /usr/local/share/xpdf/japanese/ISO-2022-JP.unicodeMap
    unicodeMap  EUC-JP      /usr/local/share/xpdf/japanese/EUC-JP.unicodeMap
    unicodeMap  Shift-JIS   /usr/local/share/xpdf/japanese/Shift-JIS.unicodeMap
    cMapDir     Adobe-Japan1    /usr/local/share/xpdf/japanese/CMap
    toUnicodeDir            /usr/local/share/xpdf/japanese/CMap
 ```
