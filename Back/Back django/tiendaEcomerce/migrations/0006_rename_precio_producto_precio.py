# Generated by Django 4.1.2 on 2023-05-16 02:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tiendaEcomerce', '0005_rename_tipo_de_producto_categoria_tipo_de_producto_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='producto',
            old_name='precio',
            new_name='Precio',
        ),
    ]
