# language: ja

機能: Gemのパッケージング
  背景:
    * "pkg/"ディレクトリが空である

  シナリオ: `rake build`でpkg配下にgemファイルが作成される
    前提 カレントディレクトリがプロジェクトルートである
    もし `rake build`を実行する
    ならば stdoutに下記の文字列が出力されている:
      """
      encoding_correctly_filter \d+\.\d+\.\d+ built to pkg/encoding_correctly_filter-\d+\.\d+\.\d+.gem.
      """
    ならば ファイル"pkg/encoding_correctly_filter-#{EncodingCorrectlyFilter::VERSION}.gem"が存在している

