package feedback

import mn.xenon.domain.Ticket
import mn.xenon.domain.ObjectStatus

class StatisticJob {

    def statisticService

    static triggers = {
        
      cron name: 'StatisticJob', cronExpression: "0 15,45 * * * ?", startDelay: 5000 // execute job once in 30 minutes

    }

    def execute() {
        statisticService.generate()  
    }
}
