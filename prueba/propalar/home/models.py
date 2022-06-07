from operator import truediv
from pickle import TRUE
from pyexpat import model
from django.db import models
from django.contrib.auth.models import User
from django.forms import ImageField
from froala_editor.fields import FroalaField
from .helpers import generate_slug

class Proyecto(models.Model):
    user = models.ForeignKey(User, blank=True , null=True , on_delete=models.CASCADE)
    titulo = models.CharField(max_length=50)
    contenido = FroalaField()
    slug = models.SlugField(max_length=1000, null=True, blank=True)
    imagen = models.ImageField(upload_to='propalar')
    created_at = models.DateTimeField(auto_now_add=True)
    upload_to= models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.titulo

    def save(self, *args, **kwargs):
        self.slug = generate_slug(self.titulo)
        super(Proyecto, self).save(*args, **kwargs)

class Proyecto2(models.Model):
    titulo = models.CharField(max_length=50)
    contenido = FroalaField()
    slug = models.SlugField(max_length=1000, null=True, blank=True)
    imagen = models.ImageField(upload_to='propalar')
    created_at = models.DateTimeField(auto_now_add=True)
    upload_to= models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.titulo

    def save(self, *args, **kwargs):
        self.slug = generate_slug(self.titulo)
        super(Proyecto2, self).save(*args, **kwargs)

class Prueba1(models.Model):
    proyecto = models.ForeignKey(Proyecto, on_delete=models.CASCADE)
    tipo = models.CharField(max_length=50)

    def __str__(self):
        return self.tipo

    def save(self, *args, **kwargs):
        self.slug = generate_slug(self.tipo)
        super(Prueba1, self).save(*args, **kwargs)

class Tipos(models.Model):
    categoria = models.CharField(max_length=50, primary_key=True)

class Projecto5(models.Model):
    user = models.ForeignKey(User, blank=True , null=True , on_delete=models.CASCADE)
    categoria =models.ForeignKey(Tipos, blank=True , null=True , on_delete=models.CASCADE)
    titulo = models.CharField(max_length=50)
    contenido = FroalaField()
    slug = models.SlugField(max_length=1000, null=True, blank=True)
    imagen = models.ImageField(upload_to='propalar')
    created_at = models.DateTimeField(auto_now_add=True)
    upload_to= models.DateTimeField(auto_now=True)

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
    facebook = models.CharField(max_length=50)
    instagram = models.CharField(max_length=50)
    paginaWeb = models.CharField(max_length=50)
    twitter = models.CharField(max_length=50)






    
