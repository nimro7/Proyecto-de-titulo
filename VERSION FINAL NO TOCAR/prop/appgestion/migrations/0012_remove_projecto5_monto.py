# Generated by Django 4.0.5 on 2022-06-20 02:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('appgestion', '0011_projecto5_monto'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='projecto5',
            name='monto',
        ),
    ]
