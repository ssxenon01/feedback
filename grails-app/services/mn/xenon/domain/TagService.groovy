package mn.xenon.domain

import mn.xenon.auth.User

class TagService {
	
	def springSecurityService

	def list(params){
		return Tag.createCriteria().list(params){
            if(params.q)
	            'like'('label', "%${params.q}%")
		}
	}

	def count(params){
		return Tag.createCriteria().count(){
            if(params.q)
	            'like'('label', "%${params.q}%")
		}
	}
}