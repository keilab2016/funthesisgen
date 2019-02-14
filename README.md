# funthesisgen
未来大卒業論文提出支援ツール

## 卒論関連提出ファイル生成ツール
* **未来大のTeXスタイルファイルを使って作られた** 卒業論文PDFから、概要PDF、概要テキスト、論文情報CSVファイルを生成

### 必要なライブラリ等
* Popplerで提供されるpdftocairoコマンド、pdftotextコマンド
* pdftotextコマンドを日本語対応させるxpdf-japanese.tar.gz
* Gnu Bashおよびgawk

### インストール手順(Mac)
1. HomeBrewをインストール
1. brew install gawk
1. brew install poppler
1. xpdf用の日本語サポートファイルを用意
    1. xpdfのダウンロードサイトから日本語用のlanguage support files(xpdf-japanese.tar.gz)をダウンロード
    1. 展開したファイルを /usr/local/share/xpdf/japanese に置く
    1. 以下の内容で /usr/local/etc/xpdfrc を作成する (もしくは本パッケージに含まれる xpdfrc を /usr/local/etc にコピーする)
 ```
    textEncoding UTF-8
    cidToUnicode    Adobe-Japan1    /usr/local/share/xpdf/japanese/Adobe-Japan1.cidToUnicode
    unicodeMap  ISO-2022-JP /usr/local/share/xpdf/japanese/ISO-2022-JP.unicodeMap
    unicodeMap  EUC-JP      /usr/local/share/xpdf/japanese/EUC-JP.unicodeMap
    unicodeMap  Shift-JIS   /usr/local/share/xpdf/japanese/Shift-JIS.unicodeMap
    cMapDir     Adobe-Japan1    /usr/local/share/xpdf/japanese/CMap
    toUnicodeDir            /usr/local/share/xpdf/japanese/CMap
 ```

### インストール手順(Windows)
1. Git for Windowsをインストール
1. xpdf用の日本語サポートファイルを用意
    1. xpdfのダウンロードサイトから日本語用のlanguage support files(xpdf-japanese.tar.gz)をダウンロード
    1. C:\usr\local\share\xpdf\japanese を作成し、展開したファイルをその中に置く
    1. C:\Program Files\Git\mingw64\bin の中に以下の内容で xpdfrc を作成する (もしくは本パッケージに含まれる xpdfrc を C:\Program Files\Git\mingw64\bin にコピーする)
 ```
    textEncoding UTF-8
    cidToUnicode    Adobe-Japan1    /usr/local/share/xpdf/japanese/Adobe-Japan1.cidToUnicode
    unicodeMap  ISO-2022-JP /usr/local/share/xpdf/japanese/ISO-2022-JP.unicodeMap
    unicodeMap  EUC-JP      /usr/local/share/xpdf/japanese/EUC-JP.unicodeMap
    unicodeMap  Shift-JIS   /usr/local/share/xpdf/japanese/Shift-JIS.unicodeMap
    cMapDir     Adobe-Japan1    /usr/local/share/xpdf/japanese/CMap
    toUnicodeDir            /usr/local/share/xpdf/japanese/CMap
 ```

### 使用方法
1. 卒論本体のPDFファイルをb???????.pdf形式のファイル名にして、extract.sh および gencsv.awk と同じフォルダに置く
1. ターミナル(Windowsの場合はGit Bash)で、 `./extract.sh` を実行

### 注意事項
* 未来大のTeXスタイルファイルを使って作られたもの以外はサポート対象外です
* 目次が英語で表記されているものは適切に処理できません
* 学籍番号や学科名、指導教員名などが想定と異なる記述をされている場合は適切に処理できない場合があります
* 生成された各ファイルは必ず目視確認してください

## 提出ファイルチェックツール
