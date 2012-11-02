<%@ page import="de.raoulk.pesleague.Player" %>



<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="player.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${playerInstance?.name}"/>
</div>


</div>

