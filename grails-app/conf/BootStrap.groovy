import de.raoulk.pesleague.Player
import de.raoulk.pesleague.Tournament;

class BootStrap {

    def init = { servletContext ->
		Player raoul = new Player(name: 'Steyn')
		Player olt = new Player(name: 'Olt')
		Player peez = new Player(name: 'Peez')
		Player jo = new Player(name: 'Jo')
		raoul.save()
		olt.save()
		peez.save()
		jo.save()
		
		Tournament tournament = new Tournament()
		tournament.addToPlayers(raoul)
		tournament.addToPlayers(jo)
		tournament.addToPlayers(peez)
		tournament.addToPlayers(olt)
		
		tournament.createMatches()
		tournament.save()
    }
    def destroy = {
    }
}
