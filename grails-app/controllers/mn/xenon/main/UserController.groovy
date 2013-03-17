package mn.xenon.main

import mn.xenon.domain.Ticket
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import grails.converters.JSON
import mn.xenon.auth.User
import mn.xenon.auth.Role
import mn.xenon.auth.UserRole
import org.springframework.security.access.annotation.Secured
import mn.xenon.auth.RegistrationCode
class UserController {
  
  static allowedMethods = [editProfile: "POST",changepass:"POST"]

  def springSecurityService
  def messageSource
  def fileService
  
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

    def user = User.get(params.id)
    def roles = user.getAuthorities()
    def isAdmin = roles.find{ role -> role.authority =='ROLE_ADMIN' }
    render view:"profile",model:[user:user,isAdmin:isAdmin?true:false]
  }
  @Secured(['ROLE_USER'])
  def profile() {
    [user:User.get(currentUser().id)]
  }
  def editProfile(){
    def admin
    if(params.id&&SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")){
      admin = true
    }else{
      params.id = currentUser().id
    }
    def user = User.get(params.id)
    user.properties = params

    if(params.id != springSecurityService.currentUser.id && SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")){
        if(params.promoteAdmin){
          def role = Role.findByAuthority('ROLE_ADMIN')
          if (!user.authorities.contains(role)) {
              UserRole.create(user, role)
          }
        }else{
          UserRole.remove(user,Role.findByAuthority('ROLE_ADMIN'))
        }
    }
    def multipartFile = request.getFile("file")
    if(multipartFile){
        if(user.profile){
            fileService.deleteFile(user.profile)
        }
        def file = fileService.upload(multipartFile)
        if(file)
        user.profile = file
    }
    user.save()
    if (user.hasErrors()) {
        flash.error = extractErrors(user).join(";")
    } else {
        flash.success = "Профайл амжилттай шинэчлэгдлээ"
    }
    if(!admin)
      redirect(action:'profile')
    else
      redirect(action:'edit',id:user.id)
  }
  @Secured(['ROLE_USER'])
  def changePass() { 

    [user:currentUser()]
  }
  @Secured(['ROLE_USER'])
  def changepass() {
    if(params.token || springSecurityService.currentUser.password == springSecurityService.encodePassword(params.oldpassword)){
      def user = User.get(springSecurityService.currentUser.id)
      def listTokens = RegistrationCode.findAllByUserId(user.id)
      listTokens.each{ token ->
        token.delete()
      }
      user.password = params.newpassword
      user.save()
      flash.message = "Нууц үг амжилттай солигдлоо"
    }else{
      flash.error = "Хуучин нууц үг буруу байна"
    }
    redirect(action: "changePass")
  }
  User currentUser(){
      return springSecurityService.currentUser
  }
  private extractErrors(model) {
      model.errors.fieldErrors.collect { error ->
          println error
          messageSource.getMessage(error, request.locale)
      }
  }
}
