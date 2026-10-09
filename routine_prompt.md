/morning
Role: Researcher
Sections: news in international law; news in IT media
Include action buttons.
Language: English

After the brief is rendered, also deliver it to Telegram:

1. Check that the environment variables TELEGRAM_BOT_TOKEN and TELEGRAM_CHAT_ID are set
   (`test -n "$TELEGRAM_BOT_TOKEN" && test -n "$TELEGRAM_CHAT_ID"`). Never print their values.
   If either is missing, skip the Telegram steps and say so in your final message.
2. Write a short text version of the brief to /tmp/tg_brief.txt (at most 3500 characters):
   the date as a heading, the shape of the day, meetings with times, items to prepare,
   and the top 3 headlines of each section with links. Use Telegram HTML formatting only
   (<b>, <i>, <a href="...">); escape &, < and > everywhere else.
3. Send it:
   curl -sS --fail-with-body "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
     -F chat_id="${TELEGRAM_CHAT_ID}" -F parse_mode=HTML -F disable_web_page_preview=true \
     -F "text=</tmp/tg_brief.txt"
   If Telegram answers with a parse error, send it again without parse_mode.
4. Send the rendered HTML brief as a file:
   curl -sS --fail-with-body "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendDocument" \
     -F chat_id="${TELEGRAM_CHAT_ID}" -F document=@<path to the brief .html> \
     -F caption="Morning brief — <date>"
5. Both responses must contain "ok":true. In your final message, say whether the Telegram
   delivery succeeded, and if not, quote Telegram's "description" field.
