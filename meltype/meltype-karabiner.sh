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
  const rules = p.complex_modifications.rules = p.complex_modifications.rules || [];
  const desc = "左cmd+英数 で Meltype を選択";
  if (rules.some(r => r.description === desc)) return "already added";
  rules.push({
    description: desc,
    manipulators: [{
      type: "basic",
      from: { key_code: "japanese_eisuu", modifiers: { mandatory: ["left_command"], optional: ["caps_lock"] } },
      to: [{ select_input_source: { input_source_id: "^io\\.github\\.yksr-melt\\.inputmethod\\.Meltype\\.Japanese$" } }]
    }]
  });
  $(JSON.stringify(cfg, null, 4)).writeToFileAtomicallyEncodingError(path, true, $.NSUTF8StringEncoding, null);
  return "added";
}
EOF
