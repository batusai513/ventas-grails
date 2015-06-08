package ventas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VendedorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Transactional
    def registrar(){
        if (request.method == "POST") {
            def vendedor = new Vendedor(params)
            if(vendedor.validate()){
                vendedor.save()
                flash.message = "Vendedor creado exitosamente"
                redirect(uri: '/')
            }else{
                flash.message = "Error registrando al usuario"
                [vendedor: vendedor]
            }
        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vendedor.list(params), model:[vendedorInstanceCount: Vendedor.count()]
    }

    def show(Vendedor vendedorInstance) {
        respond vendedorInstance
    }

    def edit(Vendedor vendedorInstance) {
        respond vendedorInstance
    }

    @Transactional
    def update(Vendedor vendedorInstance) {
        if (vendedorInstance == null) {
            notFound()
            return
        }

        if (vendedorInstance.hasErrors()) {
            respond vendedorInstance.errors, view:'edit'
            return
        }

        vendedorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vendedor.label', default: 'Vendedor'), vendedorInstance.id])
                redirect vendedorInstance
            }
            '*'{ respond vendedorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Vendedor vendedorInstance) {

        if (vendedorInstance == null) {
            notFound()
            return
        }

        vendedorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vendedor.label', default: 'Vendedor'), vendedorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
