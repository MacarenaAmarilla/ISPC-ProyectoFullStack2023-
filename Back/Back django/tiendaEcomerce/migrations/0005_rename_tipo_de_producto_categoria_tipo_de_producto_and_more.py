# Generated by Django 4.1.2 on 2023-05-16 02:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tiendaEcomerce', '0004_rename_apellido_usuario_apellido_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='categoria',
            old_name='Tipo_de_producto',
            new_name='tipo_de_producto',
        ),
        migrations.RenameField(
            model_name='producto',
            old_name='IdCategoria',
            new_name='idCategoria',
        ),
        migrations.AlterField(
            model_name='categoria',
            name='idCategoria',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='factura',
            name='idFactura',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='metododepago',
            name='idMetodo_Pago',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='producto',
            name='idProducto',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='tipodeproducto',
            name='idTipo_de_producto',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
    ]
