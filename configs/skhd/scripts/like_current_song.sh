song=$(osascript -e 'tell application "Music" to name of current track as string' 2>/dev/null || echo "unknown track")
artist=$(osascript -e 'tell application "Music" to artist of current track as string' 2>/dev/null || echo "unknown artist")
osascript -e \
  'tell application "Music"' -e \
    'if loved of current track is true then' -e \
      'set loved of current track to false' -e \
      "display notification \"Unliked\" with title \"$song\" subtitle\"$artist\"" -e \
    'else' -e \
      'set loved of current track to true' -e \
      "display notification \"Liked\" with title \"$song\" subtitle\"$artist\"" -e \
    'end if' -e \
  'end tell';
