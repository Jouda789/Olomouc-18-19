package exercise1;

public class Main {
	public static void main(String[] args) {
		Point p = new Point(1, 2);
		Line l = new Line(new Point(1, 3), new Point(2, 0));
		Rectangle r = new Rectangle(new Point(0, 0), new Point(2, 3));
		Square s = new Square(new Point(0, 0), 2);
		Circle c = new Circle(p, 4);
		
		System.out.println(p.distance(new Point(1, 1))); // sqrt(2);
		System.out.println(l.distance(new Point(4, 1))); // 2.21
		//System.out.println(r.distance(new Point(1, 6))); // 3
		//System.out.println(s.distance(new Point(1, 10)));
		System.out.println(s.getArea());                   // 4
		System.out.println(c.distance(new Point(7, 5))); //5.39
	}
}