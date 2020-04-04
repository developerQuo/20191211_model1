package bitcamp.java142.ch5.board.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bitcamp.java142.ch5.board.sql.KcmHelloBoardSqlMap;

public abstract class KcmHelloBoardChaebunClass {
	
	public static final String FUNC_GUBUN_B = "B";
	
	public static String boardNo(){
		System.out.println("(log) KcmHelloBoardChaebunClass.boardNo() entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		StringBuffer numbering = null;
		
		numbering = new StringBuffer();
		numbering.append(FUNC_GUBUN_B);
		System.out.println(" appended FUNC_GUBUN_B >>> " + numbering);
		try{
			conn = KcmHelloBoardConnProperty.getConnection();
			System.out.println(" Connection success! ");
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.B_CHAEBUN);
			System.out.println(" KcmHelloBoardSqlMap.B_CHAEBUN >>> \n " 
							   + KcmHelloBoardSqlMap.B_CHAEBUN);
			rsRs = pstmt.executeQuery();
			if (rsRs!=null){
				while (rsRs.next()){
					System.out.println(" rsRs >>> " + rsRs.getString("COMMNO"));
					numbering.append(rsRs.getString(1));
				}
			}
			System.out.println(" numbering >>> " + numbering);
			KcmHelloBoardConnProperty.connClose(conn, pstmt, rsRs);
		}catch(Exception e){
			System.out.println(" DB���� �Ǵ� ������ ������ �ֽ��ϴ�. " + e.getMessage());
		}finally{
			KcmHelloBoardConnProperty.connClose(conn, pstmt, rsRs);
		}
		System.out.println("(log) KcmHelloBoardChaebunClass.boardNo() left");
		return numbering.toString();
	}
	
}
