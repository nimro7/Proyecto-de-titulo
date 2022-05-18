from django.db import models

# Create your models here.
class Usuarios(models.Model):
    id_usuario = models.AutoField(primary_key= True)
    nickname = models.CharField(max_length=50)
    contrasena = models.CharField(max_length=50)
    nombres = models.CharField(max_length=50, null = True)
    apellidos_pat = models.CharField(max_length=50, null = True)
    apellido_mat = models.CharField(max_length=50, null = True)
    correo = models.CharField(max_length=50, null = True)
    telefono = models.CharField(max_length=12, null = True)