public class E1_3_kapital {
    public static void main(String[] args) {
        int years = 3;
        double kapital = 1000;
        final double rente = 1.05;

        for (int i = 0; i < years; i++) {
            System.out.println(kapital*(Math.pow(rente, i)));
        }
    }
}
