package de.raoulk.pesleague.domain

class Tournament {
	Date dateCreated

	static hasMany = [players: Player, matches: Match]

	static constraints = { 
		id generator: 'identity' 
		}

	def beforeInsert() {
		dateCreated = new Date()
	}
}
