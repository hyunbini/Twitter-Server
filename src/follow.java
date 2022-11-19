//follow
import java.util.*;
import java.sql.*;

public class follow {
	static Connection con = null;
	private static String allow;
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
			follow();
		}catch(Exception e) {
				e.printStackTrace();
			}
	}
	private static void follow() {
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		Scanner keyboard = new Scanner(System.in);
		try {

			System.out.println("Input user Id to follow: ");
			String other_user_id = keyboard.next();
			
			// Validation
			if(user_id.equals(other_user_id)) {
				System.out.println("Cannot follow yourself.");
			}
			String s2 = "select follower_id from follower where follower_id = \'" + user_id + "\' and user_id = \'" + other_user_id + "\';";
			stmt = con.createStatement();
			rs = stmt.executeQuery(s2);
			
			if(rs.next()) {
				System.out.println("Already Following the user.");
				follow();
				
			}else {
				String s3 = "select * from user where id = \'" + user_id + "\'";
				stmt = con.createStatement();
				rs = stmt.executeQuery(s3);
				while(rs.next())
				{
					int priv = rs.getInt("private");
					if(priv == 0)
					{
						System.out.println("Enter 0 if you accept the follow or 1 if you do not accept it.");
						int result = keyboard.nextInt();
						System.out.println(result);
						if(result == 0)
						{
							String s4 = "insert into follower (follower_id, user_id) values (\'" + user_id + "\', \'" + other_user_id + "\');";
							String s5 = "insert into following (follower_id, user_id) values (\'" + other_user_id + "\', \'" + user_id + "\');";
							
							pstm = con.prepareStatement(s4);
							pstm.executeUpdate();
							
							pstm = con.prepareStatement(s5);
							pstm.executeUpdate();
							System.out.println("All done");
						}
						else
						{
							System.out.println("Success to not accept");
						}
					}
					else
					{
						String s4 = "insert into follower (follower_id, user_id) values (\'" + user_id + "\', \'" + other_user_id + "\');";
						String s5 = "insert into following (follower_id, user_id) values (\'" + other_user_id + "\', \'" + user_id + "\');";
						
						pstm = con.prepareStatement(s4);
						pstm.executeUpdate();
						
						pstm = con.prepareStatement(s5);
						pstm.executeUpdate();
						System.out.println("All done");
					}
				}
			}
	}catch(Exception e)
		{
		e.printStackTrace();
		}
	}
		}

