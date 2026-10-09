#!/usr/bin/env bash
# Sends a test message to check TELEGRAM_BOT_TOKEN and TELEGRAM_CHAT_ID.
# Usage: TELEGRAM_BOT_TOKEN=... TELEGRAM_CHAT_ID=... ./scripts/test_telegram.sh
set -euo pipefail

: "${TELEGRAM_BOT_TOKEN:?TELEGRAM_BOT_TOKEN is not set}"
: "${TELEGRAM_CHAT_ID:?TELEGRAM_CHAT_ID is not set}"

curl -sS --fail-with-body "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
  -F chat_id="${TELEGRAM_CHAT_ID}" \
  -F text="Botbrief: test message, delivery works ✅"
echo
