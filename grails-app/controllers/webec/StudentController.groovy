package webec

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured
import webec.SecRole

@Secured(SecRole.ADMIN)

class StudentController {

    StudentService studentService
    StudentAnswerService StudentAnswerService


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond studentService.list(params), model:[studentCount: studentService.count()]
    }

    def show(Long id) {
        // redirect(controller:"quiz", action: "show", params: [quiz: this.student.quiz])
        redirect(uri: "/quiz/index/")
    }

    def create() {
        respond new Student(params)
    }

    def save(Student student) {
        if (student == null) {
            notFound()
            return
        }

        try {
            /***
             * check for answers students filled out
             * exception thrown when no input
             * EXTERNAL CODE - From a friend who did this before and helped me out
             * To be honest, in the end he just let me take his code for this part
             */
            List<StudentAnswer> answers = new LinkedList<StudentAnswer>()

            student.quiz.questions.each{ question ->
                if((params["question_${question.id}_answer"]) == null){
                    throw new ValidationException("Please fill out all questions")
                }
                StudentAnswer p = new StudentAnswer(question.id, Long.parseLong(params["question_${question.id}_answer"]), student)
                answers.add(p)
            }
            for(StudentAnswer a : answers){
                studentAnswerService.save(a)
            }

            studentService.save(student)
        } catch (ValidationException e) {
            respond student.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'student.label', default: 'Student'), student.id])
                redirect student
            }
            '*' { respond student, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond studentService.get(id)
    }

    def update(Student student) {
        if (student == null) {
            notFound()
            return
        }

        try {
            studentService.save(student)
        } catch (ValidationException e) {
            respond student.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'student.label', default: 'Student'), student.id])
                redirect student
            }
            '*'{ respond student, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        studentService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'student.label', default: 'Student'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
