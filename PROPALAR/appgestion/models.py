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

class prueba(models.Model):
    dato= models.CharField(primary_key=True, max_length=50)


class pais(models.Model):
    id_pais = models.AutoField(primary_key=True)
    nombre_pais = models.CharField(max_length=50)

class ciudad(models.Model):

    id_ciudad = models.AutoField(primary_key= True)
    nombre_ciudad = models.CharField(max_length=50)
    pais = models.ForeignKey(pais, on_delete=models.CASCADE)

class contacto(models.Model):
    id_comen =  models.AutoField(primary_key= True)
    correo = models.CharField(max_length=50)
    asunto = models.CharField(max_length=50)
    comentarios = models.CharField(max_length=200)

class usuarios(models.Model):
    id_usuario = models.AutoField(primary_key= True)
    nickname = models.CharField(max_length=50)
    contrasena = models.CharField(max_length=50)
    nombres = models.CharField(max_length=50)
    apellidos_pat = models.CharField(max_length=50)
    apellido_mat = models.CharField(max_length=50, null = True)
    correo = models.CharField(max_length=50)
    telefono = models.CharField(max_length=12, null = True)
    roll = models.IntegerField(default=1)

class datos_banco(models.Model):
    id_banco = models.AutoField(primary_key= True)
    nombre_banco = models.CharField(max_length=50)
    cuenta_bancaria = models.IntegerField()
    rut = models.CharField(max_length=50)
    tipo_cuenta = models.CharField(max_length=50)
    id_usuario = models.OneToOneField(
        usuarios,
        on_delete=models.CASCADE
    )
