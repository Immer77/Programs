package eksempelcar.eksempelcar;

public class CarApp {

	public static void main(String[] args) {
		Car myCar = new Car("VW UP", "White");
		System.out.println(myCar.getBrand());
		myCar.setRegistrationNumber("AB 11 123");
		System.out.println(myCar.getRegistrationNumber());
		myCar.setKm(300);
		System.out.println(myCar.getKm());

		Car newCar = new Car("Hyundai I10", "Metal");
		System.out.println(newCar.getBrand());
		newCar.setRegistrationNumber("CV 52 552");
		System.out.println(newCar.getRegistrationNumber());
		newCar.setKm(100000);
		System.out.println(newCar.getKm());

		System.out.println("**************************************************************************");
		System.out.println("Din " + newCar.getBrand() + " har kørt " + newCar.getKm() + " og har et registreringsnummer på " + newCar.getRegistrationNumber());
		System.out.println("**************************************************************************");


	}

}
