package mn.xenon.domain
import mn.xenon.auth.User

class Statement extends BaseDomain{

	String title
	Ticket ticket
	String content

	static mapping = {
		cache true
        content type: 'text'
        table 'statement'
	}

	static constraints = {
		title nullable: true
		ticket nullable: true
        content nullable: false,blank:false
	}
}
