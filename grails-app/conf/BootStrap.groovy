import de.raoulk.pesleague.Player
import de.raoulk.pesleague.Tournament;

class BootStrap {

	def init = { servletContext ->
		Tournament tournament = new Tournament()
		
		for(playerName in ['Steyn','Olt','Peez']){
			Player player = new Player(name: playerName)
			player.save()
			tournament.addToPlayers(player)
		}
		
		tournament.createMatches()
		tournament.save()
	}

	def destroy = {
	}
}
