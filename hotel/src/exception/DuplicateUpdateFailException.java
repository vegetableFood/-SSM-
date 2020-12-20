package exception;

public class DuplicateUpdateFailException extends Exception {

    public DuplicateUpdateFailException(String message) {
        super(message);
    }

    public DuplicateUpdateFailException(Throwable cause) {
        super(cause);
    }

    public DuplicateUpdateFailException(String message, Throwable cause) {
        super(message, cause);
    }
}
