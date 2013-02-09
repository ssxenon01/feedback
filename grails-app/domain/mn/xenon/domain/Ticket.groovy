package mn.xenon.domain
import mn.xenon.auth.User

class Ticket extends BaseDomain{

	String title
	String content

	int vote = 0

	Ticket diplicatedWith

	String moderatorComment

	String result

	static hasMany = [tags: Tag,voteList:User]

	static mapping = {
		cache true
        content type: 'text'
        moderatorComment type: 'text'
        result type: 'text'
        table 'ticket'
	}

	static constraints = {
		diplicatedWith nullable:true
		vote nullable:true
		title blank: false
		result  blank: true, nullable: true
		moderatorComment  blank: true, nullable: true
		content blank: false, unique: true
        tags nullable: true, lazy: true
        voteList nullable:true
	}
}
