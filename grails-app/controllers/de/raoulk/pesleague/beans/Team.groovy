package de.raoulk.pesleague.beans

class Team {
	int name
	int numberOfGames
	int won
	int drawn
	int lost
	int goalsShot
	int goalsConceded
	int points
	
	int goalDiff(){
		return goalsShot - goalsConceded
	}
}
