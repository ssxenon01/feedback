package mn.xenon.domain

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class StatementController {

    def springSecurityService
    def ticketService
    def fileService

    def edit() {
        def statement = Statement.get(params.id)
        statement.properties = params
        statement.save()

        render(template:'/ticket/statement',model:[statement: statement])
    }
    def delete(){
        def statement = Statement.get(params.id)
        statement.delete()
        def result = [success:true]
        render result as JSON
    }
}
