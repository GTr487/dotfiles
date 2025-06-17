#!/bin/bash
SEARCH_ENGINE="https://duckduckgo.com/?q="

eval "$(xdotool getmouselocation --shell)"

CHOICE=$(printf "Copy\nPaste\nOpen\nWebiar" | rofi -dmenu -location 0 -xoffset 0 -yoffset 0 -xpos "$X" -ypos "$Y")

case "$CHOICE" in
  Copy)
    xclip -selection clipboard
    ;;
  Pegar)
    xclip -selection clipboard -o | xdotool type --
    ;;
  Webiar)
    TEXT=$(xclip -o -selection primary)

    if [[ "$TEXT" =~ ^[a-zA-Z]+:// ]]; then
      xdg-open "$TEXT"
    else
      QUERY=$(printf "%s" "$TEXT" | sed 's/ /+/g')
      xdg-open "$SEARCH_ENGINE$QUERY"
    fi
    ;;
esac

