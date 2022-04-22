from django.db import models

# Create your models here.
class usuario(models.Model):
    id_usuario= models.AutoField(primary_key=True)
    nickname = models.CharField(max_length=50)
    contraseña = models.CharField(max_length=50)
    nombre = models.CharField(max_length=50)
    apellido_pat = models.CharField(max_length=50)
    apellido_mat = models.CharField(max_length=50)
    correo = models.CharField(max_length=50)
    id_pais = models.IntegerField()
    telefono = models.CharField(max_length=50)
    id_solicitud = models.IntegerField()


