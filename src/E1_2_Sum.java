public class E1_2_Sum {
    public static void main(String[] args) {
        System.out.println(1+2+3+4+5+6+7+8+9+10);
        System.out.println(1*2*3*4*5*6*7*8*9*10);
        int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9 ,10};
        int sum = 0;
        for (int i = 0; i < numbers.length; i++) {
            sum+=numbers[i];
        }
        System.out.println(sum);
    }
}
