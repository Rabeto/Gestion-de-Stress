# Generated by Django 4.0.4 on 2022-08-17 20:49

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0071_alter_news_post_contenu'),
    ]

    operations = [
        migrations.AlterField(
            model_name='utilisateur',
            name='Password',
            field=models.CharField(max_length=50, validators=[django.core.validators.MinLengthValidator(8)]),
        ),
    ]
