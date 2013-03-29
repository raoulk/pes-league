package de.raoulk.pesleague.beans

class Team implements Comparable<Team> {
	String name
	int numberOfGames = 0
	int won = 0
	int drawn = 0
	int lost = 0
	int goalsShot = 0
	int goalsConceded = 0
	int points = 0

	int goalDiff(){
		return goalsShot - goalsConceded
	}

	void addScore(int shot, int conceded) {
		numberOfGames += 1
		goalsShot += shot
		goalsConceded += conceded

		if (shot > conceded) {
			won ++
			points +=3
		}
		else if (conceded > shot){
			lost ++
		}
		else {
			drawn ++
			points +=1
		}
	}

	@Override
	public int compareTo(Team other) {
		if (points > other.points) {
			return -1
		}
		else if (points < other.points) {
			return 1
		}
		// punktgleich
		else if (goalDiff() > other.goalDiff()) {
			return -1
		}
		else if (goalDiff() < other.goalDiff()) {
			return 1
		}
		else if (goalsShot > other.goalsShot) {
			return -1
		}
		else if (goalsShot < other.goalsShot) {
			return 1
		}

		return 0;
	}
}
