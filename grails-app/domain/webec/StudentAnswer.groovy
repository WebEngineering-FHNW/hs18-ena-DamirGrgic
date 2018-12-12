package webec

class StudentAnswer {

    static belongsTo = [student: Student]

    Long questionID
    Long answerID

    StudentAnswer(Long questID, Long answID, Student stu){
        questionID = questID
        answerID = answID
        student = stu
    }

    static constraints = {
    }
}
