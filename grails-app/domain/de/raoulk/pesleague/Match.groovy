package de.raoulk.pesleague

import java.util.Date;

class Match {
	Date dateCreated

	Player homePlayer

	Player awayPlayer

	int scoreHome = 0

	int scoreAway = 0

	boolean finished = false
	
	String toString() {
		return homePlayer?.name + "-" + awayPlayer?.name + "  " + scoreHome + ":" + scoreAway
	}

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
