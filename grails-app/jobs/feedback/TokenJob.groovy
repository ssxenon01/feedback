package feedback

import mn.xenon.auth.RegistrationCode

class TokenJob {

    static triggers = {
        
      cron name: 'TokenJob', cronExpression: "0 0 3 * * ?", startDelay: 5000 // execute job once in 30 minutes

    }

    def execute() {
        def list = RegistrationCode.list();
        list.each{ token ->
        	token.delete()
        }
    }
}
