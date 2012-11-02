
<%@ page import="de.raoulk.pesleague.Match" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-match" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-match" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="match.homePlayer.label" default="Home Player" /></th>
					
						<th><g:message code="match.awayPlayer.label" default="Away Player" /></th>
					
						<g:sortableColumn property="scoreHome" title="${message(code: 'match.scoreHome.label', default: 'Score Home')}" />
					
						<g:sortableColumn property="scoreAway" title="${message(code: 'match.scoreAway.label', default: 'Score Away')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'match.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="finished" title="${message(code: 'match.finished.label', default: 'Finished')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${matchInstanceList}" status="i" var="matchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${matchInstance.id}">${fieldValue(bean: matchInstance, field: "homePlayer")}</g:link></td>
					
						<td>${fieldValue(bean: matchInstance, field: "awayPlayer")}</td>
					
						<td>${fieldValue(bean: matchInstance, field: "scoreHome")}</td>
					
						<td>${fieldValue(bean: matchInstance, field: "scoreAway")}</td>
					
						<td><g:formatDate date="${matchInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${matchInstance.finished}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${matchInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
