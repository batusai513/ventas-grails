package ventas
import org.apache.commons.collections.FactoryUtils
import org.apache.commons.collections.list.LazyList

class Factura {
    Date dateCreated
    Date lastUpdated
    List detalleFacturas

    static belongsTo = [vendedor: Vendedor, cliente: Cliente]
    static hasMany = [detalleFacturas: DetalleFactura]

    static mapping = {
      detalleFacturas:"all-delete-orphan"
    }

    static constraints = {
    }


    Double total(){
      return detalleFacturas.total.flatten().sum()
    }
}
