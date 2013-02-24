import mn.xenon.auth.User
import mn.xenon.auth.Role
import mn.xenon.auth.UserRole
import mn.xenon.domain.Ticket
import mn.xenon.domain.Tag
import mn.xenon.domain.ObjectStatus
import java.util.Random
class BootStrap {

    def init = { servletContext ->
        javax.servlet.http.HttpServletRequest.metaClass.getSiteUrl = {
          return (delegate.scheme + "://" + delegate.serverName + ":" + delegate.serverPort + delegate.getContextPath())
        }
    	setupUsers()
    	setupTicket()
    }
    def defaultUser
    def setupUsers(){
	    Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        Role.findByAuthority('ROLE_FACEBOOK') ?: new Role(authority: 'ROLE_FACEBOOK').save(failOnError: true)
        Role.findByAuthority('ROLE_TWITTER') ?: new Role(authority: 'ROLE_TWITTER').save(failOnError: true)

        if (User.count() == 0) {
        	def sampleUsers = [
                [username:'admin',role: 'ROLE_ADMIN', password: 'pass', firstname: 'Admin', lastname: 'Admin',email:'admin@example.com',phone:'99999999',registerId:'УБ12345678'],
                [username:'user',role: 'ROLE_USER', password: 'pass', firstname: 'User', lastname: 'User',email:'user@example.com',phone:'88888888',registerId:'УБ87654321']
            ]
            sampleUsers.each { attrs ->
            	def user = new User(attrs).save(failOnError: true)
            	def role = Role.findByAuthority(attrs.role)
		        if (!user.authorities.contains(role)) {
		            UserRole.create(user, role)
		        }
                defaultUser = user
            }
        }
    }
    def setupTicket(){
    	if(Ticket.count() == 0){
            def tagList = []
            def sampleTags = ['Хэрэглэгчийн хууль','Худалдаа үйлчилгээ','Хөдөө аж ахуй','Мэдээллийн технологи','Түлш эрчим хүч, Барилга орон сууц','Аялал жуулчлал','Шинжлэх ухаан',
            'Эмнэлэгийн хэрэгслийн худалдаа','Түлш эрчим хүч, Уул уурхай','Өрсөлдөөний хууль','Төрийн болон Төрийн бус байгууллага','Банк санхүү, худалдаа үйлчилгээний салбар',
            'Харилцаа холбоо, Мэдээллийн технологи','Нийтийн аж ахуй, Зам тээвэр','Боловсрол, Соёл урлаг','Эрүүл мэндийн үйлчилгээ','Үйлдвэрлэл, Ниймгмийн хамгаалал']
            sampleTags.each{ label ->
                tagList.add(new Tag(label:label).save(failOnError:true))
            }
            def random = new Random()
            tagList.each { tag ->
                for(def i in 0..30){
                    def ticket = new Ticket(author:defaultUser, title:"Ticket title: ${i} created from tag :${tag.label}",vote:random.nextInt(2000),
                        content:'Hello world test ticket 1 Hello world test ticket 1 Hello world test ticket 1',
                        objectStatus: ObjectStatus.numToEnum(random.nextInt(5)+1))
                    ticket.addToTags(tag)
                    ticket.save(failOnError:true)
                }
            }
    	}
    }
    def destroy = {
    }
}
