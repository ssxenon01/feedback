package mn.xenon.domain

class Ticket extends BaseDomain{

	String content

	static mapping = {
		cache true
	}

	static constraints = {
		content blank: false, unique: true
	}
}
