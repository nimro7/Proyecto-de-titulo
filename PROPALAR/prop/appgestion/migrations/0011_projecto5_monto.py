# Generated by Django 4.0.5 on 2022-06-20 02:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appgestion', '0010_remove_transaccion_banco_remove_transaccion_rut_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='projecto5',
            name='monto',
            field=models.IntegerField(default=0),
        ),
    ]
