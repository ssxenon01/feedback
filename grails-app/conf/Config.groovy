import grails.plugins.springsecurity.SecurityConfigType

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*','app/bootstrap/*', 'app/css/*', 'app/js/*', 'app/img/*','app/lib/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "html" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
        grails.config.locations = ['file:/var/lib/tomcat7/1284_db.properties']
    }
}
grails.views.javascript.library="jquery"
// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}
grails.plugins.springsecurity.password.algorithm='SHA-512'
// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'mn.xenon.auth.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'mn.xenon.auth.UserRole'
grails.plugins.springsecurity.authority.className = 'mn.xenon.auth.Role'

grails.plugins.springsecurity.facebook.permissions = 'email,user_about_me'
grails.plugins.springsecurity.facebook.domain.classname='mn.xenon.auth.FacebookUser'
grails.plugins.springsecurity.facebook.appId='122933204547697'
grails.plugins.springsecurity.facebook.secret='9bd5ea032add6fa825f22e2f07a8e4fc'
grails.plugins.springsecurity.securityConfigType = SecurityConfigType.Annotation
grails.plugins.springsecurity.controllerAnnotations.staticRules = [
        '/js/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/css/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/images/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/main/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/app/js/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/app/img/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/app/lib/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/app/css/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/app/bootstrap/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/logout/**': ['IS_AUTHENTICATED_ANONYMOUSLY']
]
/*grails.plugins.springsecurity.providerNames = [
   'myAuthenticationProvider',
   'anonymousAuthenticationProvider',
   'rememberMeAuthenticationProvider'
]*/
// Here is the Mail server configuration defined by xenon
grails {
   mail {
     host = "smtp.gmail.com"
     port = 465
     username = "gundeetest@gmail.com"
     password = "root@Dm1n"
     props = ["mail.smtp.auth":"true",                     
              "mail.smtp.socketFactory.port":"465",
              "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
              "mail.smtp.socketFactory.fallback":"false"]
   }
}
grails.plugins.springsecurity.twitter.domain.classname = "mn.xenon.auth.TwitterUser"

grails.plugins.springsecurity.twitter.app.key='tEVQg1KWGNIkuPmZqFYg2g'
grails.plugins.springsecurity.twitter.app.consumerKey='tEVQg1KWGNIkuPmZqFYg2g'
grails.plugins.springsecurity.twitter.app.consumerSecret='3siBH0maCBcB2lGdL1pblN0SObEy74RfvzJvfNhLd4'
