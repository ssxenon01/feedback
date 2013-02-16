package mn.xenon.domain

import mn.xenon.auth.User

class TicketService {
	
	def springSecurityService

	def list(params){
		return Ticket.createCriteria().list(params){
			// checking only open and Pending tickets
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
			'in'('objectStatus',[ObjectStatus.Open.value,ObjectStatus.Pending.value])
		}
	}

	def count(params){
		return Ticket.createCriteria().count(){
			// checking only open and Pending tickets
			'in'('objectStatus',[ObjectStatus.Open.value,ObjectStatus.Pending.value])
		}
	}

	def closedList(params){
		return Ticket.createCriteria().list(params){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Closed.value)
		}
	}
	def closedCount(){
		return Ticket.createCriteria().count(){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Closed.value)
		}
	}

	def expiredList(params){
		return Ticket.createCriteria().list(params){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Expired.value)
		}
	}
	def expiredCount(){
		return Ticket.createCriteria().count(){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Expired.value)
		}
	}

	def duplicatedList(params){
		return Ticket.createCriteria().list(params){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Duplicated.value)
		}
	}

	def duplicatedCount(){
		return Ticket.createCriteria().count(){
			// checking only closed tickets
			'eq'('objectStatus',ObjectStatus.Duplicated.value)
		}
	}

	def getPendingTickets(){
		return Ticket.createCriteria().list(){
			eq('objectStatus',ObjectStatus.Pending.value)
		}
	}

    def getMyTickets(params = null){
        return Ticket.createCriteria().list(params) {
            eq('author',springSecurityService.currentUser as User)
            'ne'('objectStatus',ObjectStatus.Deleted.value)
        }
    }
    def getMyTicketsCount(){
        return Ticket.createCriteria().count() {
            eq('author',springSecurityService.currentUser as User)
            'ne'('objectStatus',ObjectStatus.Deleted.value)
        }
    }
}