package feedback

import groovy.time.TimeCategory
import mn.xenon.domain.Ticket
import mn.xenon.domain.ObjectStatus

class ExpireTicketJob {
	
    static triggers = {
      cron name: 'ExpireTicketJob', cronExpression: "0 0 4 * * ?", startDelay: 5000 // every day @ 4 am
    }

    def execute() {
        use ( TimeCategory ) {
	        // Check open tickets dateCreated a year ago and set as Expired
	        def expiredTickets = Ticket.createCriteria().list(){
	    		'le'('dateCreated',1.year.ago)
	    		'eq'('objectStatus',ObjectStatus.Open)
	    	}
	    	expiredTickets.each{ ticket ->
	    		ticket.setObjectStatus(ObjectStatus.Expired)
	    		ticket.save()
	    	}
	    }
    }
}
