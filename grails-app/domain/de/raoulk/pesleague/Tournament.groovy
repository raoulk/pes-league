package de.raoulk.pesleague

import java.util.List;

class Tournament {
	Date dateCreated
	
	boolean teamsSelected =false
	
	boolean finished = false
	
	static hasMany = [players: Player, matches: Match]

	static constraints = {  id generator: 'identity'  }

	def beforeInsert() {
		dateCreated = new Date()
	}
	
	void createMatches(){
		if (! matches) {
			matches = []
		}
		if (matches?.size() > 0) {
			return
		}
		
		for(awayPlayer in players){
			for(homePlayer in players){
				if (awayPlayer != homePlayer) {
					Match match = new Match(homePlayer: homePlayer, awayPlayer: awayPlayer)
					matches.add(match)
				}
			}
		}
	}
	
}
