package exception;

public class DuplicateUsernameNoExistException extends Exception {
    public DuplicateUsernameNoExistException() {
    }

    public DuplicateUsernameNoExistException(String message) {
        super(message);
    }

    public DuplicateUsernameNoExistException(Throwable cause) {
        super(cause);
    }

    public DuplicateUsernameNoExistException(String message, Throwable cause) {
        super(message, cause);
    }

}
