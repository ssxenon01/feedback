package mn.xenon.main

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import mn.xenon.domain.Ticket
import mn.xenon.domain.ObjectStatus
import mn.xenon.domain.Statement
import org.apache.commons.lang.StringUtils;
import feedback.StatisticJob

@Secured(['ROLE_USER'])
class AppController {

    static allowedMethods = [save: "POST", update: "POST", createStatement: "POST"]

    def ticketService
    def springSecurityService
    def index(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [ticketInstanceList: ticketService.list(params), ticketInstanceTotal: ticketService.count(params), title:params.objectStatus?"":"Бүх"]
    }

    def show(){
        if(!params.id)
            redirect(action: "index")
        [ticket:Ticket.get(params.id)]
    }
    
    def my(Integer max){
        params.max = Math.min(max ?: 20, 100)
        render(view:'index', model:[ticketInstanceList: ticketService.getMyTickets(params), ticketInstanceTotal: ticketService.getMyTicketsCount(params),title:"Миний"])
    }

    @Secured(['ROLE_ADMIN'])
    def createStatement(){
        def ticket = Ticket.get(params.id)
        if(ticket){
            if(ticket.objectStatus.toString() != params.objectStatus)
            ticket.objectStatus = params.objectStatus
            if(params.objectStatus == ObjectStatus.Duplicated.name() && params.diplicatedWith){
                ticket.diplicatedWith = Ticket.get(params.diplicatedWith)
            }
            ticket.save()
            if(StringUtils.isNotBlank(params.statement)){
                def statement = new Statement(content:params.statement,ticket:ticket,author:springSecurityService.currentUser).save()
            }
            flash.success = "Саналыг амжилттай засварлалаа"
            redirect(action: "show",id:ticket.id)
        }else{
            flash.error = "${params.id} дугаартай санал олдсонгүй"
            redirect(action: "index")
        }
        
    }
    @Secured(['ROLE_ADMIN'])
    def changeVote(){
        def ticket = Ticket.get(params.id)
        if(ticket){
            ticket.vote = params.voteCount as Integer
            ticket.save()
            flash.success = "Саналыг амжилттай засварлалаа"
            redirect(action: "show",id:ticket.id)
        }else{
            flash.error = "${params.id} дугаартай санал олдсонгүй"
            redirect(action: "index")
        }
    }
    @Secured(['ROLE_ADMIN'])
    def statistic(){
        
    }
}
