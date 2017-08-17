SPAかつSEO意識したサイトを作る時のスタック
※ 本記事はポエムです。もし鉞を投げてくれる心優しい方がいたらコメントしてもらえると嬉しいです ><

一からWebサービスを作るにあたり、できる限りモダンな環境を作ろうとしている。
リリースはできる限り早くしたいので、個人的に分からない領域であまり思い切ったことはしない。NoSQL使うとか、サーバーレスとか、Docker本番運用とか。
スタックの構成を考えている時が一番楽しいので、思いついたものを羅列していく。

# インフラ・DevOps


- Elastic Beanstalk (AWS)
    - ELB
    - EC2 with Autoscaling
- RDS
- ElastiCache(Redis)
- S3
- Route53
- CircleCI
    - GitHubと連携して、 `master` ブランチにリリースしたら自動テスト → 自動デプロイ
- GitHub
    - 開発スピードを速めたいので `GitHub Flow` で。
- `.ebextension` 構成管理

AWSは鉄板。
EBはデプロイとオートスケールの設定が楽なので、これにした。
CloudFrontで世界中に Content Delivery したいけど、初期は国内サービスだしな・・・
CircleCIも使い慣れているし、設定が楽で対応プラットフォームも多いのでこれで

# 言語/フレームワーク

- Node.js
    - Express （APIサーバー）
    - Bookshelf.js または Sequelise.js （ORM）
    - node_redis
    - socket.io
- Vue.js
- PostCSS
- テスト
    - Karma + Mocha 使ったこと無いので要検討 Jasmine とか Chai とか色々ある
    - GoogleChrome/lighthouse Chrome59 からの Headless 機能を利用したい
    - ESLint Standard rule で
- UIフレームワーク
    - 全体は `Skeleton.css`
    - コンポーネントは `keen ui` or `element-ui`
- Webpack
    - postcss-loader
    - vue-loader
    - pug-loader
    - babel-es6
    - babel-polifill

Node.jsを選択。JS好きだし、パフォーマンスが良いのと、サーバーとクライアントで言語を共通化できるっていうのがどのくらい恩恵があるのか試してみたいので

- LaravelとかRailsとか鉄板MVCフレームワーク使ってもいいけど、今更やっても正直面白くはない
- Rust, Elixir, Golang, Swift とかやりたいけど、やる理由が無い

# 設計

- CSSドキュメント Materialize.cssみたいな実例付き
- Vue.js コンポーネントドキュメント element-ui みたいな感じにしたい
    - `props`, `event`, `slot` をドキュメント化して、コード見なくても使えるようにしたい
- APIドキュメント
    - REST原則。リソース単位。
- 当たり前かもしれないが、ビジネスロジックはサーバーサイドで全てやる。Vue.jsは描画に専念する。 `methods:` でごちゃごちゃやるのは最悪。
- SEOが必要なページは、Pugで静的なページを返す
- SEOが不要なページ（ログイン後の画面）は、フルSPA

nuxt.jsでSSRとか、BFFとかやりたいけど、どこかで事故りそうなので

# 開発環境

- Vagrant
    - `yarn run watch` でホットリロード

Docker 使いたいんだけど、 Macでトラブったので敬遠
みんなLinux使いにならないかなー Systemd nspawn + Ansible でやりたい

# その他

- JSライブラリ 絶対他にもあるけど
    - [moment.js](https://momentjs.com/)
    - axios
    - lodash
    - cropper.js 及び vue-cropper
    - [Faker.js](https://github.com/marak/Faker.js/)
- Slackに通知を集約
- KPI管理のために、 `re:dash` 入れるのも有り superset でも良いかも？
- Vim, Vim, Vim...




- Slackに通集約
