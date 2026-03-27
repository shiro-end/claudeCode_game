#!/bin/bash
cd "$(dirname "$0")"
# ローカルサーバーを起動してブラウザで開く
python3 -m http.server 8080 &
SERVER_PID=$!
sleep 0.5

# ブラウザを開く（環境に応じて試す）
if command -v xdg-open &>/dev/null; then
  xdg-open http://localhost:8080
elif command -v sensible-browser &>/dev/null; then
  sensible-browser http://localhost:8080
elif command -v open &>/dev/null; then
  open http://localhost:8080
else
  echo "ブラウザで http://localhost:8080 を開いてください"
fi

# Ctrl+C で終了
trap "kill $SERVER_PID 2>/dev/null" EXIT
wait $SERVER_PID
