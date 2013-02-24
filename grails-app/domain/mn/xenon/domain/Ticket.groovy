package mn.xenon.domain
import mn.xenon.auth.User

class Ticket extends BaseDomain{

	transient springSecurityService
	static transients = ['voted','fetchStatement']
	String title
	String content

	int vote = 0
	
	int maxVote = 1000
	boolean getVoted(){
		if(springSecurityService.currentUser)
			return voteList.contains(springSecurityService.currentUser)
		else
			return false
	}
	Ticket diplicatedWith

	String moderatorComment

	String result

	List<Statement> fetchStatements(){
		return Statement.createCriteria().list([sord:'dateCreated',order:'DESC',max:10]){
			ticket{
				eq('id',this.id)
			}
		}
	}

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
		maxVote nullable:true
		title blank: false
		result  blank: true, nullable: true
		moderatorComment  blank: true, nullable: true
		content blank: false
        tags nullable: true, lazy: true
        voteList nullable:true
	}
}
