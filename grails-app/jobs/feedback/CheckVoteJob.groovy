package feedback

import mn.xenon.domain.Ticket
import mn.xenon.domain.ObjectStatus

class CheckVoteJob {
    static triggers = {
        
      cron name: 'VoteCountJob', cronExpression: "0 0,30 * * * ?", startDelay: 5000 // execute job once in 30 minutes

    }

    def execute() {
        // println "vote job works"
    	def votedTickets = Ticket.createCriteria().list(){
    		'gtProperty'('vote','maxVote')
    		'eq'('objectStatus',ObjectStatus.Open.value)
    	}
    	votedTickets.each{ ticket ->
    		ticket.setObjectStatus(ObjectStatus.Pending.value)
    		ticket.save()
    	}
    	
    }
}
