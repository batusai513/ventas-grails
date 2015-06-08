package ventas

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class VendedorRole implements Serializable {

	private static final long serialVersionUID = 1

	Vendedor vendedor
	Role role

	VendedorRole(Vendedor u, Role r) {
		this()
		vendedor = u
		role = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof VendedorRole)) {
			return false
		}

		other.vendedor?.id == vendedor?.id && other.role?.id == role?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (vendedor) builder.append(vendedor.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static VendedorRole get(long vendedorId, long roleId) {
		criteriaFor(vendedorId, roleId).get()
	}

	static boolean exists(long vendedorId, long roleId) {
		criteriaFor(vendedorId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long vendedorId, long roleId) {
		VendedorRole.where {
			vendedor == Vendedor.load(vendedorId) &&
			role == Role.load(roleId)
		}
	}

	static VendedorRole create(Vendedor vendedor, Role role, boolean flush = false) {
		def instance = new VendedorRole(vendedor, role)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Vendedor u, Role r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = VendedorRole.where { vendedor == u && role == r }.deleteAll()

		if (flush) { VendedorRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(Vendedor u, boolean flush = false) {
		if (u == null) return

		VendedorRole.where { vendedor == u }.deleteAll()

		if (flush) { VendedorRole.withSession { it.flush() } }
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		VendedorRole.where { role == r }.deleteAll()

		if (flush) { VendedorRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, VendedorRole ur ->
			if (ur.vendedor == null || ur.vendedor.id == null) return
			boolean existing = false
			VendedorRole.withNewSession {
				existing = VendedorRole.exists(ur.vendedor.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['vendedor', 'role']
		version false
	}
}
