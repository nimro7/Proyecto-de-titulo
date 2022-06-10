from django.db import models

# Create your models here.
class Contacto(models.Model):
    id_comen =  models.AutoField(primary_key= True)
    correo = models.CharField(max_length=50)
    asunto = models.CharField(max_length=50)
    comentarios = models.CharField(max_length=200)

from django.db import models
from django.contrib.auth.models import User
from froala_editor.fields import FroalaField
from .helpers import *

# Create your models here.

class Tipos(models.Model):
    categoria = models.CharField(max_length=50, primary_key=True)

class Projecto5(models.Model):
    user = models.ForeignKey(User, blank=True , null=True , on_delete=models.CASCADE)
    categoria =models.ForeignKey(Tipos, blank=True , null=True , on_delete=models.CASCADE)
    titulo = models.CharField(max_length=50)
    contenido = FroalaField()
    slug = models.SlugField(max_length=1000, null=True, blank=True)
    imagen = models.ImageField(upload_to='media')
    created_at = models.DateTimeField(auto_now_add=True)
    upload_to= models.DateTimeField(auto_now=True)
    monto_meta = models.IntegerField()
    monto_total = models.IntegerField(default=0)
    def __str__(self):
        return self.titulo
    
    def save(self, *args, **kwargs):
        self.slug = generate_slug(self.titulo)
        super(Projecto5, self).save(*args, **kwargs)

class Beneficio(models.Model):
    project = models.ForeignKey(Projecto5, blank=True , null=True , on_delete=models.CASCADE)
    categoria_beneficio = models.CharField(max_length=50)
    nombre_beneficio = models.CharField(max_length=50)
    descripcion_beneficio = models.CharField(max_length=5000)

class EquipoTrabajo(models.Model):
    project = models.ForeignKey(Projecto5, blank=True , null=True , on_delete=models.CASCADE)
    empresa = models.CharField(max_length=50, null=True)
    descripcion_empresa = models.CharField(max_length=500,blank=True)
    nombre_jefeProjecto = models.CharField(max_length=50,blank=True)
    nombre_subjefe = models.CharField(max_length=50,blank=True)
    nombre_subSubjefe = models.CharField(max_length=50,blank=True)

class materiales(models.Model):
    project = models.ForeignKey(Projecto5, blank=True , null=True , on_delete=models.CASCADE)
    facebook = models.CharField(max_length=50,blank=True)
    instagram = models.CharField(max_length=50,blank=True)
    paginaWeb = models.CharField(max_length=50,blank=True)
    twitter = models.CharField(max_length=50,blank=True)