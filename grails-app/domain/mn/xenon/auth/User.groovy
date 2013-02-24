package mn.xenon.auth

import mn.xenon.domain.Tag
import mn.xenon.domain.Ticket
import mn.xenon.domain.Gender
import mn.xenon.domain.BaseDomain
import mn.xenon.domain.ObjectStatus

class User implements Serializable{

	transient springSecurityService

	Date dateCreated
	Date lastUpdated

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
    String firstname
    String lastname
    String email
    String registerId

    String about
    String phone
    String facebook
    String twitter



    Gender gender = Gender.Other
    static hasMany = [tags:Tag]

	static constraints = {
        username blank: false, unique: true
        firstname nullable: true
        lastname nullable: true
        email nullable: true, unique:true
        password blank: false
        registerId blank:true, nullable:true,unique:true
        tags nullable: true, lazy: true, reference: false
        about nullable:true
        phone nullable:true
        facebook nullable:true
        twitter nullable:true
	}

	static mapping = {
   	   	autoTimestamp true
		about type:'text'
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	int countTickets(){
		return Ticket.createCriteria().count(){
			author{
				eq('id',this.id)
			}
			'not' {'in'("objectStatus", [ObjectStatus.Deleted,ObjectStatus.Duplicated])}
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
