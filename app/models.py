from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

# Para extensión modelo User de Django.
from django.contrib.auth.models import User
from django.dispatch import receiver
from django.db.models.signals import post_save

# Create your models here.

class TipoProducto(models.Model):
    tipo = models.CharField(max_length=20)
    def __str__(self):
        return self.tipo

    class Meta:
        db_table = 'db_tipo_producto' 

class Producto(models.Model):
    codigo = models.IntegerField(null = False, primary_key=True)
    nombre = models.CharField(max_length=20)
    marca = models.CharField(max_length=20)
    precio = models.IntegerField()
    stock = models.IntegerField()
    detalle = models.CharField(max_length=40)
    tipo = models.ForeignKey(TipoProducto, on_delete= models.CASCADE)
    imagen = models.ImageField(upload_to="productos", null=True)
    descuento = models.IntegerField(default=0)
    total_descuento = models.IntegerField(default=0)
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now= True)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'db_producto' 

class Carrito(models.Model):
    codigo = models.IntegerField(null = False)
    nombre = models.CharField(max_length=20)
    marca = models.CharField(max_length=20)
    precio = models.IntegerField()
    stock = models.IntegerField()
    detalle = models.CharField(max_length=40)
    cantidad = models.IntegerField()
    tipo = models.CharField(max_length=20)
    imagen = models.ImageField(upload_to="items_carrito", null=True)
    total_pagar = models.IntegerField()
    usuario = models.CharField(max_length=30)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'db_items_carrito'

class Compras(models.Model):
    codigo = models.AutoField(primary_key=True)
    articulos = models.CharField(max_length=300)
    cantidad = models.IntegerField()
    fecha_compra = models.DateField()
    estado_pedido = models.CharField(max_length=50)
    cliente = models.CharField(max_length=30)
    subtotal = models.IntegerField()
    precioiva = models.IntegerField()
    total = models.IntegerField()
    def __str__(self):
            return str(self.codigo)

    class Meta:
            db_table = 'db_compras'    
        

class EstadoCompra(models.Model):
    estado = models.CharField(max_length=15)

    def __str__(self):
        return str(self.estado)
    
    class Meta:
        db_table = 'db_estadocompra'

class ExtendUser(models.Model):
    djangoUser = models.OneToOneField(User, on_delete=models.CASCADE)
    rut = models.CharField(max_length=8)
    dv = models.CharField(max_length=1)
    direccion = models.CharField(max_length=60)
    telefono = models.CharField(max_length=9)
    imagen = models.ImageField(upload_to="usuarios", null=True)
    suscripcion = models.BooleanField()

    def __str__(self):
        return str(self.djangoUser.username)

    class Meta:
        db_table = 'db_usuario'

class TipoUsuario(models.Model):
    tipo = models.CharField(max_length=20)
    def __str__(self):
        return self.tipo
    
    class Meta:
        db_table = 'db_tipo_usuario'