// Place your Spring DSL code here
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl

beans = {
    roleHierarchy(RoleHierarchyImpl) {
        hierarchy = '''
            ROLE_SUPERADMIN  > ROLE_ADMIN
            ROLE_ADMIN  > ROLE_USER
        '''
    }
}
