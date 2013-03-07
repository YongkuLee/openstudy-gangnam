package chap17.jdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException {
//		return DriverManager.getConnection("jdbc:apache:commons:dbcp:/guestbook");
		String jdbcDriver="jdbc:mysql://localhost:3306/chap13?useUnicode=true&characterEncoding=utf8";
		String dbUser="jspexam";
		String dbPass="jspex";
		return DriverManager.getConnection(jdbcDriver, dbUser,dbPass);
	}
}
