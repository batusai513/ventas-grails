package ventas

class Producto {
    String nombre
    Double precio
    Integer stock
    Date dateCreated
    Date lastUpdated

    static hasMany = [detalleFacturas: DetalleFactura]

    static constraints = {
      nombre(size: 1..30, blank: false)
      precio(min: 0d)
      stock(min: 0)
    }

    def modificarStock(int cantidad){
      stock = stock + (cantidad);
    }
}
