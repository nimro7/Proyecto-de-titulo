from django.db import models
from django.contrib.auth.models import User

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

class Datos_banco(models.Model):
    id_banco = models.AutoField(primary_key= True)
    nombre_banco = models.CharField(max_length=50)
    cuenta_bancaria = models.IntegerField()
    rut = models.CharField(max_length=50)
    tipo_cuenta = models.CharField(max_length=50)
    id_usuario = models.OneToOneField(
        User,
        on_delete=models.CASCADE
    )

class Pais(models.Model):
    id_pais = models.AutoField(primary_key=True)
    nombre_pais = models.CharField(max_length=50)
    users = models.ForeignKey(User, on_delete=models.CASCADE)

class Ciudad(models.Model):

    id_ciudad = models.AutoField(primary_key= True)
    nombre_ciudad = models.CharField(max_length=50)
    pais = models.ForeignKey(Pais, on_delete=models.CASCADE)

class Contacto(models.Model):
    id_comen =  models.AutoField(primary_key= True)
    correo = models.CharField(max_length=50)
    asunto = models.CharField(max_length=50)
    comentarios = models.CharField(max_length=200)

class Solicitudes(models.Model):
    id_solicitudes = models.AutoField(primary_key= True)
    titulo = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=500)
    imagen = models.ImageField(verbose_name='Imagen',upload_to='solicitudes/',null=True,blank=True)
    usuario_id = models.ForeignKey(User, on_delete=models.CASCADE)
    
class Tipo_solicitud(models.Model):
    id_Cat_sol = models.AutoField(primary_key= True)
    nombre_cat = models.CharField(max_length=50)

class Proyecto(models.Model):
    id_proyecto = models.AutoField(primary_key= True)
    titulo = models.CharField(max_length=50)
    sub_titulo = models.CharField(max_length=50, null = True)
    cuerpo = models.CharField(max_length=3000)
    monto_meta = models.FloatField(null = True)
    monto_recauda = models.FloatField(null = True)

class Tipo_proyecto(models.Model):
    id_tipo_pro =  models.AutoField(primary_key= True)
    nombre_tipo  = models.CharField(max_length=50)
    id_proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)

class Benefio_pro(models.Model):
    id_benef = models.AutoField(primary_key= True)
    tipo_benef = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=200)
    id_proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)

class Equipo_pro(models.Model):
    id_equipo = models.AutoField(primary_key= True)
    nombre1 = models.CharField(max_length=50)
    cargo1 = models.CharField(max_length=50)
    foto1 = models.ImageField(verbose_name='Imagen',upload_to='fotos/',null=True,blank=True)
    nombre2 = models.CharField(max_length=50)
    cargo2 = models.CharField(max_length=50)
    foto2 = models.ImageField(verbose_name='Imagen',upload_to='fotos/',null=True,blank=True)
    nombre3 = models.CharField(max_length=50)
    cargo3 = models.CharField(max_length=50)
    foto3 = models.ImageField(verbose_name='Imagen',upload_to='fotos/',null=True,blank=True)
    nombre4 = models.CharField(max_length=50)
    cargo4 = models.CharField(max_length=50)
    foto4 = models.ImageField(verbose_name='Imagen',upload_to='fotos/',null=True,blank=True)
    nombre5 = models.CharField(max_length=50)
    cargo5 = models.CharField(max_length=50)
    foto5 = models.ImageField(verbose_name='Imagen',upload_to='fotos/',null=True,blank=True)
    id_proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)

class Material_pro(models.Model):
    id_mat = models.AutoField(primary_key= True)
    foto1 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    foto2 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    foto3 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    foto4 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    foto5 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    id_proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)

class Transsaccion(models.Model):
    id_Trans = models.AutoField(primary_key= True)
    fecha = models.DateTimeField()
    monto = models.FloatField()
    id_proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)




    

    

