package mn.xenon.domain

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import grails.converters.JSON

class TicketController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST",fetch: "POST"]
    def springSecurityService
    def ticketService
    def fileService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if(!params.objectStatus){
            params.objectStatus = ObjectStatus.Open.name()
        }
        [ticketInstanceList: ticketService.list(params), ticketInstanceTotal: ticketService.count(params),hotTickets:ticketService.hotTickets([max:4])]
    }
    def closed(Integer max){
        params.max = Math.min(max ?: 10, 100)
        [ticketInstanceList: ticketService.closedList(params), ticketInstanceTotal: ticketService.closedCount(),hotTickets:ticketService.hotTickets([max:4])]
    }
    def pending(Integer max){
        params.max = Math.min(max ?: 10, 100)
        [ticketInstanceList: ticketService.getPendingTickets(params), ticketInstanceTotal: ticketService.getPendingCount(),hotTickets:ticketService.hotTickets([max:4])]
    }
    def fetch(){
        render(template:'/ticket/multi',model:[ticketList: Ticket.list(params)])
    }

    @Secured(['ROLE_USER'])
    def create() {
        [ticketInstance: new Ticket(params)]
    }
    @Secured(['ROLE_USER'])
    def save() {
        def ticketInstance = new Ticket(params)
        def multipartFile = request.getFile("file")
        if(multipartFile){
            def file = fileService.upload(multipartFile)
            if(file)
            ticketInstance.img = file
        }

        ticketInstance.author = springSecurityService.currentUser
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
        def multipartFile = request.getFile("file")
        if(multipartFile){
            if(ticketInstance.img){
                fileService.deleteFile(ticketInstance.img)
            }
            def file = fileService.upload(multipartFile)
            if(file)
            ticketInstance.img = file
        }
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

    def complete(){
        def result = [success:true]
        if(params.q){
            def list = params.q.split(' ')
            result.data = Ticket.createCriteria().list([max:8]){
                or{
                    list.each{
                        if(it.size() > 5){
                            'ilike'('title', "%${it}%")
                        }
                    }
                }
            }.collect{[id:it.id, title:it.title, content:it.content]}
        }

        render result as JSON
    }
}
