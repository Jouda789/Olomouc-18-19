package exercise2;

public class Main {
	
	public static void main(String[] args) {
		
		Integer[] a = {1,5,2,7,4};
	    BinaryTree<Integer> bst = new BinaryTree<Integer>();
	    for(Integer n : a) bst.add(n);
        if (bst.search(5)) System.out.print("Nasel");
        else System.out.print("Nenasel");
	}
}
