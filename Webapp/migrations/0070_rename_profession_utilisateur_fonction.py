# Generated by Django 4.0.4 on 2022-07-13 10:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0069_alter_news_post_type_alter_utilisateur_status'),
    ]

    operations = [
        migrations.RenameField(
            model_name='utilisateur',
            old_name='Profession',
            new_name='Fonction',
        ),
    ]
