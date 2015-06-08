package ventas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FacturaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Factura.list(params), model:[facturaInstanceCount: Factura.count()]
    }

    def show(Factura facturaInstance) {
        respond facturaInstance
    }

    def create() {
        def f = new Factura(params)
        def d = new DetalleFactura()
        f.addToDetalleFacturas(d)
        respond f
    }

    @Transactional
    def save() {
        println(params.list('expandableDetalleList'))
        Factura facturaInstance = new Factura()
        facturaInstance.properties = params
        if (facturaInstance == null) {
            notFound()
            return
        }

        if (facturaInstance.hasErrors()) {
            respond facturaInstance.errors, view:'create'
            return
        }

        facturaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'factura.label', default: 'Factura'), facturaInstance.id])
                redirect facturaInstance
            }
            '*' { respond facturaInstance, [status: CREATED] }
        }
    }

    def edit(Factura facturaInstance) {
        respond facturaInstance
    }

    @Transactional
    def update(Factura facturaInstance) {
        if (facturaInstance == null) {
            notFound()
            return
        }

        if (facturaInstance.hasErrors()) {
            respond facturaInstance.errors, view:'edit'
            return
        }

        facturaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Factura.label', default: 'Factura'), facturaInstance.id])
                redirect facturaInstance
            }
            '*'{ respond facturaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Factura facturaInstance) {

        if (facturaInstance == null) {
            notFound()
            return
        }

        facturaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Factura.label', default: 'Factura'), facturaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
