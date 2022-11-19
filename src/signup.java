//1 sign up

import java.util.*;
import java.sql.*;

public class signup {
	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/twitter";
			String user = "root", passwd = "uols4120173&";
			con = DriverManager.getConnection(url, user, passwd);
			System.out.println(con);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
				
						String s1 = null;
						System.out.println("Input userId and password: ");
						
						String user_id = keyboard.next();
						String password = keyboard.next();
						
						stmt = con.createStatement();
						String s2 = "select id from user where id = \"" + user_id + "\"";
						rs = stmt.executeQuery(s2);
						
						if(rs.next()) {
							System.out.println("User name is already exist!");
						}else {
							System.out.println("Input name, age, nickname, interest, region: ");
							String name = keyboard.next();
							String age = keyboard.next();
							String nickname = keyboard.next();
							String interest = keyboard.next();
							String region = keyboard.next();
							
							s1 = "insert into user (id, pwd, name, age, nickname, interest_id, region_id) values (\'"+user_id + "\', \'" + password + "\', \'"
									+ name+ "\', \'"+ 
							age +"\', \'" + nickname + "\',\'" + interest + "\', \'" + region + "\')";
							pstm = con.prepareStatement(s1);
							pstm.executeUpdate();
							
							System.out.println("Sign up complete.");}
						
						
					
				}catch(Exception e) {
			e.printStackTrace();
		}}
}