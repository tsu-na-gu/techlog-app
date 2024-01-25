User.create!(
  name: 'SATOU HIROAKI',
  email: 'hiroakisatou@outlook.com',
  password:'password0123',
  password_confirmation:'password0123',
  admin: true)

AdminUser.create!(
  email: 'hiroakissastou@outlook.com',
  password: 'password0123',
  password_confirmation: 'password0123')

20.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
end

Post.create!(
  user_id: User.all.sample.id,
  title: "Ruby on Railsのパフォーマンス最適化について",
  body: "最近、当社のRailsアプリケーションのレスポンスタイムが遅くなってきました。特に、ユーザー一覧ページのロードに時間がかかります。データベースのクエリログを見ると、N+1問題が発生しているようです。どのように最適化すれば良いでしょうか？"
)

Post.create!(
  user_id: User.all.sample.id,
  title: "Reactのステート管理についてのアドバイス求む",
  body: "大規模なReactアプリケーションを開発中ですが、ステート管理が複雑になってきました。特に、複数のコンポーネント間でステートを共有する際に問題が発生しています。ReduxとContext APIのどちらを使用するのが最適でしょうか？"
)

Post.create!(
  user_id: User.all.sample.id,
  title: "Dockerを使った環境構築のベストプラクティス",
  body: "開発チーム全体でDockerを使った環境構築を検討しています。しかし、Dockerfileとdocker-compose.ymlの設定で最適な構成がわかりません。特に、データベースのコンテナ管理についてアドバイスがほしいです。"
)

Post.create!(
  user_id: User.all.sample.id,
  title: "CI/CDパイプラインの設定に関する質問",
  body: "Jenkinsを使ってCI/CDパイプラインを構築していますが、ビルドが頻繁に失敗します。特に、テストステージでの環境変数の扱いに苦労しています。ビルドの安定化に向けたベストプラクティスがあれば教えてください。"
)

Post.create!(
  user_id: User.all.sample.id,
  title: "新しいJavaScriptフレームワークの選定",
  body: "新しいプロジェクトで使用するJavaScriptフレームワークの選定に頭を悩ませています。現在、Vue.jsとReactのどちらを選ぶかで迷っています。プロジェクトは中規模で、チーム内にはJavaScriptの初学者もいます。どちらのフレームワークが学習曲線や開発速度の面で優れていると思いますか？"
)
comments = ["N+1クエリ問題に対処するために、includes メソッドを使って関連するオブジェクトを事前にロードすると良いでしょう。","パフォーマンスのボトルネックを特定するために、New RelicやSkylightといったパフォーマンスモニタリングツールの利用をお勧めします。"]
comments.each do |comment|
  Comment.create!(
    user_id: User.all.sample.id,
    post_id: Post.find(1).id,
    body: comment
  )
end
comments = ["Reduxは非常に強力ですが、学習曲線が急です。初学者にはContext APIの方が取り組みやすいかもしれません。", "ステートが複雑な場合はReduxを、単純な場合はContext APIを使うのが一般的です。また、Redux Toolkitを使用するとReduxの設定が簡単になります。"]
comments.each do |comment|
  Comment.create!(
    user_id: User.all.sample.id,
    post_id: Post.find(2).id,
    body: comment
  )
end
comments = ["Docker Composeはサービス間の依存関係を管理するのに適しています。特に開発環境での使用が効果的です。", "データベースの永続化にはボリュームを使用し、データのバックアップにも注意してください。"]
comments.each do |comment|
  Comment.create!(
    user_id: User.all.sample.id,
    post_id: Post.find(3).id,
    body: comment
  )
end
comments = ["環境変数はJenkinsの設定ファイルやシークレットマネージャーを通じて安全に管理することをお勧めします。", "パイプラインの各ステップを小さく保ち、再利用可能なジョブやスクリプトを作成することで、ビルドの安定性を高めることができます。"]
comments.each do |comment|
  Comment.create!(
    user_id: User.all.sample.id,
    post_id: Post.find(4).id,
    body: comment
  )
end
comments = ["「Vue.jsは文書が非常に充実しており、初学者に優しいと言われています。小〜中規模のプロジェクトに適しています。", "Reactはより大きなコミュニティと豊富なライブラリを持っていますが、初学者にはやや難易度が高いかもしれません。ただし、将来的なスケーラビリティを考慮すると、Reactの方が良い選択かもしれません。"]
comments.each do |comment|
  Comment.create!(
    user_id: User.all.sample.id,
    post_id: Post.find(5).id,
    body: comment
  )
end