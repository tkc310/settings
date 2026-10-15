#!/bin/bash
set -euo pipefail
cfg="$HOME/.config/karabiner/karabiner.json"
[ -f "$cfg" ] || { echo "karabiner.json が見つかりません: $cfg" >&2; exit 1; }
cp "$cfg" "$cfg.bak"
osascript -l JavaScript - "$cfg" <<'EOF'
ObjC.import('Foundation');
function run(argv) {
  const path = argv[0];
  const cfg = JSON.parse(ObjC.unwrap($.NSString.stringWithContentsOfFileEncodingError(path, $.NSUTF8StringEncoding, null)));
  const p = cfg.profiles.find(x => x.selected) || cfg.profiles[0];
  p.complex_modifications = p.complex_modifications || {};
  const old = ["左cmd+英数 で Meltype を選択", "かな で Meltype（ひらがな）に戻す", "英数/かな=Google, cmd+英数=Meltype"];
  const rules = (p.complex_modifications.rules || []).filter(r => !old.includes(r.description));
  const sel = (id) => [{ select_input_source: { input_source_id: id } }];
  rules.unshift({
    description: "英数/かな=Google, cmd+英数=Meltype",
    manipulators: [
      { type: "basic",
        from: { key_code: "japanese_eisuu", modifiers: { mandatory: ["command"], optional: ["caps_lock"] } },
        to: sel("^io\\.github\\.yksr-melt\\.inputmethod\\.Meltype\\.Japanese$") },
      { type: "basic",
        from: { key_code: "japanese_eisuu", modifiers: { optional: ["caps_lock", "shift"] } },
        to: sel("^com\\.google\\.inputmethod\\.Japanese\\.Roman$") },
      { type: "basic",
        from: { key_code: "japanese_kana", modifiers: { optional: ["caps_lock", "shift"] } },
        to: sel("^com\\.google\\.inputmethod\\.Japanese\\.base$") }
    ]
  });
  p.complex_modifications.rules = rules;
  $(JSON.stringify(cfg, null, 4)).writeToFileAtomicallyEncodingError(path, true, $.NSUTF8StringEncoding, null);
  return "ok";
}
EOF
