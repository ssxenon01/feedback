<%@ page import="mn.xenon.domain.Tag" %>
<%@ page import="mn.xenon.domain.Ticket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="base">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="content-wrapper petition-single">
            <div class="container">
                <div class="row">
                    <div class="span8" style="min-height: 600px;">
                        <div class="petition-single-content">
                            <div class="media-box"><img src="http://d22r54gnmuhwmk.cloudfront.net/photos/8/dd/rg/cYDdrGzjakFdCUX-556x313-noPad.jpg" class="rounded-corners" width="600">
                            </div>
                            <div class="media-content">
                                <h1 class="title">${ticketInstance.title}</h1>
                                <p>${ticketInstance.content}</p>
                                <div class="date"><strong>Created:</strong>${ticketInstance.dateCreated}</div>
                                <div class="tag"><strong>Category</strong>
                                	 <g:each in="${Tag.list()}" var="tag">
                                	 	<a href="#">${fieldValue(bean: tag, field: "label")}</a>,
								    </g:each>
                                </div>
                                <div class="like-num">
                                    <div class="row">
                                        <div class="span4">
                                            <h4>Signatures needed by March 02, 2013 to reach goal of 100,000</h4>
                                            <div class="count">999</div>
                                        </div>
                                        <div class="span3">
                                            <h4>TOTAL SIGNATURES ON THIS PETITION</h4>
                                            <div class="count">999</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="social-form">
                                    <div class="connect-buttons">
                                        <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>
                                        <div class="fb-like" data-href="<g:createLink controller="ticket" action="show" id="${ticketInstance.id}" absolute="true" />" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                                        
                                    </div>
                                	<div class="fb-comments" data-href="<g:createLink controller="ticket" action="show" id="${ticketInstance.id}" absolute="true" />" data-width="580" data-num-posts="10"></div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="span4" style="position: relative">
                        <div class="petition-box">
                            <div class="inner">
                                <div class="petition-box-head">
                                    <h4 class="">Sign this Petition</h4>
                                    <div id="with-supporters">
                                        <form action="#" accept-charset="UTF-8" method="post">
                                            <div>${ticketInstance.vote}</div>
                                            <!--                                            <input type="submit" name="op" id="t" value="Энэ саналыг дэмжих" class="form-submit support btn-like">-->
                                            <input type="submit" name="op" id="t" value="Энэ саналыг дэмжих" class="form-submit btn disabled">
                                        </form>
                                    </div>
                                    <div class="clear"></div>
                                    <div class="pet-graph">
                                        <div class="thermometer" style="">
                                            <div class="mercury" style="width: 78%"></div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="count pull-right">48,617 NEEDED</div>   
                                </div>
                                <div class="clear"></div>
                                <sec:ifNotLoggedIn>
	                                <g:form action="${request.contextPath}/j_spring_security_check">
	                                    <fieldset>
	                                        <label>User name</label>
	                                        <input name="j_username" type="text" class="input-block-level" placeholder="User name">
	                                        <label>Password</label>
	                                        <input name="j_password" type="password" class="input-block-level" placeholder="">
	                                        <span class="help-block">Хэрэвээ та хараахан бүртгүүлээгүй бол <a href="#">энд</a> дарж бүргтгүүлнэ үү.</span>
	                                        <button type="submit" class="btn btn-large btn-like" style="width: 100%">Нэвтрэх</button>
	                                    </fieldset>
	                                </g:form>
                                	<div class="clear"></div>
                                <hr class="small">
                                <div class="social-form">
                                    <div class="connect-buttons">
                                        <form class="connect-button" name="login" method="post" action="#" id="twitter-connect-form">
                                            <a href="#" class="btn" id="twitter_button"><span>Log in with <strong>Twitter</strong></span></a>
                                        </form>
                                        <form class="connect-button" name="login" method="post" action="#" id="facebook-connect-form">
                                            <a href="#" class="btn" id="facebook_button"><span>Log in with <strong>Facebook</strong></span></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
	                        </sec:ifNotLoggedIn>    

                        </div>
                    </div>
                </div>
            </div>
        </div>
		%{-- <a href="#show-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ticket" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ticket">
			
				<g:if test="${ticketInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="ticket.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="user" action="show" id="${ticketInstance?.author?.id}">${ticketInstance?.author?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${ticketInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="ticket.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${ticketInstance}" field="title"/></span>
					
				</li>
				</g:if>

				<g:if test="${ticketInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="ticket.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${ticketInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="ticket.dateCreated.label" default="DateCreated" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ticketInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="ticket.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${ticketInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.objectStatus}">
				<li class="fieldcontain">
					<span id="objectStatus-label" class="property-label"><g:message code="ticket.objectStatus.label" default="Object Status" /></span>
					
						<span class="property-value" aria-labelledby="objectStatus-label"><g:fieldValue bean="${ticketInstance}" field="objectStatus"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ticketInstance?.id}" />
					<g:link class="edit" action="edit" id="${ticketInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div> --}%
		<div id="fb-root"></div>
<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=122933204547697";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=122933204547697";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
</script>
	</body>
</html>
