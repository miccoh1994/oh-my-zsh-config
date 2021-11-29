ZSH_THEME="lima-agnoster"

prompt_context() {
  # Custom (Random emoji)
  emojis=("⚡️" "🔥" "💀" "👑" "😎" "🐸" "🐵" "🦄" "🌈" "🍻" "🚀" "💡" "🎉" "✊" "Ⓜ️" "🌙" "🧬" "🍾" "🐳")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
  prompt_segment transparent default "${emojis[$RAND_EMOJI_N]} "
}
precmd () { print -Pn "\e]2; %~\a" } # title bar prompt
DISABLE_AUTO_TITLE="true"

