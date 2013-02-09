package mn.xenon.auth

class Role {
	
	public static final Role ROLE_ADMIN = new Role(authority: "ROLE_ADMIN")
    public static final Role ROLE_USER = new Role(authority: "ROLE_USER")
    public static final Role ROLE_FACEBOOK = new Role(authority: "ROLE_FACEBOOK")
    public static final Role ROLE_TWITTER = new Role(authority: "ROLE_TWITTER")

    String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
