# Generated by Django 4.0.4 on 2022-07-15 20:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0070_rename_profession_utilisateur_fonction'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news_post',
            name='Contenu',
            field=models.TextField(max_length=100000),
        ),
    ]
