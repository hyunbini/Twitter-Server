//find password
import java.util.*;
import java.sql.*;

public class findpassword {
	static Connection con = null;
	public static void main(String[] args) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://database-1.cvv6ywlhnvcx.ap-northeast-2.rds.amazonaws.com:3306/twitter";
			String user = "admin", passwd = "twittertwitter";
			con = DriverManager.getConnection(url, user, passwd);
			System.out.println(con);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			find_pwd();
		}catch(Exception e) {
				e.printStackTrace();
			}
	}
	private static void find_pwd() {
		Scanner keyboard = new Scanner(System.in);
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		System.out.println("Insert 0 to find password with phone number, Insert 1 to find password with email: ");
		int mode = keyboard.nextInt();
		String com = keyboard.nextLine();
		try {
			if (mode==0)
			{
				System.out.println("Enter the phone number : ");
				String phonenum = keyboard.nextLine();
				System.out.println("Please enter the id of the account to find the password : ");	
				String user_id = keyboard.next();
				stmt = con.createStatement();
				String s1 = "select pwd from user where id = \"" + user_id + "\" and phone_num = \"" + phonenum + "\"";
				rs = stmt.executeQuery(s1);
				if(rs.next()) {
					String pwd = rs.getString("pwd");
					System.out.println("Password for " + user_id +": " +  pwd);
							}
				else {
					String s2 = "select phone_num from user where phone_num = \"" + phonenum +"\"";
					rs = stmt.executeQuery(s2);
					if (rs.next())
					{
						System.out.println("Wrong Id");
						find_pwd();
					}
					else
					{
						String s3 = "select id from user where id = \"" + user_id +"\"";
						rs = stmt.executeQuery(s3);
						if(rs.next())
						{
							System.out.println("Wrong phone number");
							find_pwd();
						}
						else
						{
							System.out.println("Wrong Id and phone number");
							find_pwd();
						}
					}
					}
				
				
			}
			else if (mode==1)
			{
				System.out.println("Enter the email : ");
				String email = keyboard.nextLine();
				System.out.println("Please enter the id of the account to find the password : ");	
				String user_id = keyboard.next();
				stmt = con.createStatement();
				String s1 = "select pwd from user where id = \"" + user_id + "\" and email = \"" + email + "\"";
				rs = stmt.executeQuery(s1);
				if(rs.next()) {
					String pwd = rs.getString("pwd");
					System.out.println("Password for " + user_id +": " +  pwd);
							}
				else {
					String s2 = "select email from user where email = \"" + email +"\"";
					rs = stmt.executeQuery(s2);
					if (rs.next())
					{
						System.out.println("Wrong Id");
						find_pwd();
					}
					else
					{
						String s3 = "select id from user where id = \"" + user_id +"\"";
						rs = stmt.executeQuery(s3);
						if(rs.next())
						{
							System.out.println("Wrong email");
							find_pwd();
						}
						else
						{
							System.out.println("Wrong Id and email");
							find_pwd();
						}
					}
					}
				
			}
			else
			{
				System.out.println("Wrong select. Try again.");
				find_pwd();
				
			}
		}catch(Exception e) {
			e.printStackTrace();}
		}
		
}