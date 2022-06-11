# Generated by Django 4.0.4 on 2022-06-11 02:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0053_alter_message_status_msg'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='assistance',
            name='Cas',
        ),
        migrations.AddField(
            model_name='message',
            name='Psy',
            field=models.OneToOneField(default=0, on_delete=django.db.models.deletion.CASCADE, to='Webapp.assistance'),
            preserve_default=False,
        ),
    ]
