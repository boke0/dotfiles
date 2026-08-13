eval "$($HOME/.local/bin/mise env -s zsh)"

# mise shims: 非インタラクティブシェルでもコマンド実行時にツール解決とenv注入を行う
export PATH="$HOME/.local/share/mise/shims:$PATH"
