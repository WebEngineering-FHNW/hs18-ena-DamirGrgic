package webec

class Answer {

    static belongsTo = [question: Question]

    Boolean isCorrect
    // Boolean selected
    String text

    @Override
    String toString() {
        return text
    }

    Long getSelected(Answer answer) {
        return answer.id
    }

    void markCorrect(Boolean correct) {
        this.isCorrect = correct
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
