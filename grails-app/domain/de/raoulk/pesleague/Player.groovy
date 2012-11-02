package de.raoulk.pesleague

import java.util.Date;

class Player {
	Date dateCreated
	String name

	static hasMany = [homeMatches:Match, awayMatches:Match]
	static mappedBy = [homeMatches: "homePlayer", awayMatches: "awayPlayer"]

	String toString(){
		return name;
	}

	static constraints = {
		id generator: 'identity'
		name nullable:false
	}

	def beforeInsert() {
		dateCreated = new Date()
	}
}
