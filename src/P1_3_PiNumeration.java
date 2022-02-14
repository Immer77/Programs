public class P1_3_PiNumeration {
    public static void main(String[] args) {
        final double limit = 3.141592;
        double sum=0;
        double sign=1.0;
        for(int i =1;i<=limit;i+=2)
        {
            sum+=sign/i;
            sign*=-1;
        }
    }
}
