package de.raoulk.pesleague.domain

import java.util.Date;

class Player {
	Date dateCreated
	String name
	
	static hasMany = [homeMatches:Match, tournaments:Tournament, awayMatches:Match]
	static mappedBy = [homeMatches: "homePlayer", awayMatches: "awayPlayer"]
	
    static constraints = {
		id generator: 'identity'
		name nullable:false
    }
	
	def beforeInsert() {
		dateCreated = new Date()
	}
}
