import mn.xenon.domain.Ticket

class IndexController {

def ticketService
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index = {
		if(params.q == 'new'){
			[ticketList: ticketService.list([max:30])]
		}else{
			[ticketList: ticketService.hotTickets([max:30])]
		}
	}
}
