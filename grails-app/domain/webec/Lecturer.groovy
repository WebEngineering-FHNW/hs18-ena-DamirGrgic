package webec

class Lecturer {

    String name
    String password

    @Override
    String toString() {
        return name
    }


    int getAmountQuizzes() {
        return quizzes.size()
    }

    static constraints = {
        name blank:false, nullable: false
        password blank:false, nullable: false
    }
}
