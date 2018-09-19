public class Obrazec2 {

	public static void main(String[] args) {
		int prom = 10;
		int citac = 1;

		for(int i = 1;i<=prom-1;i++) {
			
			for(int j = 1;j<=prom*prom;j++) {
				
			   if (j%prom==0) {
				   System.out.print("*");
			   } else if (j % (prom*citac - i+1) == 0) {
				   System.out.print("*"); 
				   citac++;
			   } else { 
				   System.out.print(" ");
			   }
			   
		    }
			
			System.out.println();
			citac = 1;
		}
		
		for (int i = 1;i<=prom*prom;i++) {
			if (i%prom==0 || i==1) 
				System.out.print("*");
			else 
				System.out.print(" ");}
	}

}