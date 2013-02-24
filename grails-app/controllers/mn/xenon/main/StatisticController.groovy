package mn.xenon.main

import mn.xenon.domain.Statistic
import mn.xenon.domain.TimePeriod
import grails.converters.JSON
import mn.xenon.auth.User
import org.springframework.security.access.annotation.Secured

class StatisticController {

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def latest(){
      def last = Statistic.last('startDate')
      render last as JSON
    }
    def range(){
      def startDate = TimePeriod.week.to2DatePeriod(new Date(),-1)
      
      def list = Statistic.findAllByStartDateGreaterThan(startDate)
      render list as JSON
    }
    User currentUser(){
        return springSecurityService.currentUser
    }
}
