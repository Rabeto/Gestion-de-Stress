# Generated by Django 4.0.4 on 2022-06-27 20:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0058_remove_news_post_likes_delete_reagir'),
    ]

    operations = [
        migrations.CreateModel(
            name='Like_Post',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Webapp.news_post')),
                ('Reacteur', models.ManyToManyField(to='Webapp.utilisateur')),
            ],
        ),
    ]
