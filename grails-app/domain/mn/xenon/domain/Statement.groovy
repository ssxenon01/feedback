package mn.xenon.domain
import mn.xenon.auth.User

class Statement{

	transient springSecurityService

	Date dateCreated
  	Date lastUpdated
   	
	User author

	String title
	Ticket ticket
	String content

	static mapping = {
   	   	autoTimestamp true
		cache true
        content type: 'text'
        table 'statement'
	}

	static constraints = {
		author(nullable: true, lazy: true)
        dateCreated(nullable: true)
        lastUpdated(nullable: true)
		title nullable: true
		ticket nullable: true
        content nullable: false,blank:false
	}
}
