package ventas

class Factura {
    Date dateCreated
    Date lastUpdated

    static belongsTo = [vendedor: Vendedor, cliente: Cliente]
    static hasMany = [detalleFacturas: DetalleFactura]

    static constraints = {
    }

    Double total(){
      return detalleFacturas.total.flatten().sum()
    }
}
