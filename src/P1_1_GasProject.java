public class P1_1_GasProject {
    public static void main(String[] args) {
        int gas = 4;
        double cMaintence = 1.05;
        int trainTicket = 10;

        for (int miles = 0; miles <= trainTicket; miles++) {
            if((gas*(miles*cMaintence) < trainTicket))
            {
                System.out.println("Det er billigere at tage bilen når du kun kører " + miles + " miles");
            }
            else{
                System.out.println("Det er bedre at tage toget når du kører " + miles + " miles");
            }
        }
    }
}
