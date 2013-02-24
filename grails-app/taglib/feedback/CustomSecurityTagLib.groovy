package feedback

import com.the6hours.grails.springsecurity.twitter.TwitterAuthTagLib
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import twitter4j.TwitterFactory
import twitter4j.Twitter
import twitter4j.auth.RequestToken
import com.the6hours.grails.springsecurity.twitter.TwitterAuthFilter
import twitter4j.TwitterException

class CustomSecurityTagLib{

    def springSecurityService
    
    def currentUser = { attrs, body ->
        if(springSecurityService.currentUser){
            if(springSecurityService.currentUser.firstname)
            out << springSecurityService.currentUser.firstname
            else
            out << springSecurityService.currentUser.username
        }else{
            out << ''
        }
    }
    //<g:currentDir check="/user/profile" class="sdb_h_active"/>
    def currentDir = { attrs, body ->
        def list = [attrs.check]
        def url = request.forwardURI.replace(request.contextPath,'')
        if(attrs.checkIn){
            list = attrs.checkIn.split(',')
        }
        if(list.contains(url))
            out << attrs.class
    }
}
