# Generated by Django 4.0.4 on 2022-07-08 05:17

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Carrito',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.IntegerField()),
                ('nombre', models.CharField(max_length=20)),
                ('marca', models.CharField(max_length=20)),
                ('precio', models.IntegerField()),
                ('stock', models.IntegerField()),
                ('detalle', models.CharField(max_length=40)),
                ('cantidad', models.IntegerField()),
                ('tipo', models.CharField(max_length=20)),
                ('imagen', models.ImageField(null=True, upload_to='items_carrito')),
                ('total_pagar', models.IntegerField()),
                ('usuario', models.CharField(max_length=30)),
            ],
            options={
                'db_table': 'db_items_carrito',
            },
        ),
        migrations.CreateModel(
            name='Compras',
            fields=[
                ('codigo', models.AutoField(primary_key=True, serialize=False)),
                ('articulos', models.CharField(max_length=300)),
                ('cantidad', models.IntegerField()),
                ('fecha_compra', models.DateField()),
                ('estado_pedido', models.CharField(max_length=50)),
                ('cliente', models.CharField(max_length=30)),
                ('subtotal', models.IntegerField()),
                ('precioiva', models.IntegerField()),
                ('total', models.IntegerField()),
            ],
            options={
                'db_table': 'db_compras',
            },
        ),
        migrations.CreateModel(
            name='EstadoCompra',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estado', models.CharField(max_length=15)),
            ],
            options={
                'db_table': 'db_estadocompra',
            },
        ),
        migrations.CreateModel(
            name='TipoProducto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'db_tipo_producto',
            },
        ),
        migrations.CreateModel(
            name='TipoUsuario',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'db_tipo_usuario',
            },
        ),
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('codigo', models.IntegerField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=20)),
                ('marca', models.CharField(max_length=20)),
                ('precio', models.IntegerField()),
                ('stock', models.IntegerField()),
                ('detalle', models.CharField(max_length=40)),
                ('imagen', models.ImageField(null=True, upload_to='productos')),
                ('created_at', models.DateField(auto_now_add=True)),
                ('updated_at', models.DateField(auto_now=True)),
                ('tipo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.tipoproducto')),
            ],
            options={
                'db_table': 'db_producto',
            },
        ),
        migrations.CreateModel(
            name='ExtendUser',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rut', models.CharField(max_length=8)),
                ('dv', models.CharField(max_length=1)),
                ('direccion', models.CharField(max_length=60)),
                ('telefono', models.CharField(max_length=9)),
                ('imagen', models.ImageField(null=True, upload_to='usuarios')),
                ('suscripcion', models.BooleanField()),
                ('djangoUser', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'db_usuario',
            },
        ),
    ]