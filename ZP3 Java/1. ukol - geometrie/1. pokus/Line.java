package exercise1;

public class Line {
	private Point a;
	private Point b;
	private double length;
	
	public Line(Point a, Point b) {
		this.a = a;
		this.b = b;
		this.length = a.distance(b);
	}
	
	double distance(Point p) {			
		double dist = 0;
		
		// bod A[x1,x2], primka p: ax + by + c = 0;
		// |A,p|= abs(a*x1 + b*x2 + c)/sqrt(a^2+b^2);
		
		//smerovy vektor primky p: (a.x - b.x,a.y - b.y); implementovano v tride Vector
		
		Vector u = new Vector(this.a, this.b);
		
		//nyni je ze smeroveho vektoru u potreba udelat normalovy vektor n:
		
		double n1 = u.getY();
		double n2 = u.getX() * (-1);
		Point q = new Point(n1,n2);
		Point p0 = new Point(0,0);
		Vector n = new Vector(q,p0); // normalovy vektor
		
		double posun = (n.getX() * this.b.getX() + n.getY() * this.b.getY()); // tady by se to melo nasobit -1
		
		dist = Math.abs(p.getX() * n1 + p.getY() * n2 + posun) / Math.sqrt(Math.pow(n1, 2) + Math.pow(n2, 2));
		
		return dist;
	}
	
	public double getLength() {
		return length;
	}	
}