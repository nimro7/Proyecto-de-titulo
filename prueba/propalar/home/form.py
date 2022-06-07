from django import forms
from froala_editor.widgets import FroalaEditor
from .models import *

class ProyectoForm(forms.ModelForm):
    class Meta:
        model = Proyecto
        fields = ['contenido']


class Proyecto2Form(forms.ModelForm):
    class Meta:
        model = Proyecto2
        fields = ['contenido']