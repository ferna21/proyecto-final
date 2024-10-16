from dataclasses import fields
from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

# CREAMOS TEMPLATES DE LOS FORMULARIOS
class ProductoForm(ModelForm):

    nombre = forms.CharField(min_length=4,max_length=20)
    precio = forms.IntegerField(min_value=400)
    descuento = forms.IntegerField(min_value=0, max_value=100)

    class Meta:
        
        model = Producto
        fields = ['codigo', 'nombre', 'marca', 'precio', 'stock', 'detalle', 'tipo', 'imagen', 'descuento']


class CustomUserCreationForm(UserCreationForm):
    
    class Meta:
        model = User
        fields = ['username', "first_name", "last_name", "email", "password1", "password2"]

class UsuarioForm(ModelForm):

    djangoUser = forms.CharField(min_length=10,max_length=20)
    rut = forms.CharField(max_length=8)
    dv = forms.CharField(max_length=1)
    direccion = forms.CharField(max_length=60)
    telefono = forms.CharField(max_length=9)

    class Meta:
        
        model = ExtendUser
        fields = ['djangoUser', 'rut', 'dv', 'direccion', 'telefono', 'imagen', 'suscripcion']

class CambiarFoto(ModelForm):

    class Meta:
        
        model = ExtendUser
        fields = ['imagen']