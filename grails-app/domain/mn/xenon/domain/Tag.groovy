package mn.xenon.domain

import mn.xenon.auth.User

class Tag implements Serializable{

	String label
	int priority = 0


	Date dateCreated
	Date lastUpdated
   	
	User author
	
	static mapping = {
		cache true
   	   	autoTimestamp true
        table 'tag'
	}

	static constraints = {
		label blank: false, unique: true
		author(nullable: true, lazy: true)
        dateCreated(nullable: true)
        lastUpdated(nullable: true)
	}
}
