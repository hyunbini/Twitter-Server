//Write posts

import java.util.*;
import java.time.*;
import java.time.format.*;
import java.sql.*;
public class posts {
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
		String user_id = "abc";
		Statement stmt = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		// Tweeter operation
		try {
			System.out.println("Write content: ");
			String content = keyboard.nextLine();
			
			LocalDateTime now = LocalDateTime.now();
			String createAt = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now);
			System.out.println("Write image url: ");
			String image = keyboard.nextLine();
			String s2 = "insert into post (writer_id,content, image, written_date) values (\'" + user_id + "\',\'" + content + "\', \'" + image + "\', \'" + createAt + "\')";
			pstm = con.prepareStatement(s2);
			
			pstm.executeUpdate();
			
			System.out.println("Post is uploaded");
				}catch(Exception e) {
			e.printStackTrace();
		}}
	}