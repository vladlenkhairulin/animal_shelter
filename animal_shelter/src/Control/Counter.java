package Control;

public class Counter implements AutoCloseable {
    private int count;
    private boolean isOpen;

    public Counter() {
        this.count = 0;
        this.isOpen = true;
    }

    public void add() {
        if (!isOpen) {
            throw new IllegalStateException("Счётчик уже был закрыт.");
        }
        count++;
    }

    @Override
    public void close() {
        if (!isOpen) {
            throw new IllegalStateException("Счётчик уже был закрыт.");
        }
        isOpen = false;
    }


    public int getCount() {
        return count;
    }
}