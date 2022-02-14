public class Fibonacci {
    public static void main(String[] args) {
        //Vil finde det sjette fibonacci nummer
        int n = 5;


        System.out.println(fibonacci(n));
    }

    //da vi skal returnere noget går det ikke at det bliver en void funktion
    private static long fibonacci(int n) {

        //Her har vi en base case som sikrer at det ikke bliver et infinite recursive method
        if(n <= 1){
            return n;
        }
        //Vores fibonacci udregning
        return(fibonacci(n - 1) + fibonacci(n-2));

    }
}
