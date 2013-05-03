package mn.xenon.domain

import mn.xenon.auth.User
import mn.xenon.domain.TimePeriod
class TicketService {
	
	def springSecurityService

	def list(params){

		params.sort = params.sort?:"dateCreated"
        params.order = params.order?:"desc"

		if(params.from)
			params.from = Date.parse("MM/dd/yyyy", params.from)
		if(params.to)
			params.to = TimePeriod.day.to2DatePeriod(Date.parse("MM/dd/yyyy", params.to))
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
			if(params.type)
				eq('type',params.type as Type)
            if(params.q){
                or{
                    if(params.q.isLong())
                    'eq'('id',params.q as Long)
                    'like'('title', "%${params.q}%")
                    'like'('content', "%${params.q}%")
                    author{
                    	eq('phone',params.q)
                    }
                    author{
                    	eq('email',params.q)
                    }
                    author{
                    	eq('registerId',params.q)
                    }
                }
            }
            if(params.tags){
            	tags{
        			'in'('id',params.tags.collect{ it as Long })
        		}
            }
            if(!params.objectStatus)
			'not' {'in'("objectStatus", [ObjectStatus.Deleted,ObjectStatus.Duplicated])}
		}
	}

	def count(params){
		
		return Ticket.createCriteria().count(){
			if(params.from && params.to){
				'between'('dateCreated',params.from,params.to)			
			}else if(params.from){
				'ge'('dateCreated',params.from)
			}else if(params.to){
				'le'('dateCreated',params.to)
			}
			if(params.objectStatus)
				eq('objectStatus',params.objectStatus as ObjectStatus)
			if(params.type)
				eq('type',params.type as Type)
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
            if(!params.objectStatus)
			'not' {'in'("objectStatus", [ObjectStatus.Deleted,ObjectStatus.Duplicated])}
			
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

	def getPendingTickets(params){
		return Ticket.createCriteria().list(params){
			eq('objectStatus',ObjectStatus.Pending)
		}
	}
	
	def getPendingCount(){
		return Ticket.createCriteria().count(){
			eq('objectStatus',ObjectStatus.Pending)
		}
	}

    def getMyTickets(params = null){
        return Ticket.createCriteria().list(params) {
            eq('author',springSecurityService.currentUser as User)
            'ne'('objectStatus',ObjectStatus.Deleted)
        }
    }
    
    def getMyTicketsCount(params = null){
        return Ticket.createCriteria().count() {
            eq('author',springSecurityService.currentUser as User)
            'ne'('objectStatus',ObjectStatus.Deleted)
        }
    }
    def hotTickets(params = null){
        	return Ticket.createCriteria().list(params) {
	            'gtProperty'('maxVote','vote')
//	            'eq'('type',Type.Interests)
	            'not'{            	
	            	'in'('objectStatus',[ObjectStatus.Deleted,ObjectStatus.Expired,ObjectStatus.Closed])
	            }
	            order('vote','desc')
	        }
        // }
    }
}