package de.raoulk.pesleague

class Tournament {
	Date dateCreated
	
	boolean teamsSelected =false
	
	boolean finished = false
	
	static hasMany = [players: Player, matches: Match]

	static constraints = {  id generator: 'identity'  }

	def beforeInsert() {
		dateCreated = new Date()
	}
}
