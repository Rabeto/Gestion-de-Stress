# Generated by Django 4.0.4 on 2022-06-10 22:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Webapp', '0051_remove_assistance_status_assistance_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='message',
            name='Status_Assistance',
        ),
        migrations.AddField(
            model_name='message',
            name='Status_msg',
            field=models.CharField(default='Non pris en Charge', max_length=150),
        ),
    ]
