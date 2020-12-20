package exception;

public class DuplicatedeleteFail extends Exception{
    public DuplicatedeleteFail(String message) {
        super(message);
    }

    public DuplicatedeleteFail(Throwable cause) {
        super(cause);
    }

    public DuplicatedeleteFail(String message, Throwable cause) {
        super(message, cause);
    }
}
