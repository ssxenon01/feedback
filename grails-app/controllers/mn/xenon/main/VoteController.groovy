package mn.xenon.main

import mn.xenon.domain.Ticket
import grails.converters.JSON
import mn.xenon.auth.User
import org.springframework.security.access.annotation.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class VoteController {

    def springSecurityService
    def sessionFactory

    def up(){
       def result = [ success:false ]
       def status = 200
       if(SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN,ROLE_USER")){
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
       }else{
          status = 401
       }
       
      render text: result as JSON, contentType: 'application/json', status: status
    }

    User currentUser(){
        return springSecurityService.currentUser
    }
}
