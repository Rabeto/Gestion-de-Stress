# Generated by Django 3.1.14 on 2022-04-09 11:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0003_auto_20220409_0133'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news_post',
            name='Fichier',
            field=models.FileField(upload_to=''),
        ),
    ]
