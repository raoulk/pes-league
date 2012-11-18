
<%@ page import="de.raoulk.pesleague.Tournament" %>
<%@ page import="de.raoulk.pesleague.beans.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tournament.label', default: 'Tournament')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tournament" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tournament" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tournament">
			
				<g:if test="${tournamentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="tournament.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${tournamentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tournamentInstance?.finished}">
				<li class="fieldcontain">
					<span id="finished-label" class="property-label"><g:message code="tournament.finished.label" default="Finished" /></span>
					
						<span class="property-value" aria-labelledby="finished-label"><g:formatBoolean boolean="${tournamentInstance?.finished}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${matchesFinished}">
				<li class="fieldcontain">
					<span id="matches-label" class="property-label"><g:message code="tournament.matches.label" default="Matches played" /></span>
					
						<g:each in="${matchesFinished}" var="m" >
						<span class="property-value" aria-labelledby="matches-label"><g:link controller="match" action="edit" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				<g:if test="${matchesNotFinished}">
				<li class="fieldcontain">
					<span id="matches-label" class="property-label"><g:message code="tournament.matches.label" default="Matches to play" /></span>
					
						<g:each in="${matchesNotFinished}" var="m" >
						<span class="property-value" aria-labelledby="matches-label"><g:link controller="match" action="edit" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>			
				<g:if test="${tournamentInstance?.players}">
				<li class="fieldcontain">
					<span id="players-label" class="property-label"><g:message code="tournament.players.label" default="Players" /></span>
					
						<g:each in="${tournamentInstance.players}" var="p">
						<span class="property-value" aria-labelledby="players-label"><g:link controller="player" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tournamentInstance?.id}" />
					<g:link class="edit" action="edit" id="${tournamentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		
		<div id="table">
			<h1><g:message default="Tabelle" /></h1>
			<table>
				<thead>
					<tr>
					<th>Team</th><th>Spiele</th><th>Sieg</th><th>Unent.</th><th>Niederl.</th><th>Tore</th><th>GGTore</th><th>Pkt.</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${table.teams}" status="i" var="team">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${team.name}</td>
						<td>${team.numberOfGames}</td>
						<td>${team.won}</td>
						<td>${team.drawn}</td>
						<td>${team.lost}</td>
						<td>${team.goalsShot}</td>
						<td>${team.goalsConceded}</td>
						<td>${team.points}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		
		</div>
	</body>
</html>
