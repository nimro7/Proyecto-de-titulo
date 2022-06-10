from django import forms
from froala_editor.widgets import FroalaEditor
from .models import *


class Projecto5Form(forms.ModelForm):
    class Meta:
        model = Projecto5
        fields = ['contenido']
        model1 = Categoria
        fields1 = ['contenido']
        model2 = Beneficio
        fields2 = ['contenido']
        model3 = EquipoTrabajo
        fields3 = ['contenido']
        model4 = materiales
        fields4 = ['contenido']

        
