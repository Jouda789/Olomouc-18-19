import java.util.Random;

public class Pole {
	
	private static int[] Arr;
	private static int velikost = 7;
	
	public static int[] Vytvor(){
	        Arr = new int[velikost];   
	        return Arr;
	    }

	public static int randomFill(){
        Random rand = new Random();
        int randomNum = rand.nextInt(70)-35;
        return randomNum;
    }
	 
	public static void Tisk(){
	        for(int i=0;i<velikost;i++){
	            System.out.print(Arr[i]+" ");
	        }
	        System.out.println();
	    }
	//zde jde napsat for loop zkracene pomoci dvojtecky
	
	public static void Projdi(int[] arr) {
		
		int min = arr[0];
		int max = arr[0];
		
		for(int i = 0; i < arr.length; i++){
			if (arr[i]>max) max = arr[i];
			if (arr[i]<min) min = arr[i];
		}
		System.out.println("Nejmensi:  " + min);
		System.out.print("Nejvetsi:  " + max);
	}
	
	public static void main(String[] args) {
		
		Vytvor();
		for(int i = 0; i < Arr.length; i++){
            Arr[i] = randomFill();
        }
        Tisk();
        Projdi(Arr);
	}

}