import mn.xenon.auth.User
import mn.xenon.auth.Role
import mn.xenon.auth.UserRole
import mn.xenon.domain.Ticket

class BootStrap {

    def init = { servletContext ->

    	setupUsers()
    	setupTicket()
    }

    def setupUsers(){
	    Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        if (User.count() == 0) {
        	def sampleUsers = [
                'admin': [role: 'ROLE_ADMIN', pass: 'pass', firstname: 'Admin', lastname: 'Admin'],
                'user': [role: 'ROLE_USER', pass: 'pass', firstname: 'User', lastname: 'User']
            ]
            sampleUsers.each { username, attrs ->
            	def user = new User(username:username, password:attrs.pass,enabled:true).save(failOnError: true)
            	def role = Role.findByAuthority(attrs.role)
		        if (!user.authorities.contains(role)) {
		            UserRole.create(user, role)
		        }
            }
        }
    }
    def setupTicket(){
    	if(Ticket.count() == 0){
    		def ticket = new Ticket(content:'Hello world test ticket 1').save(failOnError:true)
    	}
    }
    def destroy = {
    }
}
