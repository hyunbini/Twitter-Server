//6 write comment
import java.util.*;
import java.sql.*;

public class comment {
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
			comment();
		}catch(Exception e) {
				e.printStackTrace();
			}
	}
	private static void comment() {
		Scanner keyboard = new Scanner(System.in);
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		String user_id = "abc";
		try {
			System.out.println("Write post_id and comment: ");
			int post_id = keyboard.nextInt();
			String comment = keyboard.next();
			
			// Validation 
			if(comment.length()>45) {
				System.out.println("Comment's maximum length is 45.");
				comment();
			}
		
			String s2 = "insert into comment (post_id, content, user_id) values (\'"+ post_id + "\', \'" + comment + "\', \'" + user_id +"\');";
			pstm = con.prepareStatement(s2);
			pstm.executeUpdate();
			System.out.println("Comment is uploaded");
		}catch(Exception e) {
			e.printStackTrace();}
		}
		
}


