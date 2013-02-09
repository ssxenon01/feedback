package feedback

import com.the6hours.grails.springsecurity.twitter.TwitterAuthTagLib
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import twitter4j.TwitterFactory
import twitter4j.Twitter
import twitter4j.auth.RequestToken
import com.the6hours.grails.springsecurity.twitter.TwitterAuthFilter
import twitter4j.TwitterException

class TwitterAuthCustomTagLib extends TwitterAuthTagLib{

    def url = { attrs, body ->
        def conf = SpringSecurityUtils.securityConfig.twitter

        String authFilter = conf.filter.processUrl

        TwitterFactory factory = new TwitterFactory()
        Twitter twitter = factory.getInstance()
        twitter.setOAuthConsumer(conf.app.consumerKey, conf.app.consumerSecret)

        RequestToken requestToken = session.getAttribute(TwitterAuthFilter.REQUEST_TOKEN)
        if (requestToken == null) {
            try {
                log.info "Prepare new requestToken, put as " + TwitterAuthFilter.REQUEST_TOKEN
                String callbackUrl = g.resource(file: authFilter, absolute: true)
                requestToken = twitter.getOAuthRequestToken(callbackUrl)
                session.setAttribute(TwitterAuthFilter.REQUEST_TOKEN, requestToken)
            } catch (TwitterException e) {
                log.error "Twitter error: $e.message"
                log.error "Used Consumer Key / Secret: $conf.app.consumerKey / $conf.app.consumerSecret"
                log.error "Skipping twitter auth button"
                return
            }
        } else {
            log.info "Reusing existing requestToken"
        }

        log.debug "Request Token: " + session.getAttribute(TwitterAuthFilter.REQUEST_TOKEN)

        String authUrl = requestToken.authenticationURL

        out << authUrl
    }
}
