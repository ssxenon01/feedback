package mn.xenon.domain

class Tag implements Serializable{

	String label
	int priority = 0

	static belongsTo = [ticket: Ticket]
	
	static mapping = {
		cache true
	}

	static constraints = {
		label blank: false, unique: true
	}
}
