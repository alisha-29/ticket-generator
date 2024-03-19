import java.util.Arrays;

import java.util.Arrays;

import java.util.Arrays;

import java.util.Arrays;

public class Ticket {
    private int[][] grid;

    public Ticket(int numRows, int numCols) {
        grid = new int[numRows][numCols];
    }

    public void setCellValue(int row, int col, int value) {
        grid[row][col] = value;
    }

    public boolean isCellFilled(int row, int col) {
        return grid[row][col] != 0;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (int[] row : grid) {
            for (int cell : row) {
                sb.append(cell == 0 ? " \t" : cell + "\t");
            }
            sb.append("\n");
        }
        return sb.toString();
    }
}





