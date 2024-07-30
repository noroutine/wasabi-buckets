# wasabi-buckets

Потрібно створити на своєму власному аккаунті в github репозиторій для такої задачі:

для сервісу wasabi.com створити бакети з такими назвами:

sales-data-bucket
marketing-data-bucket
engineering-data-bucket
finance-data-bucket
operations-data-bucket

для кожного бакету створити readonly та readwrite policy

створити користувачів:
alice - має доступ до sales-data-bucket (rw), marketing-data-bucket (rw), engineering-data-bucket (ro)
bob - має доступ до всіх бакетів (rw)
charlie - operations-data-bucket (rw), finance-data-bucket (ro)
backup - має доступ до всіх бакетів (ro)

Потрібно написати на Terraform.
Реєструватися на wasabi не обов'язково

## Aliases
```bash
# Useful aliases
source .includes.sh
```
