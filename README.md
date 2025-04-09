## .vscode/settings.jsonのコピー

プロジェクトルートで下記を実行

```
$ curl "https://raw.githubusercontent.com/tkc310/settings/refs/heads/main/vscode/settings.sh" | sh
or
$ curl 'https://raw.githubusercontent.com/tkc310/settings/refs/heads/main/vscode/settings.json' | tr "\n" "\\n"  >> .vscode/settings.json
```
