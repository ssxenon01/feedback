package mn.xenon.auth

import org.springframework.security.*
import org.springframework.security.providers.*
import org.springframework.security.userdetails.*
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.authentication.AuthenticationProvider
import mn.xenon.auth.User
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.security.authentication.BadCredentialsException

class EmailAuthenticationProvider implements AuthenticationProvider {

    def authenticateService
    def springSecurityService

    Authentication authenticate(Authentication customAuth) {
        println customAuth.credentials
        User.withTransaction { status ->
            User user = User.findByEmail(customAuth.principal)
            if(user) {
                if (user?.password == springSecurityService.encodePassword(customAuth.credentials)) {
                    GrantedAuthorityImpl[] authorities = user.authorities.collect {new GrantedAuthorityImpl(it.authority)}
                    def userDetails = new GrailsUser(user.email, user.password, true, true, true, true, authorities, user)
                    def token = new UsernamePasswordAuthenticationToken(userDetails, user.passwd, userDetails.authorities)
                    token.details = customAuth.details

                    return token
                }else throw new BadCredentialsException("Log in failed - identity could not be verified");
            }else {
                return null
            }
        }
    }

    boolean supports(Class authentication) {
        return true
    }
}