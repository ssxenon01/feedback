package mn.xenon.main

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import mn.xenon.domain.Ticket

@Secured(['ROLE_USER'])
class AppController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def ticketService

    def index(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [ticketInstanceList: ticketService.list(params), ticketInstanceTotal: ticketService.count(params)]
    }

    def show(){
        if(!params.id)
            redirect(action: "index")
        [ticket:Ticket.get(params.id)]
    }
}
