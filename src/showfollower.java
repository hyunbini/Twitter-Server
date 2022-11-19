//4 Show Follower/following
import java.util.*;
import java.sql.*;
public class showfollower {
	static Connection con = null;
	
	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);
		
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
		// Tweeter operation
		try {
			System.out.println(user_id + " has followers: ");
			stmt = con.createStatement();
			String s2 = "select user_id from follower where (select user_id from user where id = \'" + user_id + "\');";
			rs = stmt.executeQuery(s2);
			
			while(rs.next()) {
				String result = rs.getString(1);
				System.out.println(result);
			}
			System.out.println(user_id + " has followings: ");
			String s3 = "select follower_id from following where (select user_id from user where id = \'" + user_id + "\');";
			rs = stmt.executeQuery(s3);
			while(rs.next()) {
				String result = rs.getString(1);
				System.out.println(result);
			}
				}catch(Exception e) {
			e.printStackTrace();
		}}
	}
