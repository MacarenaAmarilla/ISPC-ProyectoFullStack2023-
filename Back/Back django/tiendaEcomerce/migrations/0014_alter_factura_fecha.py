# Generated by Django 4.1.2 on 2023-05-17 01:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tiendaEcomerce', '0013_rename_idcategoria_producto_seccion'),
    ]

    operations = [
        migrations.AlterField(
            model_name='factura',
            name='fecha',
            field=models.DateField(null=True),
        ),
    ]
