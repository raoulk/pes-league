package de.raoulk.pesleague

import java.util.Date;

class Match {
	Date dateCreated

	Player homePlayer

	Player awayPlayer

	int scoreHome

	int scoreAway

	boolean finished = false

	static constraints = {
		id generator: 'identity'
		homePlayer(nullable:false)
		awayPlayer(nullable:false)
		scoreHome(nullabe:false, min:0)
		scoreAway(nullabe:false, min:0)
	}

	def beforeInsert() {
		dateCreated = new Date()
	}
}
