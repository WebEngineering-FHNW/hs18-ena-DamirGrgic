package webec

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured
import webec.SecRole

@Secured(SecRole.ADMIN)

class StudentAnswerController {

    StudentAnswerService studentAnswerService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond studentAnswerService.list(params), model:[studentAnswerCount: studentAnswerService.count()]
    }

    def show(Long id) {
        respond studentAnswerService.get(id)
    }

    def create() {
        respond new StudentAnswer(params)
    }

    def save(StudentAnswer studentAnswer) {
        if (studentAnswer == null) {
            notFound()
            return
        }

        try {
            studentAnswerService.save(studentAnswer)
        } catch (ValidationException e) {
            respond studentAnswer.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), studentAnswer.id])
                redirect studentAnswer
            }
            '*' { respond studentAnswer, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond studentAnswerService.get(id)
    }

    def update(StudentAnswer studentAnswer) {
        if (studentAnswer == null) {
            notFound()
            return
        }

        try {
            studentAnswerService.save(studentAnswer)
        } catch (ValidationException e) {
            respond studentAnswer.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), studentAnswer.id])
                redirect studentAnswer
            }
            '*'{ respond studentAnswer, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        studentAnswerService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAnswer.label', default: 'StudentAnswer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
