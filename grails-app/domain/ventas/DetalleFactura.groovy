package ventas

class DetalleFactura {
    Integer cantidad
    Double precio
    Double total

    static belongsTo = [producto: Producto, factura: Factura]

    static constraints = {
      cantidad(min: 0)
      precio(min: 0d)
    }
}
