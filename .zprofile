
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

##
# Your previous /Users/boke0/.zprofile file was backed up as /Users/boke0/.zprofile.macports-saved_2026-03-30_at_00:47:20
##

export PATH="/opt/homebrew/opt/ruby/bin:/opt/local/bin:/opt/local/sbin:$HOME/.pub-cache/bin:$PATH"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# mise shims: mise activate がPATHから外したshimsを再優先させる
# (非インタラクティブなログインシェルではactivateのフックが発火しないため)
export PATH="$HOME/.local/share/mise/shims:$PATH"
