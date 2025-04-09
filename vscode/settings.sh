#!bin/sh

if [ ! -d ./.vscode ]; then
  mkdir ./.vscode;
fi

curl "https://raw.githubusercontent.com/tkc310/settings/refs/heads/main/vscode/settings.json" | tr "\n" "\\n" >> .vscode/settings.json;
