package exercise1;

public class Line implements IDist {
	private Point a;
	private Point b;
	private double length;
	
	public Line(Point a, Point b) {
		this.a = a;
		this.b = b;
		this.length = a.distance(b);
	}
	
	public double distance(Point p) {			
		double dist = 0;			
		Vector u = new Vector(this.a, this.b);		
		//nyni je ze smeroveho vektoru u potreba udelat normalovy vektor n:
		Vector n = new Vector(new Point(u.getY(), u.getX() * (-1)), 
				              new Point(0,0)); // normalovy vektor		
		double shift = (n.getX() * this.b.getX() +
				        n.getY() * this.b.getY()); 		
		
		//obecne nevime, jak je usecka naklonena: kdyz mame usecku AB, tak nevime,
		//zda je bod A "nad" bodem B ci pod
		
		double minX, maxX;
		
		if (this.a.getX() > this.b.getX()) {
			maxX = this.a.getX();
			minX = this.b.getX();			
		} else {
			maxX = this.b.getX();
			minX = this.a.getX();
		}
		
		//pokud se bod p nachazi mezi krajnimi body usecky (na ose x), tak vzdalenost vypocitame takto:
		
			// bod p[x1,x2], primka n: jx + ky + shift = 0;
			// dist = |p,n|= abs(j*x1 + k*x2 + shift)/sqrt(j^2+k^2);
		
		//jinak vypocitame vzdalenost k nejblizsimu hranicnimu bodu
		
		if ((p.getX() >= minX) && (p.getX() <= maxX))
		
			dist = Math.abs(p.getX() * u.getY() + p.getY() * u.getX() * (-1) + shift) /
				   Math.sqrt(Math.pow(u.getY(), 2) + Math.pow(u.getX() * (-1), 2));	
		
		else 
		
			dist = p.distance(this.a) > p.distance(this.b) ? p.distance(this.b) : p.distance(a);
			
		return dist;
	}
	
	public double getLength() {
		return length;
	}	
}