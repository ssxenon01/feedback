package mn.xenon.auth

class Role {
	
	public static final Role ROLE_ADMIN = new Role(authority: "ROLE_ADMIN")
	public static final Role ROLE_USER = new Role(authority: "ROLE_USER")

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
