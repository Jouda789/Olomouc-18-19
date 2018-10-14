package exercise1;

public class Point {	
	private double x;
	private double y;

	public Point(double x, double y) {
		this.x = x;
		this.y = y;
	}
	
	double distance(Point p) {
		return Math.sqrt(Math.pow(p.x - this.x, 2) + Math.pow(p.y - this.y, 2));
	}
	
	public double getX() {
		return x;
	}
	
	public double getY() {
		return y;
	}
}
