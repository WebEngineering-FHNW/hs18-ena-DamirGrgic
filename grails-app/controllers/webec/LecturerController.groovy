package webec

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class LecturerController {

    LecturerService lecturerService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond lecturerService.list(params), model:[lecturerCount: lecturerService.count()]
    }

    def loggedInLecturer(Lecturer lecturer) {
        if (lecturer.getLoginState() == true) {
            render(view: "lecturerPanel", model: [lecturer: lecturer])
        }
        else {
            render(view: "lecturerLogin")
        }
    }

    def redirectToIndex(Lecturer lecturer) {
        def currentLecturer = lecturer

        redirect(view:"index")
    }

    def checkLogin(String name, String password) {

        String userName = params.name
        String userPassword = params.password

        if (userName != null && userPassword != null) {
            if (!(userName.isEmpty() && userPassword.isEmpty())) {
                log.info "name is " + name
                log.info "password is " + password

                def l = new Lecturer(name: userName, password: userPassword)
                l.save()
                l.setLogin(true)
                loggedInLecturer(l)

                // render(view: "lecturerPanel")
            }
            else {
                log.info "inputs empty"
            }
        }
        else {

        }
    }

    def redirectToLogin() {
        render(view: "lecturerLogin");
    }

    def show(Long id) {
        respond lecturerService.get(id)
    }

    def create() {
        respond new Lecturer(params)
    }

    def save(Lecturer lecturer) {
        if (lecturer == null) {
            notFound()
            return
        }

        try {
            lecturerService.save(lecturer)
        } catch (ValidationException e) {
            respond lecturer.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'lecturer.label', default: 'Lecturer'), lecturer.id])
                redirect lecturer
            }
            '*' { respond lecturer, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond lecturerService.get(id)
    }

    def update(Lecturer lecturer) {
        if (lecturer == null) {
            notFound()
            return
        }

        try {
            lecturerService.save(lecturer)
        } catch (ValidationException e) {
            respond lecturer.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'lecturer.label', default: 'Lecturer'), lecturer.id])
                redirect lecturer
            }
            '*'{ respond lecturer, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        lecturerService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'lecturer.label', default: 'Lecturer'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lecturer.label', default: 'Lecturer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
