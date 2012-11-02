package de.raoulk.pesleague.domain

import java.util.Date;

class Match {
	Date dateCreated

	Player homePlayer

	Player awayPlayer

	int scoreHome

	int scoreAway
	
	boolean finished = false

	static constraints = { id generator: 'identity' }

	def beforeInsert() {
		dateCreated = new Date()
	}
}
