# Airplane-symposium-typst
【非公式】飛行機シンポジウムTypst用テンプレート

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

4. `main.typ`および`refs.typ`をコピーする

   ```bash
   cp Airplane-symposium-typst/main.typ main.typ
   cp Airplane-symposium-typst/refs.bib refs.bib
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
