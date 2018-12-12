package webec

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class StudentAnswerServiceSpec extends Specification {

    StudentAnswerService studentAnswerService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new StudentAnswer(...).save(flush: true, failOnError: true)
        //new StudentAnswer(...).save(flush: true, failOnError: true)
        //StudentAnswer studentAnswer = new StudentAnswer(...).save(flush: true, failOnError: true)
        //new StudentAnswer(...).save(flush: true, failOnError: true)
        //new StudentAnswer(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //studentAnswer.id
    }

    void "test get"() {
        setupData()

        expect:
        studentAnswerService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<StudentAnswer> studentAnswerList = studentAnswerService.list(max: 2, offset: 2)

        then:
        studentAnswerList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        studentAnswerService.count() == 5
    }

    void "test delete"() {
        Long studentAnswerId = setupData()

        expect:
        studentAnswerService.count() == 5

        when:
        studentAnswerService.delete(studentAnswerId)
        sessionFactory.currentSession.flush()

        then:
        studentAnswerService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        StudentAnswer studentAnswer = new StudentAnswer()
        studentAnswerService.save(studentAnswer)

        then:
        studentAnswer.id != null
    }
}
