package mn.xenon.domain
import mn.xenon.auth.User

class Ticket extends BaseDomain{

	String title
	String content

	int vote

	static hasMany = [tags: Tag,voteList:User]

	static mapping = {
		cache true
        content type: 'text'
	}

	static constraints = {
		vote nullable:true
		title blank: false
		content blank: false, unique: true
		tags nullable:true
		voteList nullable:true		
	}
}
