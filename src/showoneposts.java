//Show one posts

import java.util.*;
import java.sql.*;
public class showoneposts {
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
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			Statement stmt = null;
			stmt = con.createStatement();
			String s2 = "select * from post where post_id = \'" + post_id + "\';";
			rs = stmt.executeQuery(s2);
			while(rs.next()) {
					String user_id = rs.getString("Writer_id");
					String content = rs.getString("content");
					String num_of_likes = rs.getString("num_of_likes");
					String retweet_num = rs.getString("retweet_num");
					String retweet_post = rs.getString("retweet_post");
					String image = rs.getString("image");
					String written_date = rs.getString("written_date");
					System.out.println("user: " + user_id + " | content: " + content + " | num of likes: " + num_of_likes + 
							" | retweet_num: " + retweet_num + " | retweet_post: " + retweet_post + "image : " + image + " | written date: " + written_date );
			}
			
				}catch(Exception e) {
			e.printStackTrace();
		}}
	}