import java.lang.Math;

public class TwinPrimes {
	
  public static boolean SpoctiPrime(int a) {
    double mez1 = Math.sqrt(a);
    long mez = Math.round(mez1);
    for (int i = 2; i <= mez; i++) {
      if (a % i == 0)
        return false;
    }
    return true;
  }

  public static void Spocti(int a) {
    for (int i = 2; i < a; i++) {
      if (SpoctiPrime(i) && SpoctiPrime(i + 2))
        System.out.println("[" + i + "," + (i + 2) + "]");
    }
  }

  public static void main(String[] args) {
    Spocti(1000);
  }
}