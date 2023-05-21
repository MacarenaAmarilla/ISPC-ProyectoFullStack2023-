from django.db import models

# Create your models here.


class Cliente(models.Model):
    idCliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, null=True)
    apellido = models.CharField(max_length=45, null=True)
    mail = models.CharField(max_length=45, null=True)
    nro_Celular = models.CharField(max_length=45, null=True)

    def __str__(self):
        return 'El nombre del cliente es %s %s' %(self.nombre, self.apellido)


class Usuario(models.Model):
    idUsuario = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, null=True)
    apellido = models.CharField(max_length=45, null=True)
    mail = models.CharField(max_length=45, null=True)
    nro_Celular = models.CharField(max_length=45, null=True)

class TipoDeProducto(models.Model):
    idTipo_de_producto = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=120, null=True)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)

class Categoria(models.Model):
    idCategoria = models.IntegerField(primary_key=True)
    nombredeCategoria = models.CharField(max_length=120, null=True)
    tipo_de_producto = models.ForeignKey(TipoDeProducto, on_delete=models.CASCADE)

class MetodoDePago(models.Model):
    idMetodo_Pago = models.IntegerField(primary_key=True)
    tipo_pago = models.CharField(max_length=45, null=True)
    nrodecuenta = models.IntegerField(null=True)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)

class Factura(models.Model):
    idFactura = models.AutoField(primary_key=True)
    fecha = models.DateField(null=True)
    #tipodeFactura = models.CharField(max_length=45, null=True)
    descripcion_prod = models.CharField(max_length=60, null=True)
    subtotal = models.CharField(max_length=45, null=True)
    total = models.CharField(max_length=45, null=True)
    #metodo_de_Pago = models.ForeignKey(MetodoDePago, on_delete=models.CASCADE)

class Producto(models.Model):
    idProducto = models.AutoField(primary_key=True)
    seccion = models.CharField(max_length=45, null=True)
    nombre = models.CharField(max_length=60, null=True)
    cantidad = models.IntegerField(null=True)
    precio = models.CharField(max_length=45, null=True)
    #categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    #factura = models.ForeignKey(Factura, on_delete=models.CASCADE)

    def __str__(self):
        return 'El nombre es %s la cantidad es %s y el precio es %s' %(self.nombre, self.cantidad, self.precio)


class FacturaHasUsuario(models.Model):
    factura = models.ForeignKey(Factura, on_delete=models.CASCADE)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)

class Direccion(models.Model):
    idDireccion = models.IntegerField(null=True)
    usuario = models.OneToOneField(Usuario, primary_key=True, on_delete=models.CASCADE)
    pais = models.CharField(max_length=45, null=True)
    provincia = models.CharField(max_length=45, null=True)
    ciudad = models.CharField(max_length=45, null=True)
    codigo_Postal = models.CharField(max_length=45, null=True)
    calle = models.CharField(max_length=45, null=True)
    nro = models.CharField(max_length=45, null=True)