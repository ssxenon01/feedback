package mn.xenon.auth

import com.the6hours.grails.springsecurity.facebook.FacebookAuthToken
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONException
import mn.xenon.domain.Gender

class FacebookAuthService {

    def create(FacebookAuthToken token) {
        def data = loadUser(token.accessToken.accessToken)
        def fbUser = new FacebookUser()
        fbUser.uid = token.uid
        fbUser.accessToken = token.accessToken?.accessToken
        if (data){
            def user = User.findByEmail(data.email)
            if(!user){
                user = new User()
                user.username = data.id
                user.password = token.accessToken.accessToken
                user.email = data.email
            }
            user.firstname = data.first_name
            user.lastname = data.last_name
            user.facebook = data.link
            user.gender = data.gender=='male'?Gender.Male:Gender.Female
            user.about = data.bio
            if(user.validate()){
                user.save()
                fbUser.setUser(user)
                UserRole.withTransaction { status ->
                    ['ROLE_USER','ROLE_FACEBOOK'].each { String roleName ->
                        def auth = Role.findByAuthority(roleName)
                        if (auth) {
                            UserRole.create(user, auth)
                        } else {
                            log.error("Can't find authority for name '$roleName'")
                        }
                    }
                }   
            }else{
                log.error("User validate failed while saving")
            }
        }
        fbUser.save(flush: true,failOnError: true)

        return fbUser
    }
    def getPrincipal(def user){
        return user
    }
    def loadUser(String accessToken) {
        String loadUrl = "https://graph.facebook.com/me?access_token=$accessToken"
        try {
            URL url = new URL(loadUrl)
            def json = JSON.parse(url.readLines().first())
            return json
        } catch (IOException e) {
            log.error("Can't read data from Facebook", e)
        } catch (JSONException e) {
            log.error("Invalid response", e)
        }
    }
}
