# Generated by Django 4.0.4 on 2022-05-24 12:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0029_rename_comments_commentaires_and_more'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Commentaires',
        ),
    ]
