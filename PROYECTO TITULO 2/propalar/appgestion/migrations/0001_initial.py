# Generated by Django 4.0.4 on 2022-05-18 04:21

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Usuarios',
            fields=[
                ('id_usuario', models.AutoField(primary_key=True, serialize=False)),
                ('nickname', models.CharField(max_length=50)),
                ('contrasena', models.CharField(max_length=50)),
                ('nombres', models.CharField(max_length=50, null=True)),
                ('apellidos_pat', models.CharField(max_length=50, null=True)),
                ('apellido_mat', models.CharField(max_length=50, null=True)),
                ('correo', models.CharField(max_length=50, null=True)),
                ('telefono', models.CharField(max_length=12, null=True)),
            ],
        ),
    ]
