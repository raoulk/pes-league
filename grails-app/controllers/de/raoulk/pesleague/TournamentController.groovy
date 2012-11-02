package de.raoulk.pesleague

import org.springframework.dao.DataIntegrityViolationException

import de.raoulk.pesleague.beans.Table
import de.raoulk.pesleague.beans.Team

class TournamentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tournamentInstanceList: Tournament.list(params), tournamentInstanceTotal: Tournament.count()]
    }

    def create() {
        [tournamentInstance: new Tournament(params)]
    }

    def save() {
        def tournamentInstance = new Tournament(params)
		List players = tournamentInstance.players
		List matches = createMatches(players)
		tournamentInstance.matches = matches
		
        if (!tournamentInstance.save(flush: true)) {
            render(view: "create", model: [tournamentInstance: tournamentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tournament.label', default: 'Tournament'), tournamentInstance.id])
        redirect(action: "show", id: tournamentInstance.id)
    }

    def show(Long id) {
        def tournamentInstance = Tournament.get(id)
        if (!tournamentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), id])
            redirect(action: "list")
            return
        }
		
		Table table = createTable(tournamentInstance);
		
        [tournamentInstance: tournamentInstance, table:table]
    }

    def edit(Long id) {
        def tournamentInstance = Tournament.get(id)
        if (!tournamentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), id])
            redirect(action: "list")
            return
        }

        [tournamentInstance: tournamentInstance]
    }

    def update(Long id, Long version) {
        def tournamentInstance = Tournament.get(id)
        if (!tournamentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tournamentInstance.version > version) {
                tournamentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tournament.label', default: 'Tournament')] as Object[],
                          "Another user has updated this Tournament while you were editing")
                render(view: "edit", model: [tournamentInstance: tournamentInstance])
                return
            }
        }

        tournamentInstance.properties = params

        if (!tournamentInstance.save(flush: true)) {
            render(view: "edit", model: [tournamentInstance: tournamentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tournament.label', default: 'Tournament'), tournamentInstance.id])
        redirect(action: "show", id: tournamentInstance.id)
    }

    def delete(Long id) {
        def tournamentInstance = Tournament.get(id)
        if (!tournamentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), id])
            redirect(action: "list")
            return
        }

        try {
            tournamentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tournament.label', default: 'Tournament'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tournament.label', default: 'Tournament'), id])
            redirect(action: "show", id: id)
        }
    }
	
	private List createMatches(List players){
		List matches = []
		for(awayPlayer in players){
			for(homePlayer in players){
				if (awayPlayer != homePlayer) {
					Match match = new Match(homePlayer: homePlayer, awayPlayer: awayPlayer)
					matches.add(match)
				}
			}
		}
		return matches
	}
	
	private Table createTable(Tournament tournament){
		Table table = new Table()
		Map<String, Team> teamMap = [:]
		tournament.players.each{Player player ->
			teamMap[player.name] = new Team(name: player.name)
		}
		
		tournament.matches.each{Match match ->
			if(match.finished){
				def	home = match.homePlayer.name
				def away = match.awayPlayer.name
				def	goalsHome = match.scoreHome
				def	goalsAway = match.scoreAway
				
				teamMap.get(home).addScore(goalsHome, goalsAway)
				teamMap.get(away).addScore(goalsAway, goalsHome)
			}
		}
		List teams = teamMap.values().toList()
		
		teams.sort{teamA, teamB ->
			teamA.points = teamB.points ? 0 : teamA.points > teamB.points ? 1 : -1
		}
		table.teams = teams
		return table
	}
}
