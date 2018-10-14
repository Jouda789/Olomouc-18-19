package exercise2;

public class BinaryTree<T extends Comparable<T>> { //nema tady byt spis implements???

	private BinaryTree<T> root = null;
	private BinaryTree<T> left, right;
	private T data;
	
	public BinaryTree() {
		
		this.left = null;
        this.right = null;
        this.data = null;
		
	}
	
	public Boolean add(T element) {
		
		BinaryTree<T> currentNode = root;
		
		while(true) {
			
			if (currentNode == null) {
				currentNode = new BinaryTree<T>();
				currentNode.data = element;
				currentNode.left = null;
				currentNode.right = null;
				return true;
			} else {
				if (element.compareTo(currentNode.data) == 0) {
					return false;
				} else if (element.compareTo(currentNode.data) > 0) {
					currentNode = currentNode.right;
					continue;
				} else {
					currentNode = currentNode.left;
					continue;
				}
						
			}
		
		}    
	     
	}

	public Boolean delete(T element) {
		
		BinaryTree<T> currentNode = root;
		
		while(true) {
			
			if (currentNode == null) {				
				return false;
			} else {
				if (element.compareTo(currentNode.data) == 0) { //nasli jsme a jdeme mazat
					if (currentNode.left == null) {
						currentNode = currentNode.right;
						return true;
					} else if (currentNode.right == null) {
						currentNode = currentNode.left;
						return true;
					} else {
						
						//tady potrebujeme rotaci
						
						return false;
					}
											
				} else if (element.compareTo(currentNode.data) > 0) {
					currentNode = currentNode.right;
					continue;
				} else {
					currentNode = currentNode.left;
					continue;
				}
						
			}
		
		}
		
	}
	
	public Boolean search(T element) {
		
		BinaryTree<T> currentNode = root;
		
		while(true) {
			
			if (currentNode == null) {
	            return false;
	        }
			
			if (element.compareTo(currentNode.data) == 0) return true;
			else if (element.compareTo(currentNode.data) > 0) {
				currentNode = currentNode.right;
				continue;
			} else {
				currentNode = currentNode.left;
				continue;
			}
			
		}
		
	}
	
	  /* private void preOrderHelper(BinaryTree<T> r)
	   {
	      if (r != null)
	      {
	         System.out.print(r.data+" ");
	         preOrderHelper(r.left);
	         preOrderHelper(r.right);
	      }
	   }
	   public void traversal()
	   {
	      preOrderHelper(root);
	   }*/
	
}