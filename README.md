# Botbrief

Доставка утреннего брифинга Claude (рутина «Morning brief») в Telegram.

Рутина Claude Code по будням в 06:50 UTC собирает брифинг (календарь, почта, новости
международного права и IT) и в конце сама отправляет его в ваш чат через Telegram Bot API:
краткую текстовую версию сообщением и полный HTML-брифинг файлом. Отдельный сервер не нужен.

## Настройка

1. **Создать бота.** В Telegram написать [@BotFather](https://t.me/BotFather) → `/newbot`,
   сохранить токен вида `123456:ABC...`.
2. **Узнать chat_id.** Написать своему боту любое сообщение, затем открыть в браузере
   `https://api.telegram.org/bot<ТОКЕН>/getUpdates` и взять `result[0].message.chat.id`.
3. **Открыть доступ к Telegram из облачного окружения.** В claude.ai/code: меню облачного
   окружения в заголовке сессии → Edit → Network access → добавить `api.telegram.org`
   в Allowed domains (галочку «Allow package managers» оставить).
   Подробнее: https://code.claude.com/docs/en/cloud-environments#network-access
4. **Добавить секреты** в то же окружение как переменные окружения:
   - `TELEGRAM_BOT_TOKEN` — токен из шага 1
   - `TELEGRAM_CHAT_ID` — id из шага 2
5. **Проверить** (локально или в новой облачной сессии):
   ```bash
   TELEGRAM_BOT_TOKEN=... TELEGRAM_CHAT_ID=... ./scripts/test_telegram.sh
   ```

Промпт рутины с шагом доставки лежит в [`routine_prompt.md`](routine_prompt.md).
Если переменные не заданы, рутина просто пропускает отправку в Telegram и пишет об этом.
