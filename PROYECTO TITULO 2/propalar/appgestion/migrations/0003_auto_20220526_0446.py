# Generated by Django 3.2.9 on 2022-05-26 08:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appgestion', '0002_contacto_proyecto_tipo_solicitud_transsaccion_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='proyecto',
            name='id_proyecto',
        ),
        migrations.AlterField(
            model_name='proyecto',
            name='titulo',
            field=models.CharField(max_length=50, primary_key=True, serialize=False),
        ),
    ]
