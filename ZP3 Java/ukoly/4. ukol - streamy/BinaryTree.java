package exercise4;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

public class BinaryTree<T extends Comparable<T>> implements Collection<T> { 

	private BinaryTree<T> root = null;
	private BinaryTree<T> left, right;
	private T data;
	
	public BinaryTree() {
		
		this.left = null;
        this.right = null;
        this.data = null;
		
	}
	
	public Boolean adds(T element) { /*zde jsem musela prejmenovat add -> adds*/
		
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
	
	/* implementace Collection */

	@Override
	public boolean add(T e) { 
		//Ensures that this collection contains the specified element
		
		BinaryTree<T> currentNode = root;
		
		while(true) {
			
		 if (currentNode == null) return false;
		 
		 if (e.compareTo(currentNode.data) == 0) {
				return true;
			} else if (e.compareTo(currentNode.data) > 0) {
				currentNode = currentNode.right;
				continue;
			} else {
				currentNode = currentNode.left;
				continue;
			}		
		}
	}

	@Override
	public boolean addAll(Collection<? extends T> c) { 
		//Adds all of the elements in the specified collection to this collection
		if (c == null) return false;
		Iterator<? extends T> itr = c.iterator();
		while(itr.hasNext()) {
	         T element = itr.next();
	         adds(element);
	      }
		return true;
	}

	public void clear(BinaryTree<T> node) {		
		if (node != null) {
			clear(node.right);
			clear(node.left);
			node = null;
		}
	}
	
	@Override
	public void clear() {
		//Removes all of the elements from this collection
		BinaryTree<T> currentNode = root;
		clear(currentNode);
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean contains(Object o) {
		//Returns true if this collection contains the specified element
		BinaryTree<T> currentNode = root;
		
		while(true) {
			
			if (currentNode == null) {
	            return false;
	        }
			
			if (((Comparable<T>) o).compareTo(currentNode.data) == 0) return true;
			else if (((Comparable<T>) o).compareTo(currentNode.data) > 0) {
				currentNode = currentNode.right;
				continue;
			} else {
				currentNode = currentNode.left;
				continue;
			}			
		}		
	}

	@Override
	public boolean containsAll(Collection<?> c) {
		//Returns true if this collection contains all of the elements in the specified collection
		for (Object cs : c) {
			if (contains(cs) == false) return false;
		}
		return true;
	}

	@Override
	public boolean isEmpty() {
		//Returns true if this collection contains no elements
		if (this.root == null)
			return true;
		else 
			return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Iterator<T> iterator() {
		//Returns an iterator over the elements in this collection	
		//TreeIterator implemented at the end of this document
		TreeIterator it = new TreeIterator();
		return (Iterator<T>) it;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean remove(Object o) {
		//Removes a single instance of the specified element from this collection, if it is present
		BinaryTree<T> currentNode = root;
		
		while(true) {
			
		 if (currentNode == null) return false;
		 
		 if (((Comparable<T>) o).compareTo(currentNode.data) == 0) {
			    o = null;
				return true;
			} else if (((Comparable<T>) o).compareTo(currentNode.data) > 0) {
				currentNode = currentNode.right;
				continue;
			} else {
				currentNode = currentNode.left;
				continue;
			}		
		}		
	}

	@Override
	public boolean removeAll(Collection<?> c) {
		//Removes all of this collection's elements that are also contained in the specified collection
		for (Object cs : c) {
			remove(cs);
		}
		return true;
	}

	@Override
	public boolean retainAll(Collection<?> c) {
		//Retains only the elements in this collection that are contained in the specified collection		
		BinaryTree<T> currentNode = root;
		boolean changed = false;
	    for (int i = size() - 1; i >= 0; i--) {
	        Object obj = currentNode;
	        if (!c.contains(obj)) {
	            remove(obj);
	            changed = true;
	        }
	    }
	    return changed;
	}

	public int size(BinaryTree<T> node) {		
		 if (node == null) 
		       return 0; 		   
		 int res = 0; 
		 //if (node.left != null || node.right != null)  
		       res++; 		   
		 res += (size(node.left) +  
		         size(node.right)); 
		 return res; 	
	}
	
	@Override
	public int size() {
		int size = 0;
		BinaryTree<T> currentNode = root;
		size = size(currentNode);
		return size;
	}

	@Override
	public Object[] toArray() {
		int size = this.size();
		@SuppressWarnings("unchecked")
		T[] array = (T[])new Object[size];

		return this.toArray(array);
	}
	
	@SuppressWarnings({ "hiding", "unchecked" })
	public <T> T[] toArray(@SuppressWarnings("rawtypes") BinaryTree n,T[] a) {
		int i = 0;
		if (n.left != null) {
			    toArray(n.left, a);
			  }
		 a[i] = (T) n.data;
		 i++;
		 
		 if (n.right != null) {
			   toArray(n.right, a);
			  }	
		return a;
	}
	
	@SuppressWarnings({ "hiding" })
	@Override
	public <T> T[] toArray(T[] a) {
		return toArray(root,a);	
	}
	
  public void addStream(ArrayList<T> array, BinaryTree<T> node) {

		if (node != null) {

			array.add(node.data);
			addStream(array, node.left);
			addStream(array, node.right);
		}
	}
  
  
	public void writeToStream(OutputStream out) throws IOException {
		ArrayList<T> array = new ArrayList<T>();
		addStream(array, this.root);
    	ObjectOutputStream output = new ObjectOutputStream(out);
		output.writeObject(array);
	} 
	
    @SuppressWarnings("unchecked")
	public void readFromStream(InputStream in) {
    	BinaryTree<T> currentNode = root;
		try {
			 ObjectInputStream iin = new ObjectInputStream(in);
			 while (true) {
				    Object obj = iin.readObject();
				    currentNode.adds((T) obj);
				}
	    } catch (Exception ex) {
	    	ex.printStackTrace();
	    }
	}
}

class TreeIterator implements Iterator<Integer> {
  
    private int cursor;
    private int end;

    public void RangeIterator(int start, int end) {
        this.cursor = start;
        this.end = end;
    }

    public boolean hasNext() {
        return this.cursor < end;
    }

    public Integer next() {
        if(this.hasNext()) {
            int current = cursor;
            cursor++;
            return current;
        }
        return 0;
    }	
}