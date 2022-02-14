public class RecursionTutorial {
    public static void main(String[] args) {

        //Kalder her metoden Sayhi og giver variablen count 3 fordi den skal sige hej 3 gange
        SayHi(3);


    }
    //Herunder har vi lavet vores recursive metode
    private static void SayHi(int count){

        //Den printer Hello ud
        System.out.println("Hello");

        //hvis count er mindre end 1 vil vi komme ind i denne if statement og det infinite recursive loop vil stoppe da vi har return
        if(count <= 1){
            return;
        }
        //Så længe count er højere end 1 vil der bliver sagt hej.
        SayHi(count - 1);
    }
}
