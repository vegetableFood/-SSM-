package exception;

public class DuplicateReserveIsNull extends Exception {
    public DuplicateReserveIsNull(String message) {
        super(message);
    }

    public DuplicateReserveIsNull(Throwable cause) {
        super(cause);
    }

    public DuplicateReserveIsNull(String message, Throwable cause) {
        super(message, cause);
    }
}
