package exercise1;

public class Rectangle {
	protected Point a;
	protected Point b;
	protected Point c;
	protected Point d;
	protected double area;
	
	public Rectangle(Point a, Point c) {
		this.a = a;
		this.c = c;
		this.b = new Point(c.getX(), a.getY());
		this.d = new Point(a.getX(), c.getY());
		this.setArea();
	}
	
	public Rectangle(Point a, double height, double width) {
		this.a = a;
		this.b = new Point(a.getX() + width, a.getY());
		this.c = new Point(a.getX() + width, a.getY() + height);
		this.d = new Point(a.getX(), a.getY() + height);
		this.setArea();
	}
	
	private void setArea() {
		this.area = this.a.distance(this.b) * this.b.distance(this.c);
	}
	
	public double getArea() {
		return area;
	}
	
	public double distance(Point p) {
		double[] distancesOfLines = { 
				new Line(this.a, this.b).distance(p),
				new Line(this.b, this.c).distance(p),
				new Line(this.c, this.d).distance(p),
				new Line(this.d, this.a).distance(p), 
		};
		
		java.util.Arrays.sort(distancesOfLines);
		
		double[] distancesOfPoints = {
				p.distance(this.a),
				p.distance(this.b),
				p.distance(this.c),
				p.distance(this.d),			
		};
		
		java.util.Arrays.sort(distancesOfPoints);
		
		if (distancesOfPoints[0] > distancesOfLines[0]) {
			double h = distancesOfPoints[0];
			for(int k = 0; k < distancesOfLines.length; k++) { //tady by to slo prochazet lepe
				if (distancesOfLines[k] > h) return distancesOfLines[k];
				
			}
		} else 
			return distancesOfLines[0];
		
	}
}