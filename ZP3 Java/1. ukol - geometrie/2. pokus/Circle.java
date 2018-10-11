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
		double segment = a.distance(this.center); //vzdalenost daneho bodu od stredu kruznice
		if (segment < this.radius) //bod je uvnitr kruznice
		return (this.radius - segment);		  
		else 
		return (segment - this.radius);	
		//nebo by to slo osetrit absolutni hodnotou misto podminky, ale tohle se mi zda prehlednejsi	
	}
}
