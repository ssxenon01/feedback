package feedback

import mn.xenon.domain.Ticket
import mn.xenon.domain.ObjectStatus

class CheckVoteJob {
    
    def mailService

    static triggers = {
        
      cron name: 'VoteCountJob', cronExpression: "0 0,30 * * * ?", startDelay: 5000 // execute job once in 30 minutes

    }

    def execute() {
        // println "vote job works"
    	def votedTickets = Ticket.createCriteria().list(){
    		'gtProperty'('vote','maxVote')
    		'eq'('objectStatus',ObjectStatus.Open)
    	}
    	votedTickets.each{ ticket ->
    		ticket.setObjectStatus(ObjectStatus.Pending)
            if(ticket?.author?.email){
                mailService.sendMail {
                   to ticket.author.email
                   subject "Таны дэвшүүлсэн саналыг 1000 хүн дэмжлээ 1284.mn"
                   html g.render(template:"/includes/mail/ticket",model:[ticket:ticket])
                }
            }
    		ticket.save()
    	}
    	
    }
}
