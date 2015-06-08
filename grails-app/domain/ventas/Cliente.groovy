package ventas

class Cliente {
    String nombre
    String apellido
    String telefono
    String direccion
    String email
    Date dateCreated
    Date lastUpdated

    static hasMany = [facturas: Factura]

    static constraints = {
      nombre(size: 1..30, blank: false)
      apellido(size: 1..30, blank: false)
      telefono(size: 1..30, blank: false)
      direccion(size: 1..30)
      email(email: true)
    }

    def String toString(){
      return "${nombre} ${apellido}"
    }
}
