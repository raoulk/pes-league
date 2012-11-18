import de.raoulk.pesleague.Player
import de.raoulk.pesleague.Tournament;

class BootStrap {

    def init = { servletContext ->
		Player raoul = new Player(name: 'Steyn')
		Player olt = new Player(name: 'Olt')
		Player peez = new Player(name: 'Peez')
		raoul.save()
		olt.save()
		peez.save()
		
		Tournament tournament = new Tournament()
		tournament.addToPlayers(olt)
		tournament.addToPlayers(raoul)
		tournament.addToPlayers(peez)
		
		tournament.createMatches()
		tournament.save()
    }
    def destroy = {
    }
}
