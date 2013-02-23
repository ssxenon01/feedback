package mn.xenon.main

import mn.xenon.domain.Ticket
import grails.converters.JSON
import mn.xenon.auth.User
import org.springframework.security.access.annotation.Secured

class VoteController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def up(){
       def result = [ success:false ]
       if(params.id){
           Ticket ticket = Ticket.get(params.id)
           if (ticket){
               if(!ticket.voteList.contains(currentUser())){
                   ticket.vote ++;
                   ticket.addToVoteList(currentUser())
               }else{
                   ticket.vote --;
                   ticket.removeFromVoteList(currentUser())
               }
               ticket.save()
               result.vote = ticket.vote
               result.success = true
           }
       }
       render result as JSON
    }
    def index() { }

    User currentUser(){
        return springSecurityService.currentUser
    }
}
