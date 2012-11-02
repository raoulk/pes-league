
<%@ page import="de.raoulk.pesleague.Player" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-player" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-player" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list player">
			
				<g:if test="${playerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="player.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${playerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.awayMatches}">
				<li class="fieldcontain">
					<span id="awayMatches-label" class="property-label"><g:message code="player.awayMatches.label" default="Away Matches" /></span>
					
						<g:each in="${playerInstance.awayMatches}" var="a">
						<span class="property-value" aria-labelledby="awayMatches-label"><g:link controller="match" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="player.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${playerInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${playerInstance?.homeMatches}">
				<li class="fieldcontain">
					<span id="homeMatches-label" class="property-label"><g:message code="player.homeMatches.label" default="Home Matches" /></span>
					
						<g:each in="${playerInstance.homeMatches}" var="h">
						<span class="property-value" aria-labelledby="homeMatches-label"><g:link controller="match" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${playerInstance?.id}" />
					<g:link class="edit" action="edit" id="${playerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
