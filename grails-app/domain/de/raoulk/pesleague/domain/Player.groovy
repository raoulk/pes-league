package de.raoulk.pesleague.domain

class Player {

	String name
	
    static constraints = {
		id generator: 'identity'
    }
}
