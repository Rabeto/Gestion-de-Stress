# Generated by Django 3.1.14 on 2022-05-20 10:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0023_comments'),
    ]

    operations = [
        migrations.RenameField(
            model_name='comments',
            old_name='Commentaire',
            new_name='Com_pub',
        ),
        migrations.AddField(
            model_name='comments',
            name='Titre_pub',
            field=models.CharField(default=None, max_length=255),
            preserve_default=False,
        ),
    ]
