#!/bin/bash

IOS_DEVICE=$(flutter devices | grep -i ios | awk '{print $1}' | head -n 1)
ANDROID_DEVICE=$(flutter devices | grep -i android | awk '{print $1}' | head -n 1)

if [ -z "$IOS_DEVICE" ] || [ -z "$ANDROID_DEVICE" ]; then
  echo "❌ Soit l’iPhone soit l’émulateur Android n’est pas détecté."
  exit 1
fi

PROJECT_PATH="$HOME/Desktop/save_your_car"

# iOS
osascript -e 'tell application "Terminal"
  do script "cd '$PROJECT_PATH' && flutter run -d '$IOS_DEVICE'"
end tell'

# Android
osascript -e 'tell application "Terminal"
  do script "cd '$PROJECT_PATH' && flutter run -d '$ANDROID_DEVICE'"
end tell'
