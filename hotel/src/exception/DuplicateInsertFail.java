package exception;

public class DuplicateInsertFail extends Exception{
    public DuplicateInsertFail(String message) {
        super(message);
    }

    public DuplicateInsertFail(Throwable cause) {
        super(cause);
    }

    public DuplicateInsertFail(String message, Throwable cause) {
        super(message, cause);
    }
}
