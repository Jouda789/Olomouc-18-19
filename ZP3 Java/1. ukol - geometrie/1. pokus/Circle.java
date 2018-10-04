package exercise1;

public class Circle {
	private Point center;
	private double radius;
	private double area;
	
	public Circle(Point center, double radius) {
		this.center = center;
		this.radius = radius;
		this.setArea();
	}
	
	public void setArea() {
		this.area = Math.PI * Math.pow(this.radius, 2);
	}
	
	public double getArea() {
		return area;
	}
	
	public double distance(Point a) { 
		return Math.sqrt(Math.pow(center.distance(a), 2) - Math.pow(radius, 2));		
	} //vraci vzdalenost tecny od stredu kruhu
}
