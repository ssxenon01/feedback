package mn.xenon.domain
import mn.xenon.auth.User

class Ticket implements Serializable{

	transient springSecurityService

	Date dateCreated
  	Date lastUpdated
   	
	User author
	ObjectStatus objectStatus = ObjectStatus.Open
	
	Type type = Type.Interests
	Group group = Group.Citizen

    def beforeInsert(){
        if(springSecurityService)
        author = springSecurityService.currentUser as User
    }

	static transients = ['voted','fetchStatement','voteStatus']

	String title
	String content
	String img
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

	String getVoteStatus(){
		def str = 'open'
		if(maxVote <= vote){
			str = 'win'
		}else if(maxVote/2 <= vote){
			str = 'hot'
		}
		return str
	}

	List<Statement> fetchStatements(){
		return Statement.createCriteria().list([sord:'dateCreated',order:'DESC',max:10]){
			ticket{
				eq('id',this.id)
			}
		}
	}

	static hasMany = [tags: Tag,voteList:User]

	static mapping = {
   	   	autoTimestamp true
		cache true
        content type: 'text'
        moderatorComment type: 'text'
        result type: 'text'
        table 'ticket'
        group column:'ticket_group'
	}

	static constraints = {
        author(nullable: true, lazy: true)
        dateCreated(nullable: true)
        lastUpdated(nullable: true)
		img nullable:true
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
