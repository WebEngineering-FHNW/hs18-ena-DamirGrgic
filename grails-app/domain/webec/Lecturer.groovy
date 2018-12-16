package webec

class Lecturer {

    String name

    // String password
    boolean isLoggedIn = false

    Lecturer(String name) {
        this.name = name
    }

    Lecturer(String name, String password) {
        this.name = name
        this.password = password
    }

    @Override
    String toString() {
        return name
    }

    void setLogin(boolean loginState) {
        this.isLoggedIn = loginState
    }

    boolean getLoginState() {
        return this.isLoggedIn
    }

    int getAmountQuizzes() {
        return quizzes.size()
    }

    static constraints = {
        name blank:false, nullable: false, unique:true
        // password blank:false, nullable: false
    }
}
