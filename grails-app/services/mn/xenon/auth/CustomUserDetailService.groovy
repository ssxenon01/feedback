package mn.xenon.auth

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUserDetailsService
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.security.core.userdetails.UserDetails
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.apache.commons.lang.time.DateUtils

class CustomUserDetailService implements GrailsUserDetailsService{

    /**
     * Some Spring Security classes (e.g. RoleHierarchyVoter) expect at least
     * one role, so we give a user with no granted roles this one which gets
     * past that restriction but doesn't grant anything.
     */
    static final List NO_ROLES = [new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)]

    UserDetails loadUserByUsername(String username, boolean loadRoles)
    throws UsernameNotFoundException {
        return loadUserByUsername(username)
    }

    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User.withTransaction { status ->

            User user = User.findByUsername(username)
            if(!user)
              user = User.findByEmail(username)
            if (!user) throw new UsernameNotFoundException(
                    'User not found', username)

            def authorities = user.authorities.collect {
                new GrantedAuthorityImpl(it.authority)
            }

            return new CustomUserDetails(user.username, user.password, user.enabled,
                    !user.accountExpired, !user.passwordExpired,
                    !user.accountLocked, authorities ?: NO_ROLES, user.id,
                    user.firstname + " " + user.lastname)
        }
    }

    String lostPassToken(String username) {

        if (!username||hasLost2ManyTimes()) {
            return null
        }

        def user = User.findByUsernameOrEmail(username,username)
        if(!user)
            return null
        def registrationCode = new RegistrationCode(userId: user.id, dateCreated: new Date())
        registrationCode.save(failOnError: true, flush: true)

        return registrationCode.token
    }

    Boolean hasLost2ManyTimes(String username) {
        Date start = DateUtils.truncate(new Date(), Calendar.DATE)
        Date end = start + 1
        end = DateUtils.addMilliseconds(end, -1)
        def user = User.findByUsername(username)

        def c = RegistrationCode.createCriteria()
        int count = c.count() {
            and {

                lt("dateCreated", end)
                gt("dateCreated", start)
            }
            eq('userId', user.id)
        }

        if (count > 2)
            return true
        else
            return false
    }
}
