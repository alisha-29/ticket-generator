
import java.util.*;

public class TicketGenerator {
    private Random random = new Random();

    public Ticket generateTicket(int numRows, int numCols) throws HousieException {
        Ticket ticket = new Ticket(numRows, numCols);

        for (int col = 0; col < numCols; col++) {
            List<Integer> columnNumbers = generateUniqueNumbers(2, col * 10 + 1, (col + 1) * 10);
            if (columnNumbers.size() < 2) {
                throw new HousieException("Insufficient unique numbers in the column");
            }
            int numCells = random.nextInt(2) + 1; // Number of cells to fill in the column (1 or 2)
            Collections.shuffle(columnNumbers);
            for (int i = 0; i < Math.min(numCells, columnNumbers.size()); i++) {
                int num = columnNumbers.get(i);
                int row;
                do {
                    row = random.nextInt(numRows);
                } while (ticket.isCellFilled(row, col));
                ticket.setCellValue(row, col, num);
            }
        }

        return ticket;
    }

    private List<Integer> generateUniqueNumbers(int count, int min, int max) {
        List<Integer> numbers = new ArrayList<>();
        while (numbers.size() < count) {
            int num = random.nextInt(max - min + 1) + min;
            if (!numbers.contains(num)) {
                numbers.add(num);
            }
        }
        return numbers;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter the number of rows: ");
        int numRows = scanner.nextInt();
        System.out.print("Enter the number of columns: ");
        int numCols = scanner.nextInt();

        try {
            TicketGenerator generator = new TicketGenerator();
            Ticket ticket = generator.generateTicket(numRows, numCols);
            System.out.println(ticket);
        } catch (HousieException e) {
            System.err.println("Error generating ticket: " + e.getMessage());
        } finally {
            scanner.close(); // Close the scanner to prevent resource leak
        }
    }
}










