package User;

import java.util.ArrayList;

import ADT.*;
import IO.CustomerIO;
import IO.EmployeeIO;
import Modules.*; 

public class Client {
	
	private boolean isloggedin; 
	private ArrayList<Product> shoppingcart; 
	private ArrayList<Integer> quantities; 
	private Customer customer; 
	
	/******
	 * This is when the customer has already logged in. 
	 * @param c the customer that uses this
	 */
	public Client(Customer c) // already logged in    
	{ 
		this.customer = c; 
		isloggedin = true; 
		quantities = new ArrayList<Integer>(); 
		shoppingcart = new ArrayList<Product>(); 
	}
	
	/*******
	 * This is when the customer is in guest mode, or not logged in. 
	 */
	public Client()  // is not logged in 
	{
		this.customer = null;
		isloggedin = false;
		quantities = new ArrayList<Integer>(); 
		shoppingcart = new ArrayList<Product>();
	}
	
	/*******
	 * this gives other sources the access of customer that is currently logged in. 
	 * @return customer
	 */
	public Customer getcustomer()
	{
		return customer; 
	}
	
	public void setisloggedin()
	{
		isloggedin = !isloggedin; 
	}
	
	/********
	 * Will add the quantity number of product to the array list
	 * If quantity is less than one, then will automatically add one for quantity. 
	 * @param p
	 * @param quantity
	 * @throws NullPointerException
	 */
	public void addtoshoppingcart(Product p, int quantity) throws NullPointerException
	{
		if (p == null)
			throw new NullPointerException("addtoshoppingcart: Fail to add null product is null! ");
		else if (quantity < 1)
			return; 
		else
		{
		    quantities.add(quantity);	
			shoppingcart.add(p);  			
		}
	}
	
	public ArrayList<Product> getshoppingcart()
	{
		return shoppingcart;
	}
	
	public ArrayList<Integer> getquantities()
	{
		return quantities;
	}
	
	/***********
	 * log in by swapping the isloggedin status
	 * initialize the customer object with the information related to the username/password
	 * @param username
	 * @param password
	 */
	public void login(String username, String password, int index)
	{
		String [] cusprop; // customer properties 
	    cusprop = CustomerIO.getcustomerfilecontent().get(index).split(","); 
	    customer = Server.searchCustomer(cusprop[0], cusprop[1]);
		// customer = new Customer(cusprop[0], cusprop[1], cusprop[2], cusprop[3], cusprop[4], cusprop[5]); 
								// fname      lname       username    password    address   phonenumber     
		isloggedin = true; 
	}

	public boolean isloggedin()
	{
		return isloggedin; 
	}
	
	/*****
	 * Set the customer back to null
	 * islogged in is swapped back to false 
	 */
	public void logout()
	{
		customer = null; 
		isloggedin = false; 
	}
	
	/***************
	 * Create a new order object using the information passed into the parameter
	 * Insert the object into Customer's past order's queue 
	 * Clear the shopping cart by empty out both parallel arrays
	 */
	public void placeOrder(String shipType)
	{
		String ship = "";
		if (shipType == null || shipType.equals(""))
			ship = "Rush";
		else if (shipType.contains("2.99"))
			ship = "Rush";
		else if (shipType.contains("4.99"))
			ship = "Overnight";
		else
			ship = "Standard";
		
		ArrayList<Integer> q = quantities; 
		ArrayList<Product> s = shoppingcart; 
		Order o = new Order(s, q, customer.getFullName(), ship);
		User.adddata("p", o);  
		customer.insertOrder(o);
		quantities = new ArrayList<Integer>(); 
		shoppingcart = new ArrayList<Product>();
    }
	
	/*******
	 * Shows all the past orders    
	 * @return get all the past orders
	 */
	public PriorityQueue<Order> viewPurchases()
	{
		return customer.getOrders();
	}
	
	/********
	 * !!! GUEST USE
	 * create a new customer object using the information passed into the parameter
	 * Insert the object into the customer list 
	 */
	public static void createnewaccount(String firstname, String lastname, String username, String password, String address, String phoneNumber)
	{
		User.adddata("h", new Customer(firstname, lastname, username, password, address, phoneNumber));
	}
	
	/**********
	 * !!! GUEST USE
	 * verify the logging in information that the user has passed in. 
	 * @param username the username that is being passed in. 
	 * @param password the password that is being passed in. 
	 * @return true if the passed in username and password is found
	 * 		   false if the passed in username and password is not found 
	 */
	public static int verifyLogInInformationCustomer(String username, String password)
	{			
	    String temp = username + "," + password;
	    	    
		for (int i = 0; i < CustomerIO.getcustomerlogininfo().size(); i++)
		{
		    if (CustomerIO.getcustomerlogininfo().get(i).equals(temp))
		    {
		        return i;
		    }
		}
		return -1;
	}
}


