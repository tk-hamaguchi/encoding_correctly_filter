前提(/^"([^"]*)\/"ディレクトリが空である$/) do |path|
  FileUtils.rm_rf aruba.root_directory.join(path)
end

前提(/^カレントディレクトリがプロジェクトルートである$/) do
  cd aruba.root_directory.relative_path_from(aruba.current_directory.expand_path).to_path
end

もし(/^`(.+)`コマンドを実行する$/) do |cmd|
  run_simple(cmd)
end

もし(/^`rake (.+)`を実行する$/) do |task|
  run_simple "rake #{task}"
end

ならば(/^(stdout|stderr)に下記の文字列が出力されている:$/) do |output, text|
  expect(last_command_started.send(output.to_sym)).to match text
end

ならば(/^ファイル"([^"]*)"が存在している$/) do |path|
  expect(file?(eval('"' + path + '"'))).to be_truthy
end
