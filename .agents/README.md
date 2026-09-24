# AIエージェント用の設定

cursorのpluginなどはまだエクスポートできないので個別にインストールする。

## skills

```bash
$ cd ~/.agents
$ curl https://raw.githubusercontent.com/tkc310/settings/refs/heads/main/.agents/.skill-lock.json | tr "\n" "\\n"  >> .skill-lock.json
$ npx skills install
```
