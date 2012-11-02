package de.raoulk.pesleague.domain

class Tournament {
	Date dateCreated
	
	boolean finished = false

	static hasMany = [players: Player, matches: Match]

	static constraints = {  id generator: 'identity'  }

	def beforeInsert() {
		dateCreated = new Date()
	}
}
