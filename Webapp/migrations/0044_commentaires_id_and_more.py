# Generated by Django 4.0.4 on 2022-06-04 20:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0043_remove_commentaires_id_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='commentaires',
            name='id',
            field=models.BigAutoField(auto_created=True, default=0, primary_key=True, serialize=False, verbose_name='ID'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='commentaires',
            name='Auteur_Comment_pub',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Webapp.utilisateur'),
        ),
    ]
