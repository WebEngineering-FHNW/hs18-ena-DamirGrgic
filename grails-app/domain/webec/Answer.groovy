package webec

class Answer {

    static belongsTo = [question: Question]

    Boolean isCorrect
    String text

    @Override
    String toString() {
        return text
    }

    int getAmountCorrectAnswers() {
        int count = 0;
        for(boolean b : answer.question.findAll()) {
            if(b.isCorrect == true) {
                count++;
            }
        }
    }
    static constraints = {
        text blank: false
    }
}
