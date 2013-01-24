package mn.xenon.domain

import mn.xenon.auth.User

abstract class BaseDomain implements Serializable {

	transient springSecurityService

	Date created = new Date()
    Date lastUpdated = new Date()
	User author
	int objectStatus = ObjectStatus.Created.value

	static constraints = {
        author(nullable: true, lazy: true)
	}

	static mapping = {
	}
	
	def beforeUpdate() {
        lastUpdated = new Date()
    }
    def beforeInsert(){
        author = springSecurityService.currentUser as User
    }
}
