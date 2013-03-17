// Place your Spring DSL code here
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl
import mn.xenon.auth.CustomUserDetailService



beans = {
    roleHierarchy(RoleHierarchyImpl) {
        hierarchy = '''
            ROLE_SUPERADMIN  > ROLE_ADMIN
            ROLE_ADMIN  > ROLE_USER
        '''
    }
    beans = {
        userDetailsService(CustomUserDetailService)
    }
    /*myAuthenticationProvider(EmailAuthenticationProvider){
    	springSecurityService = ref("springSecurityService")
    }*/
}