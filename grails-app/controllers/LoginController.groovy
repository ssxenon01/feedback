import grails.converters.JSON

import javax.servlet.http.HttpServletResponse

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.web.WebAttributes
import mn.xenon.auth.User
import mn.xenon.auth.Role
import mn.xenon.auth.UserRole
import mn.xenon.auth.RegistrationCode

import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter

class LoginController {
	
	def mailService
	def customUserDetailService

    static allowedMethods = [regAction: "POST", forgotPass: "POST"]

	/**
	 * Dependency injection for the authenticationTrustResolver.
	 */
	def authenticationTrustResolver

	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService

	def token = {
		def success = false
		if(params.id){
			def rc = RegistrationCode.findByToken(params.id)
			if(rc){
				def user = User.get(rc.userId)
				if(user){
					springSecurityService.reauthenticate(user.username)
					success = true
					flash.message = "Нууц үгээ сольно уу"
					redirect controller:"user", action:"changePass" , params:[token:params.id]
				}
			}
		}
		if(!success)
			redirect controller:"index",action:'index'
	}
	/**
	 * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
	 */
	def id = {}
	def idPost = {
		if(params.registerId && params.registerId.size() >= 8){
			def user = springSecurityService.currentUser
			user.registerId = params.registerId
			user.save()
			redirect controller:'index', action:'index'
		}else{
			flash.error = "Регистерийн дугаар буруу байна"
			redirect action:'id'
		}
	}
	def index = {
		if (springSecurityService.isLoggedIn()) {
			redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
		}
		else {
			redirect action: 'auth', params: params
		}
	}
	def register = { }
	def forgot = {}
	def forgetPass = {

		def token = customUserDetailService.lostPassToken(params.username)
		def user = User.findByUsernameOrEmail(params.username,params.username)
		if(token){
			mailService.sendMail {
			   to user.email
			   subject "Нууц үг сэргээх 1284.mn"
			   html g.render(template:"/includes/mail/forgotpass",model:[user:user,token:token])
			}
			flash.success = "Таны email хаяг руу шинэ нууц үгийг илгээсэн. Бидний илгээсэн email ийг хүлээн аваагүй бол spam хэсэгтээ шалгаж үзнэ үү"
		}else{
			flash.error = "Та манай системд бүртгэлгүй байна"
		}
		
		redirect action:'forgot'
	}
	def regAction = {
		def user = new User(params)
		user.username = params.email
		if(user.validate()){
			user.save(flush:true)
			if(params.email){
				mailService.sendMail {
				   to params.email
				   subject "Welcome to 1284"
				   html g.render(template:"/includes/mail/registered",model:[user:user])
				}
			}
			UserRole.create(user, Role.findByAuthority("ROLE_USER"))
			springSecurityService.reauthenticate(params.email,params.password)
			redirect(controller:'index',action:'index')
		}else{
			flash.error = "${params.email} болон ${params.registerId} давхардсан байна."
			redirect(controller:'login',action:'register')
		}
	}
	/**
	 * Show the login page.
	 */
	def auth = {
		def config = SpringSecurityUtils.securityConfig

		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}

		String view = 'auth'
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view: view, model: [postUrl: postUrl,
		                           rememberMeParameter: config.rememberMe.parameter]
	}

	/**
	 * The redirect action for Ajax requests.
	 */
	def authAjax = {
		response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
		response.sendError HttpServletResponse.SC_UNAUTHORIZED
	}

	/**
	 * Show denied page.
	 */
	def denied = {
		if (springSecurityService.isLoggedIn() &&
				authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
			// have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
			redirect action: 'full', params: params
		}
	}

	/**
	 * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
	 */
	def full = {
		def config = SpringSecurityUtils.securityConfig
		render view: 'auth', params: params,
			model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
			        postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
	}

	/**
	 * Callback after a failed login. Redirects to the auth page with a warning message.
	 */
	def authfail = {

		def username = session[UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
		String msg = ''
		def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
		if (exception) {
			if (exception instanceof AccountExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.expired")
			}
			else if (exception instanceof CredentialsExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.passwordExpired")
			}
			else if (exception instanceof DisabledException) {
				msg = g.message(code: "springSecurity.errors.login.disabled")
			}
			else if (exception instanceof LockedException) {
				msg = g.message(code: "springSecurity.errors.login.locked")
			}
			else {
				msg = g.message(code: "springSecurity.errors.login.fail")
			}
		}

		if (springSecurityService.isAjax(request)) {
			render([error: msg] as JSON)
		}
		else {
			flash.message = msg
			redirect action: 'auth', params: params
		}
	}

	/**
	 * The Ajax success redirect url.
	 */
	def ajaxSuccess = {
		render([success: true, username: springSecurityService.authentication.name] as JSON)
	}

	/**
	 * The Ajax denied redirect url.
	 */
	def ajaxDenied = {
		render([error: 'access denied'] as JSON)
	}
}
