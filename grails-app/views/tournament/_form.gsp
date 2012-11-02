<%@ page import="de.raoulk.pesleague.Tournament" %>



<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'finished', 'error')} ">
	<label for="finished">
		<g:message code="tournament.finished.label" default="Finished" />
		
	</label>
	<g:checkBox name="finished" value="${tournamentInstance?.finished}" />
</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'matches', 'error')} ">
	<label for="matches">
		<g:message code="tournament.matches.label" default="Matches" />
		
	</label>
	<g:select name="matches" from="${de.raoulk.pesleague.Match.list()}" multiple="multiple" optionKey="id" size="5" value="${tournamentInstance?.matches*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'players', 'error')} ">
	<label for="players">
		<g:message code="tournament.players.label" default="Players" />
		
	</label>
	<g:select name="players" from="${de.raoulk.pesleague.Player.list()}" multiple="multiple" optionKey="id" size="5" value="${tournamentInstance?.players*.id}" class="many-to-many"/>
</div>

