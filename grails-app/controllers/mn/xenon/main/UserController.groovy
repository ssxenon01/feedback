package mn.xenon.main

import mn.xenon.domain.Ticket
import grails.converters.JSON
import mn.xenon.auth.User
import org.springframework.security.access.annotation.Secured

class UserController {

  def springSecurityService
  
  @Secured(['ROLE_ADMIN'])
  def list(Integer max){
      params.max = Math.min(max ?: 10, 100)
      def users = User.createCriteria().list(params){
        if(params.q){
          or{
            eq('username',params.q)
            'ilike'('firstname',"%${params.q}%")
            'ilike'('lastname',"%${params.q}%")
            'ilike'('registerId',"%${params.q}%")
            eq('email',params.q)
          }
        }
      }
      def count = User.createCriteria().count(){
        if(params.q){
          or{
            eq('username',params.q)
            'ilike'('firstname',"%${params.q}%")
            'ilike'('lastname',"%${params.q}%")
            'ilike'('registerId',"%${params.q}%")
            eq('email',params.q)
          }
        }
      }


      [users:users,count:count]

  }
  @Secured(['ROLE_ADMIN'])
  def edit(){
    if(!params.id)
      redirect(action: "list")
    [user:User.get(params.id)]
  }
  @Secured(['ROLE_USER'])
  def profile() {
    [user:currentUser()]
  }
  @Secured(['ROLE_USER'])
  def changePass() { 

    [user:currentUser()]
  }
  User currentUser(){
      return springSecurityService.currentUser
  }
}
