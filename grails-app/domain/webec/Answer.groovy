package webec

class Answer {

    static belongsTo = [question: Question]

    Boolean isCorrect
    String text

    @Override
    String toString() {
        return text
    }

    static constraints = {
        text blank: false
    }
}
