# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ─── Zsh Config for a Beautiful Shell ─────────────────────────────

# ░░░ Path Setup ░░░
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# ░░░ Use Modern Zsh Features ░░░
autoload -Uz compinit promptinit
compinit
promptinit

# ░░░ Enable Powerlevel10k Prompt ░░░
# (Install via: `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k`)
source ~/powerlevel10k/powerlevel10k.zsh-theme

# ░░░ Plugins: Syntax Highlighting & Suggestions ░░░
# (Install both with Git if not present)

# Zsh Syntax Highlighting
if [[ -d "${ZSH_HIGHLIGHT_DIR:-$HOME/.zsh/zsh-syntax-highlighting}" ]]; then
  source "${ZSH_HIGHLIGHT_DIR:-$HOME/.zsh/zsh-syntax-highlighting}/zsh-syntax-highlighting.zsh"
fi

# Zsh Autosuggestions
if [[ -d "${ZSH_AUTOSUGGEST_DIR:-$HOME/.zsh/zsh-autosuggestions}" ]]; then
  source "${ZSH_AUTOSUGGEST_DIR:-$HOME/.zsh/zsh-autosuggestions}/zsh-autosuggestions.zsh"
fi

# ░░░ Terminal Visual: Fastfetch (on start) ░░░
if command -v fastfetch &> /dev/null; then
  fastfetch
fi

# ░░░ History Behavior ░░░
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt inc_append_history share_history

# ░░░ Aliases ░░░
alias cls='clear'
alias update='sudo pacman -Syu'
alias grep='grep --color=auto'
alias zshconfig='nvim ~/.zshrc'

# ░░░ UI Enhancements ░░░
setopt prompt_subst
setopt auto_cd
setopt correct

# ░░░ Autocomplete Options ░░░
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ░░░ Enable Vi Mode (Optional) ░░░
bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
