
#import "lib.typ": *

#show: init.with(
  number: [1A1],
  japanese-title: [飛行機シンポジウム講演集原稿書式の見本],
  english-title: [How to Prepare the Paper for the 62st Aircraft Symposium of JSASS],
  author: (
      (
        japanese-name: [航空一郎],
        english-name: [Ichiro Koku],
        is-speaker: true,
      ),
      (
        japanese-name: [宇宙花子],
        english-name: [Hanako Uchu],
        is-speaker: false,
      ),
    ),
  statement: (
    japanese: [日本航空宇宙学会],
    english: [JSASS],
  ),
  keywords: ([Society Activities], [etc...]),
  abstract: [
    This is the manual for how to prepare your manuscript for the 62th Aircraft Symposium of Japan Society for Aeronautical and Space Science (JSASS). All the final drafts should be written by word processors with the format specified in this manual. Your final draft in a form ready for photo-printing must arrive at the Society Head-quarters by 9th August, 2024. Any questions regarding this manual should be addressed to headquarters.
  ],
)

= はじめに

このページは第62回飛行機シンポジウム講演集用原稿のフォント及び書式の見本です．
これまで学会誌に掲載されている執筆要領に従って原稿作成をお願いしていましたが，第38回よりA4判の前刷集に合わせて書式を変更しています．

= 原稿の書式について
講演集は電子化に伴い，ページ数の制限を原則として撤廃します．4ページ以上としますが，目安として4～8ページとして下さい．

書式はA4判での出力に合わせて従来のものに比べてフォントを小さくして，実質的に約1ページ分文字数を増やしています．
また，本文は2段組とし（段組なしでも可），本文以外は段組なしの中央揃えなっています．
また，上下左右の余白も変更してありますのでご注意下さい．

= 講演集
第39回より，講演集はCD-ROMによる出版のみとなりました．
また第61回より，オンライン配布となりました．
第60回までのCD-ROM講演集では，本文の説明を補足するためのファイルも収録できるようになっていましたが，利用実績がほとんど無く，少なくとも第58～60回における利用者がいなかったことから，またオンライン配布方式におけるダウンロードの利便性も考慮して，第61回から補足ファイルの収録を廃止することとしました．

#figure(
  image("figure/JSASS_symbol.svg"),
  caption: [JSASSのシンボル],
)<fig:JSASS-symbol>

表題の左に記載する講演番号は，この執筆要領を発送する時点では決定できませんが，8月下旬以降にホームページ上でご確認下さい．

（この文章は9.5ポイントの明朝体で作成されています．）

= 追加事項
本テンプレートは，元の書式には含まれない幾つかの設定を追加しています．

ディスプレイ形式の数式は，
$
  H(X) = - integral_(-infinity)^infinity p(x) log p(x) dd(x)
$<math:shannon_entropy>
のように表示されます．
引用時には，@math:shannon_entropy のように参照できます．
インライン形式の数式は，$H(X)$のように表示されます．

図を引用するときには，@fig:JSASS-symbol のように参照できます．
図の番号は1--9の時に全角数字に変換され，10以降は半角数字となります．
コードは，
#figure(
```julia
for i in 1:10
  println("number : $i")
end
```,
placement: bottom,
caption: [juliaのループ],
)<code:julia-loop>
のように表示されます．
引用時には，@code:julia-loop のように参照できます．

図を１行に配置したい場合には，以下のように書きます．
図の位置としては，`top`と書くことで上部に配置され，`bottom`と書くことで下部に配置できます．
表については，上のように専用関数`tblr`を使用すれすることで，整った形式で表示できます．
引用は@table:格子数とレイノルズ数の関係 のようにされます．

#figure(
  tblr(
    columns: 2,
    [格子数],[$64 times 64 times 64$],
    [レイノルズ数 $"Re"_lambda$],[$100$],
  ),
  caption: [格子数とレイノルズ数の関係],
  scope: "parent",
  placement: top
)<table:格子数とレイノルズ数の関係>

箇条書きは，

- 1つ目の項目
- 2つ目の項目

のように表示されます．
番号付きリストは，

+ 1つ目の項目
+ 2つ目の項目

のように表示されます．

下線を引く場合には，#underline[下線を引くテキスト] のように書きます．
文字と被らないように，やや位置を調整してあります．

注釈を挿入することも可能です．
このように書く#footnote[注釈の中身]ことで，文書の下に注釈が追加されます．

#bibliography-list(
  title: [参考文献],
  ..bib-file(read("refs.bib")),
)
