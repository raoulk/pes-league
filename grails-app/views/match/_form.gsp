<%@ page import="de.raoulk.pesleague.Match" %>



<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'homePlayer', 'error')} required">
	<label for="homePlayer">
		<g:message code="match.homePlayer.label" default="Home Player" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="homePlayer" name="homePlayer.id" from="${de.raoulk.pesleague.Player.list()}" optionKey="id" required="" value="${matchInstance?.homePlayer?.id}" optionValue="name" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'awayPlayer', 'error')} required">
	<label for="awayPlayer">
		<g:message code="match.awayPlayer.label" default="Away Player" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="awayPlayer" name="awayPlayer.id" from="${de.raoulk.pesleague.Player.list()}" optionKey="id" required="" value="${matchInstance?.awayPlayer?.id}" optionValue="name" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'scoreHome', 'error')} required">
	<label for="scoreHome">
		<g:message code="match.scoreHome.label" default="Score Home" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="scoreHome" type="number" min="0" value="${matchInstance.scoreHome}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'scoreAway', 'error')} required">
	<label for="scoreAway">
		<g:message code="match.scoreAway.label" default="Score Away" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="scoreAway" type="number" min="0" value="${matchInstance.scoreAway}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'finished', 'error')} ">
	<label for="finished">
		<g:message code="match.finished.label" default="Finished" />
		
	</label>
	<g:checkBox name="finished" value="${matchInstance?.finished}" />
</div>

