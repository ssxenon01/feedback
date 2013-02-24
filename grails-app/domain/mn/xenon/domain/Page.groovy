package mn.xenon.domain
import mn.xenon.auth.User

class Page implements Serializable{

	transient springSecurityService

	Date dateCreated
  	Date lastUpdated
   	
	User author
	ObjectStatus objectStatus = ObjectStatus.Open

	String title

	String content

	String description

	static hasMany = [tags: Tag]

	static mapping = {
		cache true
        content type: 'text'
        description type: 'text'
   	   	autoTimestamp true
        table 'page'
	}

	static constraints = {
		title blank: false
        tags nullable: true, lazy: true, reference: false
        content nullable: true,blank:true
		description nullable: true,blank:true
	}
	def beforeInsert(){
        if(springSecurityService)
        author = springSecurityService.currentUser as User
    }
}
