package mn.xenon.domain

import mn.xenon.auth.User

abstract class BaseDomain implements Serializable {

	transient springSecurityService

	Date dateCreated
  Date lastUpdated
   	
	User author
	ObjectStatus objectStatus = ObjectStatus.Open

	static constraints = {
        author(nullable: true, lazy: true)
        dateCreated(nullable: true)
        lastUpdated(nullable: true)
	}

	static mapping = {
   	   autoTimestamp true
   	}

    def beforeInsert(){
        if(springSecurityService)
        author = springSecurityService.currentUser as User
    }
}
