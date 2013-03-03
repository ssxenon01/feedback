dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/devfeedback?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = "pass"
        }
        hibernate {
            //show_sql = true
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/testfeedback?useUnicode=yes&characterEncoding=UTF-8"
            username = "test"
            password = "testpw"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://124.158.104.23/prodfeedback?useUnicode=yes&characterEncoding=UTF-8"
            username = "prod"
            password = "prodpw"
        }
    }
}
