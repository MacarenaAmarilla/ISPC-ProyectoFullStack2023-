# Generated by Django 4.1.2 on 2023-05-16 04:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tiendaEcomerce', '0009_alter_usuario_idusuario'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('idCliente', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=45, null=True)),
                ('apellido', models.CharField(max_length=45, null=True)),
                ('mail', models.CharField(max_length=45, null=True)),
                ('nro_Celular', models.CharField(max_length=45, null=True)),
            ],
        ),
    ]
