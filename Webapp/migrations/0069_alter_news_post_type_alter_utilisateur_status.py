# Generated by Django 4.0.4 on 2022-07-12 18:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0068_private_message_room'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news_post',
            name='Type',
            field=models.CharField(choices=[('Posts', 'Posts'), ('News', 'News')], default='Posts', max_length=5),
        ),
        migrations.AlterField(
            model_name='utilisateur',
            name='Status',
            field=models.CharField(choices=[('Utilisateur Simple', 'Utilisateur Simple'), ('Psychologue', 'Psychologue')], default='Utilisateur Simple', max_length=20),
        ),
    ]
