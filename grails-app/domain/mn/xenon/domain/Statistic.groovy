package mn.xenon.domain
import mn.xenon.auth.User

class Statistic extends BaseDomain{

	int total = 0
	int closed = 0
	int pending = 0
	int suspended = 0
	int deleted = 0

	TimePeriod timePeriod
    Date startDate

	static mapping = {
		cache true
	}

	static constraints = {
		
	}

	void cumulate(Statistic stat) {
        total = total + stat.total
		closed = closed + stat.closed
		pending = pending + stat.pending
		suspended = suspended + stat.suspended
		deleted = deleted + stat.deleted
    }
}
