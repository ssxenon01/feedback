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

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ticketInstanceList: ticketService.list(params), ticketInstanceTotal: ticketService.count()]
    }
    def my(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model: [ticketInstanceList: ticketService.getMyTickets(params), ticketInstanceTotal: ticketService.getMyTicketsCount()])

    }
    def closed(Integer max){
        params.max = Math.min(max ?: 10, 100)
        [ticketInstanceList: ticketService.closedList(params), ticketInstanceTotal: ticketService.closedCount()]
    }

    @Secured(['ROLE_USER'])
    def create() {
        [ticketInstance: new Ticket(params)]
    }
    @Secured(['ROLE_USER'])
    def save() {
        def ticketInstance = new Ticket(params)
        if (!ticketInstance.save(flush: true)) {
            render(view: "create", model: [ticketInstance: ticketInstance])
            return
        }

        flash.message = message(code: 'default.dateCreated.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])
        redirect(action: "show", id: ticketInstance.id)
    }

    def show(Long id) {
        def ticketInstance = Ticket.get(id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
            return
        }

        [ticketInstance: ticketInstance]
    }
    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def ticketInstance = Ticket.get(id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
            return
        }

        [ticketInstance: ticketInstance]
    }
    @Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def ticketInstance = Ticket.get(id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ticketInstance.version > version) {
                ticketInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ticket.label', default: 'Ticket')] as Object[],
                          "Another user has updated this Ticket while you were editing")
                render(view: "edit", model: [ticketInstance: ticketInstance])
                return
            }
        }

        ticketInstance.properties = params

        if (!ticketInstance.save(flush: true)) {
            render(view: "edit", model: [ticketInstance: ticketInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])
        redirect(action: "show", id: ticketInstance.id)
    }
    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def ticketInstance = Ticket.get(id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
            return
        }

        try {
            ticketInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "show", id: id)
        }
    }
}