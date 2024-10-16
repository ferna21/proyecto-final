from django.shortcuts import render
from rest_framework import viewsets
from app.models import *
from .serializers import *

# Create your views here.

# Se encarga de mostrar el query en el API
class ProductoViewSet(viewsets.ModelViewSet):
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

class TipoProductoViewSet(viewsets.ModelViewSet):
    queryset = TipoProducto.objects.all()
    serializer_class = TipoProductoSerializer

class ExtendUserViewSet(viewsets.ModelViewSet):
    queryset = ExtendUser.objects.all()
    serializer_class = ExtendUserSerializer

class TipoUsuarioViewSet(viewsets.ModelViewSet):
    queryset = TipoUsuario.objects.all()
    serializer_class = TipoUsuarioSerializer