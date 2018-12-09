package webec

class LecturerController {

    def index() {
        render view: "index", model: [quizrooms: QuizService.getQuizzes()]
    }
}
