
public class Obrazec {

	public static void main(String[] args) {

		int prom = 6;

		for(int i = 1;i<=prom-1;i++) {
			for(int j=1;j<=prom;j++) {
			   if((j==prom-i+1)||(j==prom)) {
				   System.out.print("*");
			   } else System.out.print(" ");
		    }
			System.out.println();
		}
		for(int i = 0;i<prom;i++) System.out.print("*");
	}
}
