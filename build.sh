#!/usr/bin/env bash

pip install -r requirements.txt

python manage.py collectstatic --noinput

python manage.py migrate

python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
User.objects.filter(username='adminswarup').exists() or User.objects.create_superuser(
'adminswarup',
'[swarupsekhar21@gmail.com](mailto:swarupsekhar21@gmail.com)',
'sekharlizun21'
)
"
