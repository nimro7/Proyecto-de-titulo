# Generated by Django 4.0.5 on 2022-06-20 00:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appgestion', '0007_alter_datos_banco_banco_alter_datos_banco_codigo_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='datos_usuario',
            name='fecha_nacimiento',
            field=models.DateField(blank=True, null=True),
        ),
    ]