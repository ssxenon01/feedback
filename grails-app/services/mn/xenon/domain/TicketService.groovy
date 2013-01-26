package mn.xenon.domain

class TicketService {
	
	def springSecurityService

	def getPendingTickets(){
		return Ticket.createCriteria().list(){
			eq('objectStatus',ObjectStatus.Pending.value)
		}
	}
	
}