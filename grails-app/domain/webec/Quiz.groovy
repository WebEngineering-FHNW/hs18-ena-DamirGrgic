package webec

class Quiz {

    String roomName
    // Boolean status = false

    static hasMany = [questions: Question, students: Student]

    static mapping = {
        options cascade: 'all-delete-orphan'
    }

    @Override
    String toString() {
        return roomName
    }

    static constraints = {
        roomName blank: false, nullable: false, unique: true
    }

    void launchQuiz(Boolean bool) {
        this.status = bool
    }

    boolean isOpen() {
        return this.status
    }

    double getStudentAnswers(Answer answer){
        if(students.size() == 0){
            return 0
        }
        int a = StudentAnswer.findAll{
            questionID == answer.question.id && answerID == answer.id
        }.size()
        return (a / getStudentAmount()) * 100
    }

    int getStudentAmount() {
        return students.size()
    }



}
