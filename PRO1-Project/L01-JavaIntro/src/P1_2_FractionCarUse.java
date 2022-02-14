import java.util.Scanner;

public class P1_2_FractionCarUse {
    public static void main(String[] args) {
        String personalDrive;
        String workDrive;
        int workdays = 5;
        double result1, result2, result3;

        Scanner myObj = new Scanner(System.in);

        System.out.println("Vi tager udgangspunkt i at du har 5 arbejdsdage");
        System.out.println("Enter Personal Drive");
        personalDrive = myObj.nextLine();
        double pDrive = Double.parseDouble(personalDrive);

        System.out.println("Enter Workdrive");
        workDrive = myObj.nextLine();
        double wDrive = Double.parseDouble(workDrive);

        result1 = workdays * pDrive;
        result2 = workdays * wDrive;
        result3 = result1 + result2;
        System.out.println("Der bliver i alt kørt: " + result3 + "km hvor arbejdskørsel udgør:" + (result3 - result1));

        /*
        try {
            int result = Integer.parseInt(workdays);
            if(result / 2 == 1){
                System.out.println("A");
            }
        } catch (Exception exception){
            //
        }*/



    }
}
