# Generated by Django 4.0.4 on 2022-04-23 23:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('appgestion', '0002_prueba'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='prueba',
            name='id',
        ),
        migrations.AlterField(
            model_name='prueba',
            name='dato',
            field=models.CharField(max_length=50, primary_key=True, serialize=False),
        ),
    ]