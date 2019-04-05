package IO;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import ADT.*;
import Modules.*; 
import User.*; 
public class EmployeeIO {
	
	private String filename; 
	
	private List<Employee> employeelist; 
	Scanner scanner; 
	// private String filename; 
	
	public EmployeeIO(String fname)
	{
		filename = fname; 		
		scanner = new Scanner(System.in); 
		employeelist = new List<Employee>();
	}
	
	public EmployeeIO(String fname, List<Employee> list)
	{
		filename = fname; 
		employeelist = list;
		scanner = new Scanner(System.in);
	}

	/********
	 * 
	 * @return a completed List. 
	 */
	public List<Employee> readfile()
	{
		boolean readable = true;
		BufferedReader buff;
		FileReader filereader;

		try {
			filereader = new FileReader(filename);
			buff = new BufferedReader(filereader);
			String line;

			while (readable) {
				line = buff.readLine();
				if (line == null) // finished reading
				{
					readable = false;
					break;
				}
				
				String[] vertices = line.split(",");
				employeelist.addLast(new Employee(vertices[0], vertices[1], vertices[2]));
			}
			buff.close();
		} catch (IOException e) {
			System.out.println("readfile(): Problem reading file. " + e.toString());
		}
		return employeelist; 
	}
	
	/********
	* overwrite the entire file. 
	 * @throws IOException 
	*/
	public void rewritefile() 
	{
		FileWriter output = null;
		try {
			output = new FileWriter(filename);
			//output = new FileWriter("employeeoutput.csv");
		} catch (IOException e1) {
			e1.printStackTrace();
		}   
		PrintWriter filewriter = new PrintWriter(output); 
		
		filewriter.write(User.getemployees().toString()); 
		

		//System.out.println("\n\nEmployee");
		//System.out.print(User.getemployees().toString());

		try {
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
