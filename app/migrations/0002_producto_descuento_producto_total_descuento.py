# Generated by Django 4.0.4 on 2022-07-09 05:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='producto',
            name='descuento',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='producto',
            name='total_descuento',
            field=models.IntegerField(default=0),
        ),
    ]