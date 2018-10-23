import java.util.Calendar;
import java.util.Date;

class Main {
  public static void main(String[] args) {
      Calendar cal = Calendar.getInstance();
      Date currentdate = new Date();
      cal.setTime(currentdate);
      int week = cal.get(Calendar.WEEK_OF_YEAR); 
      System.out.println(week);
      System.out.println(week % 2 == 0 ? "Even" : "Odd");
      }
}
