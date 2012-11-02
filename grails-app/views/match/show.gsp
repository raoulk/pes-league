
<%@ page import="de.raoulk.pesleague.Match" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-match" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-match" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list match">
			
				<g:if test="${matchInstance?.homePlayer}">
				<li class="fieldcontain">
					<span id="homePlayer-label" class="property-label"><g:message code="match.homePlayer.label" default="Home Player" /></span>
					
						<span class="property-value" aria-labelledby="homePlayer-label"><g:link controller="player" action="show" id="${matchInstance?.homePlayer?.id}">${matchInstance?.homePlayer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.awayPlayer}">
				<li class="fieldcontain">
					<span id="awayPlayer-label" class="property-label"><g:message code="match.awayPlayer.label" default="Away Player" /></span>
					
						<span class="property-value" aria-labelledby="awayPlayer-label"><g:link controller="player" action="show" id="${matchInstance?.awayPlayer?.id}">${matchInstance?.awayPlayer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.scoreHome}">
				<li class="fieldcontain">
					<span id="scoreHome-label" class="property-label"><g:message code="match.scoreHome.label" default="Score Home" /></span>
					
						<span class="property-value" aria-labelledby="scoreHome-label"><g:fieldValue bean="${matchInstance}" field="scoreHome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.scoreAway}">
				<li class="fieldcontain">
					<span id="scoreAway-label" class="property-label"><g:message code="match.scoreAway.label" default="Score Away" /></span>
					
						<span class="property-value" aria-labelledby="scoreAway-label"><g:fieldValue bean="${matchInstance}" field="scoreAway"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="match.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${matchInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchInstance?.finished}">
				<li class="fieldcontain">
					<span id="finished-label" class="property-label"><g:message code="match.finished.label" default="Finished" /></span>
					
						<span class="property-value" aria-labelledby="finished-label"><g:formatBoolean boolean="${matchInstance?.finished}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${matchInstance?.id}" />
					<g:link class="edit" action="edit" id="${matchInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
