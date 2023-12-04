import java.util.Scanner;
import java.io.*;

public class Main {

    public static void main(String[] args) {
        // Declare an ArrayList to store the integers
        ArrayList<Integer> arr = new ArrayList<>();

        // Read integers from the standard input until a negative number is encountered
        Scanner sc = new Scanner(System.in);
        int num;
        while ((num = sc.nextInt()) >= 0) {
            arr.add(num);
        }

        // Find the highest number in the array that is less than 100
        int highestNum = -1;
        for (int num : arr) {
            if (num < 100 && num > highestNum) {
                highestNum = num;
            }
        }

        // Print the highest number to the standard output
        if (highestNum != -1) {
            System.out.println(highestNum);
        }
    }
}