package de.raoulk.pesleague

import org.springframework.dao.DataIntegrityViolationException

class MatchController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [matchInstanceList: Match.list(params), matchInstanceTotal: Match.count()]
    }

    def create() {
        [matchInstance: new Match(params)]
    }

    def save() {
        def matchInstance = new Match(params)
		matchInstance.finished = true
        if (!matchInstance.save(flush: true)) {
            render(view: "create", model: [matchInstance: matchInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'match.label', default: 'Match'), matchInstance.id])
		redirect(action: "show", id: matchInstance.id)
    }

    def show(Long id) {
        def matchInstance = Match.get(id)
        if (!matchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), id])
            redirect(action: "list")
            return
        }

        [matchInstance: matchInstance]
    }

    def edit(Long id) {
        def matchInstance = Match.get(id)
        if (!matchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), id])
            redirect(action: "list")
            return
        }

        [matchInstance: matchInstance]
    }

    def update(Long id, Long version) {
        def matchInstance = Match.get(id)
        if (!matchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (matchInstance.version > version) {
                matchInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'match.label', default: 'Match')] as Object[],
                          "Another user has updated this Match while you were editing")
                render(view: "edit", model: [matchInstance: matchInstance])
                return
            }
        }

        matchInstance.properties = params
		matchInstance.finished = true

        if (!matchInstance.save(flush: true)) {
            render(view: "edit", model: [matchInstance: matchInstance])
            return
        }
		
		Tournament tournament = Tournament.find("from Tournament as t where ? in elements(t.matches)", matchInstance)
		
		if (tournament) {
			redirect(controller: 'tournament', action: 'show', id: tournament.id)
		}else {
	        flash.message = message(code: 'default.updated.message', args: [message(code: 'match.label', default: 'Match'), matchInstance.id])
	        redirect(action: "show", id: matchInstance.id)
		}
    }

    def delete(Long id) {
        def matchInstance = Match.get(id)
        if (!matchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'match.label', default: 'Match'), id])
            redirect(action: "list")
            return
        }

        try {
            matchInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'match.label', default: 'Match'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'match.label', default: 'Match'), id])
            redirect(action: "show", id: id)
        }
    }
}
