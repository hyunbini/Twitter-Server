//2 login
import java.util.*;
import java.sql.*;

public class login {
	static Connection con = null;
	public static void main(String[] args) {
		
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
		try {
			login();
		}catch(Exception e) {
				e.printStackTrace();
			}
	}
	private static void login() {
		Scanner keyboard = new Scanner(System.in);
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		System.out.println("Input userId and password: ");	
		String user_id = keyboard.next();
		String password = keyboard.next();
		
		try {
		stmt = con.createStatement();
		String s1 = "select id from user where id = \"" + user_id + "\" and pwd=\"" + password + "\"";
		rs = stmt.executeQuery(s1);
		if(rs.next()) {
			System.out.println("Login success!");
					}
		else {
			String s2 = "Select id from user where id = \""+ user_id+"\"";
			rs = stmt.executeQuery(s2);
			if(rs.next())
			{
				System.out.println("Wrong Password, Do it again");
				login();
			}
			else {
				System.out.println("Wrong Id");
				login();
			}
						}
		}catch(Exception e) {
			e.printStackTrace();}
		}
		
}
