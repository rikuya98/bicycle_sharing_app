## はじめに
 初めましてrkyと申します。
未経験者が自身の趣味を楽しむ中で感じている課題から、初めてwebアプリの作成に挑戦しましたので紹介させて頂きたいと思います。

## 制作背景
　私の趣味はロードバイクです。　ロードバイクと言えばタイトなジャージを身に纏いレースに出場する。長い距離を走る、そんなイメージを持たれる人が多いと思います。でも、それだけではありません。例えば
・美味しい物を食べに行く（カフェ巡り等）
・景色の良い場所を走る
・観光地を巡る
・キャンプをする
・あてもなく散策する
...etc
こんなにもたくさんの楽しみ方があります。
毎週末自転車に乗り、美味しい店を発掘したり、走っていて気持ち良いコースを見つけたりする中で、こんなことを思うようになりました。

・もっと色々な場所やお店に行ってみたい！
・地元の人しか知らないようなコースやお店を知りたい！
・自分が知らない自転車の楽しみ方を知りたい！

そういった情報は、ネットで調べても意外と出てこないものです。
インスタは検索がしにくい上にコース情報はわからない。
コース作成ができるサービスはあっても手間が掛かって投稿のハードルが高い。
そこで、とにかく簡単に、手軽にお店の情報、画像、コースを投稿し、共有できるサービスが欲しいと考え、自転車のコース共有アプリの作成に至りました。

## 使用技術
【フロントエンド】
* HTML/CSS
* javascript
* jQuery
* haml
【バックエンド】
* Ruby 2.7.7
* Rails 6.0.6
* OAuth
* StravaAPI（アクティビティデータの取得)
* GoogleAPI（ユーザー認証)
【インフラ】
* heroku

