# activate the default browser
default_app=$(plutil -p ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist | grep 'https' -b3 |awk 'NR==3 {split($4, arr, "\""); print arr[2]}');
osascript -e "tell application id \"$default_app\"" -e 'activate' -e 'end tell';
