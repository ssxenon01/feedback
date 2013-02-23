package mn.xenon.domain

import mn.xenon.auth.User

class TicketService {
	
	def springSecurityService

	def list(params){
		if(params.from)
			params.from = Date.parse("MM/dd/yyyy", params.from)
		if(params.to)
			params.to = Date.parse("MM/dd/yyyy", params.to)
		return Ticket.createCriteria().list(params){
			if(params.from && params.to){
				'between'('dateCreated',params.from,params.to)			
			}else if(params.from){
				'ge'('dateCreated',params.from)
			}else if(params.to){
				'le'('dateCreated',params.to)
			}
			if(params.objectStatus)
				eq('objectStatus',params.objectStatus as ObjectStatus)
            if(params.q){
                or{
                    if(params.q.isLong())
                    'eq'('id',params.q as Long)
                    'like'('title', "%${params.q}%")
                    'like'('content', "%${params.q}%")
                }
            }
            if(params.tags){
            	tags{
        			'in'('id',params.tags.collect{ it as Long })
        		}
            }
			'in'('objectStatus',[ObjectStatus.Open,ObjectStatus.Pending])
		}
	}

	def count(params){
		
		return Ticket.createCriteria().list(params){
			if(params.from && params.to){
				'between'('dateCreated',params.from,params.to)			
			}else if(params.from){
				'ge'('dateCreated',params.from)
			}else if(params.to){
				'le'('dateCreated',params.to)
			}
			if(params.objectStatus)
				eq('objectStatus',params.objectStatus as ObjectStatus)
            if(params.q){
                or{
                    if(params.q.isLong())
                    'eq'('id',params.q as Long)
                    'like'('title', "%${params.q}%")
                    'like'('content', "%${params.q}%")
                }
            }
            if(params.tags){
            	tags{
        			'in'('id',params.tags.collect{ it as Long })
        		}
            }
			'in'('objectStatus',[ObjectStatus.Open,ObjectStatus.Pending])
		}
	}

	def closedList(params){
		return Ticket.createCriteria().list(params){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Closed)
		}
	}
	def closedCount(){
		return Ticket.createCriteria().count(){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Closed)
		}
	}

	def expiredList(params){
		return Ticket.createCriteria().list(params){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Expired)
		}
	}
	def expiredCount(){
		return Ticket.createCriteria().count(){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Expired)
		}
	}

	def duplicatedList(params){
		return Ticket.createCriteria().list(params){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Duplicated)
		}
	}

	def duplicatedCount(){
		return Ticket.createCriteria().count(){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Duplicated)
		}
	}

	def getPendingTickets(){
		return Ticket.createCriteria().list(){
			eq('objectStatus',ObjectStatus.Pending)
		}
	}

    def getMyTickets(params = null){
        return Ticket.createCriteria().list(params) {
            eq('author',springSecurityService.currentUser as User)
            'ne'('objectStatus',ObjectStatus.Deleted)
        }
    }
    def getMyTicketsCount(){
        return Ticket.createCriteria().count() {
            eq('author',springSecurityService.currentUser as User)
            'ne'('objectStatus',ObjectStatus.Deleted)
        }
    }
}