package webec

import grails.validation.ValidationErrors
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured
import webec.SecRole

@Secured(SecRole.ADMIN)

class AnswerController {

    AnswerService answerService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond answerService.list(params), model:[answerCount: answerService.count()]
    }

    def show(Long id) {
        respond answerService.get(id)
    }

    def create() {
        respond new Answer(params)
    }
    def saveAndCreateNewAnswer(Answer answer){
        if (answer == null) {
            notFound()
            return
        }

        try {
            answerService.save(answer)
        } catch (ValidationException e) {
            respond answer.errors, view:'create'
            return
        }

        redirect(controller: "Answer", action: "create", params: ["question.id": answer.question.id])
    }

    def saveAndCreateNewQuestion(Answer answer){
        if (answer == null) {
            notFound()
            return
        }

        try {
            answerService.save(answer)
        } catch (ValidationException e) {
            respond question.errors, view:'create'
            return
        }

        redirect(controller: "Question", action: "create", params: ["quiz.id": answer.question.quiz.id])
    }

    def saveAndFinalize(Answer answer){
        if (answer == null) {
            notFound()
            return
        }

        try {
            answerService.save(answer)
        } catch (ValidationException e) {
            respond question.errors, view:'create'
            return
        }



        if(answer.question.findAll().contains(answer.getIsCorrect() == true)) {
            log.info("memes")
            request.withFormat {
                form multipartForm {
                    redirect (uri:"/quiz/show/${answer.question.quiz.id}")
                }
            }

        }
        else {
            // throw new ValidationException("At least one answer has to be correct")

            System.out.println("by answer.isCorrect " + answer.findAll( {
                answer.getIsCorrect() == true
            }))
            System.out.println("by answer.question " + answer.question.findAll( {
                answer.getIsCorrect() == true
                System.out.println("inner print " + answer.where { answer.isCorrect == true})
                System.out.println("inner print 2 " + answer.where { answer.getIsCorrect() == true})
            }))
            System.out.println("find by all 1" + answer.where { id == 1 && answer.question.getIsCorrect() == true }.list())
            System.out.println("find by all 2" + answer.where { id == 1 && answer.isCorrect == true }.list())
            System.out.println("find by all 3" + answer.where { id == 1 && answer.getIsCorrect() == true }.list())

            redirect (uri:"/quiz/edit/${answer.question.quiz.id}")
        }

    }

    def save(Answer answer) {
        if (answer == null) {
            notFound()
            return
        }

        try {
            answerService.save(answer)
        } catch (ValidationException e) {
            respond answer.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer'), answer.id])
                redirect answer
            }
            '*' { respond answer, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond answerService.get(id)
    }

    def update(Answer answer) {
        if (answer == null) {
            notFound()
            return
        }

        try {
            answerService.save(answer)
        } catch (ValidationException e) {
            respond answer.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'answer.label', default: 'Answer'), answer.id])
                redirect answer
            }
            '*'{ respond answer, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        answerService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'answer.label', default: 'Answer'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
