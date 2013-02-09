package mn.xenon.domain
import mn.xenon.auth.User

class Page extends BaseDomain{

	String title

	String content

	String description

	static hasMany = [tags: Tag]

	static mapping = {
		cache true
        content type: 'text'
        description type: 'text'
        table 'page'
	}

	static constraints = {
		title blank: false
        tags nullable: true, lazy: true, reference: false
        content nullable: true,blank:true
		description nullable: true,blank:true
	}
}