## 機能一覧
|    |  機能  |　　　　　gem　　　　　|    
|:----:|:----:|:----:|
|1.|ログイン機能　|devise ・　omniauth|
|2.|コース投稿(CRUD)|×|
|3.|コメント投稿(非同期処理)|×|
|4.|いいね機能(非同期処理)|×|
|5.|プロフィール機能|×|
|6.|コース検索機能|×|
|7.|タグ機能（ジャンル・都道府県)|jp_prefecture（都道府県情報の取得)|
|8.|コース検索機能|×|
|9.|人気記事表示|×|
|10.|いいね記事表示|×|
|11.|コース投稿機能(StravaAPI)|omniauth-strava(アクセストークンの取得)<br>attr_encrypted（トークンの暗号化）<br>httparty(APIの使用、アクティビティデータ取得）|
|12.|ページネーション機能|kaminari|
|13.|画像投稿機能|×|
|14.|ゲストログイン機能|×|
|15.|URL埋め込み機能|nokogiri(リンク先のタイトル取得）|

## ER図
![ER図.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/8bb7a1a5-d691-795d-c4f1-02c6819a510c.png)


## ポートフォリオのURL
* GitHub: https://github.com/rikuya98/bicycle_sharing_app
* URL:　https://bicycle-sharing-app.herokuapp.com/

## 使用イメージ
### 1.トップページ
![スクリーンショット 2023-05-05 18.56.08（大）.jpeg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/64bfe887-9aa5-7aeb-b7c8-0a9978751705.jpeg)
・トップページにアクセスすると画面が描画されます。
・ヘッダーにてTOP HowTo コース検索 ユーザー登録　ログイン　ゲストログイン を配置して、どのページにいる際もアクセスできるようにしています。


### 2.ユーザー登録・認証
・Emailとpasswordでの登録、GoogleのOAuth認証の２つの方法から選んで登録、認証できるようにしています。
・初回登録時は、プロフィール入力画面に自動で遷移するようになっています。
![スクリーンショット 2023-05-21 11.41.23.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/280d3305-3d3c-43cf-cf04-70ba73911271.png)


### 3.コースの投稿
新規投稿ボタンをクリックで投稿ページに遷移します。
* 画像(複数枚投稿可能）
* タイトル
* ジャンルタグ (グルメ・観光・アウトドア・オフロード・景色・競技）
* 都道府県タグ
* 内容
* アクティビティ情報(stravaというアクティビティ投稿アプリと連携すれば使用可能になります）
* お店のURL
の情報を記入し、投稿することができます。
![スクリーンショット 2023-05-21 11.42.33.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/15b191ea-e975-969d-9bd7-4450fe4241b2.png)


記事詳細ページ

![記事詳細画面（大）.jpeg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/ae3ddcbb-e86e-db14-db15-f0941922d7bf.jpeg)



##### こだわったポイント
* ジャンルタグを作成することで、ユーザーが、自分の楽しみ方に合ったコースを探しやすいようにしています。
* 都道府県タグも設定できるようにすることで、行きたい場所に合わせて検索できるようにしています。
* 自転車乗りなら誰もが使用しているstravaと連携することで、自分が走ったコースをそのまま反映し、手軽に共有できるようにしています。
* お店のURLのLINKを入れることで、ユーザーがお店の詳細情報にアクセスしやすいようにしています。

### 4.プロフィール画面
* プロフィールを見ることで、自分と楽しみ方が似ているユーザー、同じ自転車の種類に乗っているユーザーを探せるようにしています。
*  プロフィール画面に、そのユーザーが投稿した記事、いいねした記事を見れるようにすることで、同じ楽しみ方やレベル感のコースを見つけやすいようにしています。
![プロフィール（大）.jpeg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/b2ca319c-2404-656d-2383-1e278815619c.jpeg)



### 4.投稿一覧
* TOPページでは、新着記事と人気記事（いいねの多い順に表示）が見れるようにしています。
* プロフィールページでは、先ほども述べたようにユーザーの投稿記事、いいねした記事を見れるようにしています。
* 記事一覧はページネーション機能を作成し、記事の量が増えた際も、処理が重たくならないようにしたり、ユーザーが記事を閲覧しやすいようにしています。ページネーションはkaminariのライブラリを使用して実装しました。

![スクリーンショット 2023-05-21 11.43.37.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/d7be0230-e3cc-4af1-ca82-d0aca6281f91.png)


### 5.コース検索ページ
* キーワード、ジャンル、都道府県の３つの条件から絞り込めるようにしています。検索を押すと、どんな検索条件で検索しているのか視覚的にもわかりやすいように表示しています。

![コース検索画面（大）.jpeg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/a1524617-b904-5ef1-5d3d-b51e8ad00624.jpeg)



### 6.いいね機能
* Ajaxを用いて、非同期処理でいいねができるようにしています。いいね数は記事一覧ページからでも見れるようにすることで、人気の高い投稿を探しやすくしています。

![Kapture 2023-05-21 at 11.46.17.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/da97abd2-1753-a428-a32a-28cca76654a5.gif)

### 7.コメント機能
* 同じくAjaxを用いて、非同期処理でコメントを投稿できるようにしています。
* コメントを通して、行ってみた感想や、コースについての質問などができるようにしています。


### 8.Strava連携機能
* 自転車乗りの中で最も利用者の多いStravaというアクティビティ投稿アプリと連携できるようにしています。
マイメニューからstravaと連携をクリックして、stravaのユーザー情報を入力することでアクセストークンを取得して自身のアクテビティのデータにアクセスできるようになります。
ストラバとの認証には「omniauth-strava」
APIへのリクエストは「HTTPparty」アクセストークンの暗号化には「attr_encrypted」のライブラリを使用しました。


![Kapture 2023-05-21 at 11.19.51 (1).gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3301763/bdac3ac3-f18e-d9bb-6030-060e7b420f88.gif)




### 9.苦労したところ
* コメントの非同期処理での投稿・削除
変数の再宣言のエラーなどで、上手く投稿が反映されず苦労しました。
こちらの記事にて、詳しくまとめています
https://qiita.com/rikuya98/items/e0afe727688ba9fb6a1e

* コース検索機能
キーワード、都道府県、ジャンルの３つの条件で絞り込めるようにしたのですが、複数の項目にチェックして検索した際に、検索結果が上手く返ってこず苦労しました。
デバッグしていった結果、ジャンルを指定せずに検索すると空の値が渡って、空白の値で検索したため、当てはまる検索結果が見つからなかったようでした。
reject(&:blank?)を使用して、空白の値を除去することで無事に実装することができました。
チェックボックスの項目にするとチェックしていない項目が空白文字として出力される仕様が原因でした。

* stravaAPIを使用してのアクティビティデータの投稿
 一番苦労したのがここです。
stravaAPIを使用してアクティビティデータを取得して、記事に埋め込んで投稿するようなアプリを作成した事例がほとんどなく、参考にできる記事もあまりなかったのです。
クラメソさんの以下の記事や
https://dev.classmethod.jp/articles/strava-api-introduction/
stravaAPIのドキュメントを翻訳して読みながら
https://developers.strava.com/docs/getting-started/
挑戦しました。
OAuth認証でCleiantIDが無効になるエラーで２週間ほどつまりました。POSTMANを使ったり、ログを見たり何度確認しても、IDは正しいし、色々なアプローチをしながら原因を推測しては、試してを繰り返しました。結果、考えられる原因がライブラリぐらいになり、omniauth-stravaのソースコードを見ると、Clieant_idとClieant_secretをtoken_paramsに含めているようなコードが見当たらないことを発見しました。
モンキーパッチという手法があることを知り、ファイルを作成し、ライブラリにidとsecretを追加するコードを追加すると無事、認証することができました。

### 10.工夫したところ
* コースの共有アプリということで、ユーザーが投稿してくれなければ意味がありません。そこで、とにかく手軽に投稿できることに自分なりにこだわりました。
画像は、フォルダから選択するだけで投稿。
コースも、stravaAPIを使用すれば特に自分でコースを引いたり、作成することなく、自分の走ったログを使用して共有できるようにしました。
画像なしでも、文が短くても、コースがなくても、URLだけでも、ユーザーの好きな形で投稿できるようにすることでハードルを下げられるようにしました。

### 11.今後したいこと
* 画像を投稿する際に、ユーザー自身が好きな範囲で画像をトリミングして投稿できるようにしたいと考えています。あとは、画像に文字を入れられるようにすることで、より利用者に情報が伝わりやすいようにしたいです。
* 画像投稿の際の処理速度が遅いので、原因を探り高速化できるようにしたいです。
* フォロー機能の実装。フォロー機能を作成することで、自分とジャンルの合うユーザー同士が繋がれるようにしたいと思っています。フォロワー同士が一緒にライドしたり、イベントを開いたり、マッチングできるようにしたりしていくことで、より幅広い使い方ができたり、自転車の楽しさを広げていけるサービスにしていきたいです。
* 難易度の設定。星で５段階で難易度も投稿できるようにすることで自分のレベル感に合ったコースを選択でき、ミスマッチが起こりにくいようにしたいです。
* 機材や道具紹介記事の投稿。サイクリングを楽しむ上で便利なアイテムなども投稿し共有できると面白いなと感じています。ユーザーが増えることで企業にとっても自社の製品を紹介、掲載してもらうメリットなども生まれるのでは？？ということも思っています。
* スマホなどでも手軽に使用できるようにレスポンシブ対応をしたいと思っています。
* HowToページがまだ作成できていないので、ユーザーが一目で使い方がわかるように作成したいです。

### 最後に
ここまで読んでいただきありがとうございます。
初めてのwebアプリの作成は躓くことも多かったですが、その度に原因を考え、仮説を立て実行したり、調べることの繰り返してきました。
その中で、どこでエラーが起きているのか、コンソールなどを使用してどんな値が返ってきているのか、どこまで動いているのかなど確認しながら、手立てや解決方法を考えることの大切さを改めて感じることができました。自分にとって大きな学びにもなり、アウトプットすることの重要性を感じました。

まだまだ、改善しなければならない課題も多く存在します。実際のサービス開発においても、課題を解決し、日々改善することを大切だと思いますので、今後も進めていきたいと思います。

初学者ですので間違った点など多々あると思います。その際はご指摘、ご教示いただけると嬉しいです。




