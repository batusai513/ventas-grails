package ventas

class Vendedor implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

  String nombre
  String apellido
  String email
  String telefono
	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
  Date dateCreated
  Date lastUpdated

  static hasMany = [facturas: Factura]

	Vendedor(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof Vendedor && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		VendedorRole.findAllByVendedor(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
    nombre(size: 1..30, blank: false)
    apellido(size: 1..30, blank: false)
    email(email: true)
    telefono(size: 1..30, blank: false)
	}

	static mapping = {
		password column: '`password`'
	}
}
