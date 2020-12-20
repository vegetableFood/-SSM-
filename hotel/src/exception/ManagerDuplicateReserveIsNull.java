package exception;

public class ManagerDuplicateReserveIsNull extends Exception {
    public ManagerDuplicateReserveIsNull(String message) {
        super(message);
    }

    public ManagerDuplicateReserveIsNull(Throwable cause) {
        super(cause);
    }

    public ManagerDuplicateReserveIsNull(String message, Throwable cause) {
        super(message, cause);
    }
}
