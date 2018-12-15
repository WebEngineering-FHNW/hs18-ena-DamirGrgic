package webec

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class QuizController {

    QuizService quizService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond quizService.list(params), model:[quizCount: quizService.count()]
    }

    def show(Long id) {
        respond quizService.get(id)
    }

    def create() {
        respond new Quiz(params)
    }

    def save(Quiz quiz) {
        if (quiz == null) {
            notFound()
            return
        }

        try {
            quizService.save(quiz)
        } catch (ValidationException e) {
            respond quiz.errors, view:'create'
            return
        }

        if(quiz.findAll().contains(quiz.roomName)) {
            log.info("Quiz name already exists")
        } else {
            redirect(controller: "Question", action: "create", params: ["quiz.id": quiz.id])
        }
    }

    def saveAndRedirect(Quiz quiz){
        if (quiz == null) {
            notFound()
            return
        }

        try {
            quiz.save(quiz)
        } catch (ValidationException e) {
            respond quiz.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'quiz.label', default: 'Quiz'), quiz.id])
                redirect(uri:"/questionText/create?quiz.id=${quiz.getId()}")
            }
            '*' { respond quiz, [status: CREATED] }
        }
    }


    def edit(Long id) {
        respond quizService.get(id)
    }

    def update(Quiz quiz) {
        if (quiz == null) {
            notFound()
            return
        }

        try {
            quizService.save(quiz)
        } catch (ValidationException e) {
            respond quiz.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'quiz.label', default: 'Quiz'), quiz.id])
                redirect quiz
            }
            '*'{ respond quiz, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        quizService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'quiz.label', default: 'Quiz'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'quiz.label', default: 'Quiz'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
