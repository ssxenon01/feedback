package mn.xenon.domain

import mn.xenon.auth.User

class StatisticService {
	
	def springSecurityService

	def generate(Date startDate = new Date(System.currentTimeMillis()), TimePeriod timePeriod = TimePeriod.day){
        startDate = timePeriod.trunkateDate(startDate)
        Date endDate = timePeriod.to2DatePeriod(startDate)

        Statistic stat = Statistic.findByStartDateAndTimePeriod(startDate, timePeriod)
        if (!stat)
            stat = new Statistic(startDate:startDate,timePeriod:timePeriod)

        def tickets = Ticket.withCriteria {

        }
        //TODO make statistic service
        stat.save(flush: true, failOnError: true)
    }
}