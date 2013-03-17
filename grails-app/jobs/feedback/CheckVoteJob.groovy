package feedback

import mn.xenon.domain.Ticket
import mn.xenon.domain.ObjectStatus

class CheckVoteJob {
    
    def mailService
    def gspTagLibraryLookup 

    static triggers = {
        
      cron name: 'VoteCountJob', cronExpression: "0 0,35 * * * ?", startDelay: 5000 // execute job once in 30 minutes

    }

    def execute() {
        // println "vote job works"
    	def votedTickets = Ticket.createCriteria().list(){
    		'geProperty'('vote','maxVote')
    		'eq'('objectStatus',ObjectStatus.Open)
    	}
    	votedTickets.each{ ticket ->
    		ticket.setObjectStatus(ObjectStatus.Pending)
            if(ticket?.author?.email){
                def g = gspTagLibraryLookup.lookupNamespaceDispatcher("g")
                mailService.sendMail {
                   to ticket.author.email
                   subject "Таны дэвшүүлсэн саналыг 1000 хүн дэмжлээ 1284.mn"
                   body( view:"/includes/mail/_ticket", 
                      // plugin:"email-confirmation", 
                      model:[ticket:ticket])// body(view:'/includes/mail/ticketl', model:[ticket:ticket])
                   // html g.render(template:"/includes/mail/ticket",)
                }
            }
    		ticket.save()
    	}
    	
    }
}
