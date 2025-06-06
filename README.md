# Airplane-symposium-typst
【非公式】飛行機シンポジウムTypst用テンプレート

## 必要なフォント

| 形式 | フォント名 |
| ---- | ---- |
| ゴシック体 | [Harano Aji Gothic](https://github.com/trueroad/HaranoAjiFonts) |
| 明朝体 | [Harano Aji Mincho](https://github.com/trueroad/HaranoAjiFonts) |
| 英字 | [Times New Roman](https://www.freefontdownload.org/ja/times-new-roman.font) |
| 数式 | [Latin Modern Math](https://ctan.org/tex-archive/fonts/lm-math) |
| 日本語書式設定 | [Adobe Blank](https://github.com/adobe-fonts/adobe-blank) |

## テンプレートの使い方

1. 個人アカウント（`user`）でTypst文書を管理する新たなレポジトリ（ここでは`repository`という名前を例にする）を作成する
2. そのレポジトリを自分のPCにクローンする

   ```bash
   gh repo clone user/repository
   ```

3. このレポジトリをサブモジュールとして登録する

   ```bash
   cd repository
   git submodule add git@github.com:tkrhsmt/Airplane-symposium-typst.git
   ```

4. `main.typ`および`refs.typ`，`figure`フォルダをコピーする

   ```bash
   cp Airplane-symposium-typst/main.typ main.typ
   cp Airplane-symposium-typst/refs.bib refs.bib
   cp -r Airplane-symposium-typst/figure .
   ```

## サブモジュールの入ったレポジトリをクローンするとき

`repository`というレポジトリで本レポジトリをサブモジュールとして登録している場合，`repository`をcloneするには以下の操作が必要です．

1. 通常通りcloneする

   ```bash
   gh repo clone user/repository
   ```

2. サブモジュールの中身を取得する

   ```bash
   cd repository
   git submodule update --init --recursive
   ```

### テンプレートへの更新を取り入れるとき

1. サブモジュール内をpullする

   ```bash
   cd Airplane-symposium-typst
   git pull origin HEAD
   ```
