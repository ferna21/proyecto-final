from rest_framework import serializers
from app.models import *

#Se encarga de realizar el CRUD desde el API hacia la BD

class ProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'

class TipoProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoProducto
        fields = '__all__'

class ExtendUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = ExtendUser
        fields = '__all__'

class TipoUsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoUsuario
        fields = '__all__'
