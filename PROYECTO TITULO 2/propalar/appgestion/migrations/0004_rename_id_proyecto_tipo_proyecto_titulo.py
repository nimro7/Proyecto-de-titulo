# Generated by Django 3.2.9 on 2022-05-26 08:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('appgestion', '0003_auto_20220526_0446'),
    ]

    operations = [
        migrations.RenameField(
            model_name='tipo_proyecto',
            old_name='id_proyecto',
            new_name='titulo',
        ),
    ]
