package webec

class Question {

    String questionText

    static belongsTo = [quiz: Quiz]
    static hasMany = [answers: Answer]

    @Override
    String toString() {
        return questionText
    }

    static constraints = {
        questionText blank:false, nullable: false;
    }
}
