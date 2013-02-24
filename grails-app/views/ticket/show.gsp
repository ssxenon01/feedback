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
                            %{-- <div class="media-box"><img src="http://d22r54gnmuhwmk.cloudfront.net/photos/8/dd/rg/cYDdrGzjakFdCUX-556x313-noPad.jpg" class="rounded-corners" width="600">
                            </div> --}%
                            <div class="media-content">
                                <h1 class="title">${ticketInstance.title}</h1>
                                <p>${ticketInstance.content}</p>
                                <div class="date"><strong>Огноо:</strong>
                                	<g:formatDate formatName="date.long" date="${ticketInstance.dateCreated}"/></div>
                                <div class="tag clearfix">
                                	 <g:each in="${ticketInstance.tags}" var="tag">
                                	 	<a href="#"><i class="icon-tag"></i>${fieldValue(bean: tag, field: "label")}</a>
								    </g:each>
                                </div>
                                <div class="like-num">
                                    <div class="row">
                                        <div class="span4">
                                            <h4><g:formatDate formatName="date.short" date="${ticketInstance.dateCreated}"/> ны дотор хураах саналын хэмжээ</h4>
                                            <div class="count diff-vote">${ticketInstance.maxVote-ticketInstance.vote}</div>
                                        </div>
                                        <div class="span3">
                                            <h4>Нийт Санал</h4>
                                            <div class="count vote-count">${ticketInstance.vote}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="social-form">
                                        <div class="connect-buttons clearfix">
                                            <div class="pull-left">
                                                <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>
                                            </div>
                                            <div class="pull-left">
                                                <div class="fb-like" data-href="<g:createLink controller="ticket" action="show" id="${ticketInstance.id}" absolute="true" />" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                                            </div>
                                        </div>

                                    <div class="facebook-comment">
                                        <div class="fb-comments" data-href="<g:createLink controller="ticket" action="show" id="${ticketInstance.id}" absolute="true" />" data-width="580" data-num-posts="10"></div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="span4" style="position: relative">
                        <div class="petition-box">
                            <div class="inner">
                                <div class="petition-box-head">
                                    %{-- <h4 class="">Энэ сана</h4> --}%
                                    <div id="with-supporters">
                                            <div class="vote-count">${ticketInstance.vote}</div>
                                            <button class="form-submit btn ${ticketInstance.getVoted()?"disabled":"btn-like"} vote-action-single" tID="${ticketInstance.id}">Энэ саналыг дэмжих</button>
                                    </div>
                                    <div class="clear"></div>
                                    <div class="pet-graph">
                                        <div class="thermometer" style="">
                                            <div class="mercury" style="width: ${(ticketInstance.vote/ticketInstance.maxVote)*100}%"></div>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="count pull-right">&nbsp;ДУТУУ</div>
                                    <div class="count pull-right diff-vote">${ticketInstance.maxVote - ticketInstance.vote}</div>
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
$(function(){
	$(window).scroll(function(data){
		$('div.petition-box').css('top',$(window).scrollTop()+'px');
	});
});
</script>
	</body>
</html>
