package mn.xenon.domain

class TicketService {
	
	def springSecurityService

	def list(params){
		return Ticket.createCriteria().list(params){
			// checking only open and Pending tickets
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
	
}