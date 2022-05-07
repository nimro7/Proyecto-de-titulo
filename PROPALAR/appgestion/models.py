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

class solicitudes(models.Model):
    id_solicitudes = models.AutoField(primary_key= True)
    titulo = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=500)
    imagen = models.ImageField(verbose_name='Imagen',upload_to='solicitudes/',null=True,blank=True)
    usuario_id = models.ForeignKey(usuarios, on_delete=models.CASCADE)
    

class tipo_solicitud(models.Model):
    id_Cat_sol = models.AutoField(primary_key= True)
    nombre_cat = models.CharField(max_length=50)

class proyecto(models.Model):
    id_proyecto = models.AutoField(primary_key= True)
    titulo = models.CharField(max_length=50)
    sub_titulo = models.CharField(max_length=50, null = True)
    cuerpo = models.CharField(max_length=3000)
    monto_meta = models.FloatField(null = True)
    monto_recauda = models.FloatField(null = True)

class tipo_proyecto(models.Model):
    id_tipo_pro =  models.AutoField(primary_key= True)
    nombre_tipo  = models.CharField(max_length=50)

class benefio_pro(models.Model):
    id_benef = models.AutoField(primary_key= True)
    tipo_benef = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=200)

class equipo_pro(models.Model):
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

class material_pro(models.Model):
    id_mat = models.AutoField(primary_key= True)
    foto1 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    foto2 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    foto3 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    foto4 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)
    foto5 = models.ImageField(verbose_name='Imagen',upload_to='materiales/',null=True,blank=True)

class transsaccion(models.Model):
    id_Trans = models.AutoField(primary_key= True)
    fecha = models.DateTimeField()
    monto = models.FloatField()



    

    
