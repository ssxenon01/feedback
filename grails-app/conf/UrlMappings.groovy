class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"index", action:"index")
		"500"(view:'/error')
		"/test"(view:'test')
		"/test"(view:'test')

		"/layoutlogin"(view:'test/login')
		"/doregister"(view:'test/register')
		"/create"(view:'test/create')
	}
}
