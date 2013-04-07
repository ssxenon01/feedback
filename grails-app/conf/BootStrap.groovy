import mn.xenon.auth.User
import mn.xenon.auth.Role
import mn.xenon.auth.UserRole
import mn.xenon.domain.Ticket
import mn.xenon.domain.Tag
import mn.xenon.domain.ObjectStatus
import grails.converters.JSON
import java.util.Random

class BootStrap {

    def tagList = []

    def init = { servletContext ->
        javax.servlet.http.HttpServletRequest.metaClass.getSiteUrl = {
            return (delegate.scheme + "://" + delegate.serverName + ":" + delegate.serverPort + delegate.getContextPath())
        }
        JSON.registerObjectMarshaller(Date) {
            return it?.format("d/M/yyyy H:m:s")
        }
        setupUsers()
        setupTicket()
    }
    def defaultUser

    def setupUsers() {
        Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        Role.findByAuthority('ROLE_FACEBOOK') ?: new Role(authority: 'ROLE_FACEBOOK').save(failOnError: true)
        Role.findByAuthority('ROLE_TWITTER') ?: new Role(authority: 'ROLE_TWITTER').save(failOnError: true)

        if (User.count() == 0) {
            def sampleUsers = [
                    [username: 'admin', role: 'ROLE_ADMIN', password: 'pass', firstname: 'Admin', lastname: 'Admin', email: 'admin@example.com', phone: '99999999', registerId: 'УБ12345678'],
                    [username: 'user', role: 'ROLE_USER', password: 'pass', firstname: 'User', lastname: 'User', email: 'user@example.com', phone: '88888888', registerId: 'УБ87654321']
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

    def setupTicket() {
        if (Tag.count()==0){
            def sampleTags = ['Хөдөө аж ахуй, ан агнуур, ойн аж ахуй', 'Уул уурхай, олборлох үйлдвэр', 'Боловсруулах үйлдвэр', 'Хүнсний болон хөнгөн үйлдвэр', 'Цахилгаан, дулааны үйлдвэрлэл, үйлчилгээ', 'Усан хангамж', 'Барилга', 'Худалдаа', 'Гэр ахуйн болон авто машины засварлах үйлчилгээ', 'Зочид буудал', 'Зоогийн газар', 'Тээвэр', 'Харилцаа холбоо, мэдээллийн технологи', 'Банк, санхүүгийн үйл ажиллагаа', 'Үл хөдлөх хөрөнгө зуучлалын үйлчилгээ', 'Түрээс, бизнесийн бусад үйл ажиллагаа', 'Боловсрол, шинжлэх ухаан', 'Эрүүл мэнд, нийгмийн хамгаалал ', 'Түлш, газрын тос', 'Аялал жуулчлал']
            sampleTags.each { label ->
                tagList.add(new Tag(label: label).save(failOnError: true))
            }
        }else{
            tagList = Tag.list()
        }
        if (Ticket.count() == 0) {
            /*def random = new Random()
            tagList.each { tag ->
                for(def i in 0..30){
                    def ticket = new Ticket(author:defaultUser, title:"Ticket title: ${i} created from tag :${tag.label}",vote:random.nextInt(2000),
                        content:'Hello world test ticket 1 Hello world test ticket 1 Hello world test ticket 1',
                        objectStatus: ObjectStatus.numToEnum(random.nextInt(5)+1))
                    ticket.addToTags(tag)
                    ticket.save(failOnError:true)
                }
            }*/
        }
    }

    def destroy = {
    }
}
