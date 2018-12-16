package webec

import grails.util.Environment
import webec.SecRole
import webec.SecUser
import webec.SecUserSecRole
import webec.Question
import webec.Quiz
import webec.Answer

class BootStrap {


    def init = { servletContext ->

        SecRole adminRole = save(SecRole.findOrCreateWhere(authority: SecRole.ADMIN))
        SecRole guestRole = save(SecRole.findOrCreateWhere(authority: SecRole.GUEST))


        SecUser guest  = save(new SecUser(username: 'guest', password: 'guest'))
        SecUserSecRole.create(guest, guestRole, true)

        if(Environment.current != Environment.DEVELOPMENT) { // guard clause
            return;
        }

        SecUser testUser  = save(new SecUser(username: 'me', password: 'toobad'))
        SecUserSecRole.create(testUser, adminRole, true) //flush
        // plausibility check
        assert SecRole.count()          == 2
        assert SecUser.count()          == 2
        assert SecUserSecRole.count()   == 2


        Lecturer damir = save(new Lecturer(name: 'Damir'))

        Quiz quiz = save(new Quiz(roomName: 'Test quiz'))

        Question q1 = save(new Question(questionText: "How was it", quiz: quiz))
        Question q2 = save(new Question(questionText: "Who is it", quiz: quiz))

        Answer a1 = save(new Answer(text: "Very good", isCorrect: true, question: q1))
        Answer a2 = save(new Answer(text: "Decent", isCorrect: false, question: q1))
        Answer a3 = save(new Answer(text: "Not so great", isCorrect: false, question: q1))
        Answer a4 = save(new Answer(text: "Terrible", isCorrect: false, question: q1))
        Answer a5 = save(new Answer(text: "Yes", isCorrect: true, question: q2))
        Answer a6 = save(new Answer(text: "No", isCorrect: false, question: q2))

    }

    static save(domainObject) {
        domainObject.save(failOnError: true, flush:true)
    }

    def destroy = {
    }
}
