# Generated by Django 4.0.4 on 2022-04-22 22:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='usuario',
            fields=[
                ('id_usuario', models.AutoField(primary_key=True, serialize=False)),
                ('nickname', models.CharField(max_length=50)),
                ('contraseña', models.CharField(max_length=50)),
                ('nombre', models.CharField(max_length=50)),
                ('apellido_pat', models.CharField(max_length=50)),
                ('apellido_mat', models.CharField(max_length=50)),
                ('correo', models.CharField(max_length=50)),
                ('id_pais', models.IntegerField()),
                ('telefono', models.CharField(max_length=50)),
                ('id_solicitud', models.IntegerField()),
            ],
        ),
    ]
