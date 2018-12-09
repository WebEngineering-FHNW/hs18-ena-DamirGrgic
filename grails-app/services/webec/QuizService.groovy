package webec

import grails.gorm.transactions.Transactional

@Transactional
class QuizService {
    static allowedMethods = [getQuizzes: "POST"]
    def getQuizzes() {
        return Quizroom.getAll();
    }

    def serviceMethod() {

    }
}
