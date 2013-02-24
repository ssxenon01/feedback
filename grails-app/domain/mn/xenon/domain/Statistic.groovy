package mn.xenon.domain
import mn.xenon.auth.User

class Statistic{

	Date dateCreated
	Date lastUpdated

	int total = 0
	int created = 0
	int closed = 0
	int pending = 0
	int suspended = 0
	int deleted = 0

	TimePeriod timePeriod
    Date startDate

	static mapping = {
   	   	autoTimestamp true
		cache true
		table 'statistic'
	}

	static constraints = {
		
	}

	void cumulate(Statistic stat) {
		total = stat.total
		created = created + stat.created
		closed = closed + stat.closed
		pending = pending + stat.pending
		suspended = suspended + stat.suspended
		deleted = deleted + stat.deleted
    }
}
