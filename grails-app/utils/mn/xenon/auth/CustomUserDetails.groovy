package mn.xenon.auth

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.security.core.GrantedAuthority
import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class CustomUserDetails extends GrailsUser {

    final String email
    final String profileImageUrl
    final String firstname
    final String lastname

    CustomUserDetails(String username, String password, boolean enabled, boolean accountNonExpired,
                      boolean credentialsNonExpired, boolean accountNonLocked,
                      Collection<GrantedAuthority> authorities, def id,
                      String email, String profileImageUrl, String firstname, String lastname) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities, id)

        this.email = email
        this.profileImageUrl = profileImageUrl
        this.firstname = firstname
        this.lastname = lastname
    }

    boolean equals(o) {
        return EqualsBuilder.reflectionEquals(this, o);
    }

    int hashCode() {
        return HashCodeBuilder.reflectionHashCode(this);
    }
}
