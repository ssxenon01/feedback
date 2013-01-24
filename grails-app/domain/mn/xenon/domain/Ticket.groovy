package mn.xenon.domain

class Ticket extends BaseDomain{

	String content

	static mapping = {
		cache true
        content type: 'text'
	}

	static constraints = {
		content blank: false, unique: true
	}
}
