package mn.xenon.domain

import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
import mn.xenon.auth.User

class FileService {
	
	def springSecurityService

	def upload(def file, def fileName = null){
		def allowed = ['jpeg','jpg','png','gif']
		if(!fileName)
			fileName = java.util.UUID.randomUUID().toString()
		def fileExtension = file.originalFilename.substring(file.originalFilename.lastIndexOf('.') + 1)
		if(allowed.contains(fileExtension)){
			def fileUrl = "${fileName}.${fileExtension}"
			file.transferTo(new File('/opt/grails/tmp/' + fileUrl))
			return fileUrl
		}else{
			return false
		}
	}
	def boolean deleteFile(String path) {
	    def borro = false;
	    def file = new File('/opt/grails/tmp/'+ path)
	    if (file.exists()) {
		    if (file.delete()) {
		        borro=true;
		    }
	    }
	    return borro;
    }
		
}