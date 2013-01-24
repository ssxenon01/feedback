package mn.xenon.auth

import mn.xenon.auth.User

class FacebookUser {

	long uid
    String accessToken

	static belongsTo = [user: User]

	static constraints = {
		uid unique: true
	}
}
