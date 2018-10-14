package exercise1;

public class Vector {
	private double x;
	private double y;
	
	public Vector(Point a, Point b) {
		this.x = b.getX() - a.getX();
		this.y = b.getY() - a.getY();
	}

	public double getX() {
		return x;
	}
	
	public double getY() {
		return y;
	}	
}