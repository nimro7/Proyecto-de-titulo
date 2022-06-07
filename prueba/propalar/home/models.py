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