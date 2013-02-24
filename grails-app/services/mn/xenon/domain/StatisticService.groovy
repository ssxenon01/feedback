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

        stat.total = Ticket.countByObjectStatusNotEqual(ObjectStatus.Deleted)
        stat.created = Ticket.countByDateCreatedBetween(startDate,endDate)
        stat.closed = Ticket.countByObjectStatusAndLastUpdatedBetween(ObjectStatus.Closed,startDate,endDate)
        stat.pending = Ticket.countByObjectStatusAndLastUpdatedBetween(ObjectStatus.Pending,startDate,endDate)
        stat.suspended = Ticket.countByObjectStatusAndLastUpdatedBetween(ObjectStatus.Suspended,startDate,endDate)
        stat.deleted = Ticket.countByObjectStatusAndLastUpdatedBetween(ObjectStatus.Deleted,startDate,endDate)
        stat.save(flush: true, failOnError: true)
        println stat
    }
}