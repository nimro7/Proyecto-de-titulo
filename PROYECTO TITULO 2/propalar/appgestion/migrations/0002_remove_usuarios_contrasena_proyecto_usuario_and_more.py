# Generated by Django 4.0.4 on 2022-06-07 09:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('appgestion', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuarios',
            name='contrasena',
        ),
        migrations.AddField(
            model_name='proyecto',
            name='usuario',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='appgestion.usuarios'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='usuarios',
            name='last_login',
            field=models.DateTimeField(blank=True, null=True, verbose_name='last login'),
        ),
        migrations.AddField(
            model_name='usuarios',
            name='password',
            field=models.CharField(default=123, max_length=128, verbose_name='password'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='usuarios',
            name='nickname',
            field=models.CharField(max_length=50, unique=True),
        ),
    ]