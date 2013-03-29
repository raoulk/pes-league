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
		def score = finished ? " $scoreHome:$scoreAway" : ""
		
		return homePlayer?.name + " - " + awayPlayer?.name +  score
	}

	int pointsHomePlayer(){
		return calculatePoints(scoreHome, scoreAway)
	}

	int pointsAwayPlayer() {
		return calculatePoints(scoreAway, scoreHome)
		
	}
	
	int calculatePoints(int a, int b){
		if (a > b) return 3
		if (b < a) return 0
		return 1

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
