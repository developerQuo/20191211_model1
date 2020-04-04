package bitcamp.java142.ch5.board.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class KcmHelloBoardConnProperty {
	public static final String ORACLE11G_JDBCDRIVER =
								"oracle.jdbc.driver.OracleDriver";
	public static final String ORACLE11G_URL =
								"jdbc:oracle:thin:@127.0.0.1:1521:orclKCM";
	public static final String ORACLE11G_USER = "KCM00";
	public static final String ORACLE11G_PASS = "USER00";
	
	public static Connection getConnection() throws Exception{
		System.out.println("(log) KcmHelloBoardConnProperty.getConnection() entered");
		Connection conn = null;
		
		Class.forName(ORACLE11G_JDBCDRIVER);
		conn = DriverManager.getConnection(ORACLE11G_URL
										 , ORACLE11G_USER
										 , ORACLE11G_PASS);
		System.out.println("(log) KcmHelloBoardConnProperty.getConnection() left");
		return conn;
	}
	
	public static void connClose(Connection _conn
						   		,PreparedStatement _pstmt
						   		,ResultSet _rsRs){
		System.out.println("(log) KcmHelloBoardConnProperty.connClose() entered");
		Connection conn = _conn;
		PreparedStatement pstmt = _pstmt;
		ResultSet rsRs = _rsRs;
		try{
			if (conn != null){try{conn.close(); conn=null;}catch(Exception e){}}
			if (pstmt != null){try{pstmt.close(); pstmt=null;}catch(Exception e){}}
			if (rsRs != null){try{rsRs.close(); rsRs=null;}catch(Exception e){}}
		}catch(Exception e){}
			
		System.out.println("(log) KcmHelloBoardConnProperty.connClose() left");
	}
	
	public static void connClose(Connection _conn
						   		,PreparedStatement _pstmt){
		System.out.println("(log) KcmHelloBoardConnProperty.connClose() entered");
		Connection conn = _conn;
		PreparedStatement pstmt = _pstmt;
		try{
			if (conn != null){try{conn.close(); conn=null;}catch(Exception e){}}
			if (pstmt != null){try{pstmt.close(); pstmt=null;}catch(Exception e){}}
		}catch(Exception e){}
		
		System.out.println("(log) KcmHelloBoardConnProperty.connClose() left");
	}
}
