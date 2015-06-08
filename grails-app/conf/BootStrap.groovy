class BootStrap {

    def init = { servletContext ->
      def papas = new ventas.Producto(nombre: "Papas margarita", precio: 1200, stock: 20).save()
      def yogurt = new ventas.Producto(nombre: "Yogurt natural", precio: 1000, stock: 10).save()

      def richard = new ventas.Cliente(nombre: "Richard", apellido: "Roncancio", telefono: "3027170", direccion: "Calle 51B # 34 - 06", email: "richard.batusai@gmail.com").save()
      def juana = new ventas.Cliente(nombre: "Juana", apellido: "Banana", telefono: "3522236", direccion: "Calle 45 # 36 - 06", email: "juana@banana.com").save()
      def now = new Date()
      def chuck = new ventas.Vendedor(
        nombre: "Chuck",
        apellido: "Norris",
        email: "chuck@norris.com",
        telefono: "6663232",
        username: "chuck_norris",
        password: "highkick",
        dateCreated: now).save(failOnError: true)

        def f = new ventas.Factura(
          cliente: richard,
          vendedor: chuck
        ).save(failOnError: true)

        def f2 = new ventas.Factura(
          cliente: juana,
          vendedor: chuck
        ).save(failOnError: true)

        f.addToDetalleFacturas(
          cantidad: 2,
          precio: yogurt.precio,
          producto: yogurt,
          total: yogurt.precio * 2
        ).save(failOnError: true)

        f.addToDetalleFacturas(
          cantidad: 5,
          precio: papas.precio,
          producto: papas,
          total: papas.precio * 5
        ).save(failOnError: true)

        yogurt.stock = yogurt.stock - 2
        yogurt.save(failOnError: true)

        papas.stock = papas.stock - 5
        papas.save(failOnError: true)

        f2.addToDetalleFacturas(
          cantidad: 3,
          precio: papas.precio,
          producto: papas,
          total: papas.precio * 3
        ).save(failOnError: true)

        papas.stock = papas.stock - 3
        papas.save(failOnError: true)
      }
    def destroy = {
    }
}
