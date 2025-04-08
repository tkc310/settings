#!bin/sh

if [ ! -d ./.vscode ]; then
  mkdir ./.vscode;
fi

echo $(curl "https://raw.githubusercontent.com/tkc310/settings/refs/heads/main/vscode/settings.json") >> .vscode/settings.json;
