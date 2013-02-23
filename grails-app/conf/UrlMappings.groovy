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

		"/layoutlogin"(view:'test/login')
		"/doregister"(view:'test/register')
		"/create"(view:'test/create')
		"/user"(view:'test/user')
		"/appPetitions"(view:'app/petitionList')
		"/userPage"(view:'app/user')
		"/userlist"(view:'app/users')
		"/petition"(view:'app/petition')
		"/categorylist"(view:'app/categorylist')
		"/category"(view:'app/category')

	}
}
