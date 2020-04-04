package bitcamp.java142.ch5.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bitcamp.java142.ch5.board.common.KcmHelloBoardChaebunClass;
import bitcamp.java142.ch5.board.common.KcmHelloBoardConnProperty;
import bitcamp.java142.ch5.board.sql.KcmHelloBoardSqlMap;
import bitcamp.java142.ch5.board.vo.KcmHelloBoardVO;

public class KcmHelloBoardDAOImpl implements KcmHelloBoardDAO {

	@Override
	public List<KcmHelloBoardVO> selectKcmHelloBoard() {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmHelloBoardDAOImpl.selectKcmHelloBoard() entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		List<KcmHelloBoardVO> aList = null;
		KcmHelloBoardVO khbvo = null;
		
		try{
			conn = KcmHelloBoardConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getSelectQuery());
			System.out.println(" SELECT QUERY >>> \n" + KcmHelloBoardSqlMap.getSelectQuery());
			rsRs = pstmt.executeQuery();
			if (rsRs != null){
				aList = new ArrayList<KcmHelloBoardVO>();
				while (rsRs.next()){
					String kno = rsRs.getString("KNO");
					String ksubject = rsRs.getString("KSUBJECT");
					String kname = rsRs.getString("KNAME");
					String kpw = rsRs.getString("KPW");
					String kmemo = rsRs.getString("KMEMO");
					String kdeleteyn = rsRs.getString("KDELETEYN");
					String kinsertdate = rsRs.getString("KINSERTDATE");
					String kupdatedate = rsRs.getString("KUPDATEDATE");
					
					khbvo = new KcmHelloBoardVO(kno
											   ,ksubject
											   ,kname
											   ,kpw
											   ,kmemo
											   ,kdeleteyn
											   ,kinsertdate
											   ,kupdatedate);
					aList.add(khbvo);
				}
			}
			KcmHelloBoardConnProperty.connClose(conn, pstmt, rsRs);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생. " + e.getMessage());
		}finally{
			KcmHelloBoardConnProperty.connClose(conn, pstmt, rsRs);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.selectKcmHelloBoard() left");
		return aList;
	}

	@Override
	public List<KcmHelloBoardVO> searchKcmHelloBoard(KcmHelloBoardVO _khbvo){
		System.out.println("(log) KcmHelloBoardDAOImpl.searchKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		List<KcmHelloBoardVO> aList = null;
		KcmHelloBoardVO khbvo = null;
		
		try{
			conn = KcmHelloBoardConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getSearchQuery());
			System.out.println(" SEARCH QUERY >>> \n " + KcmHelloBoardSqlMap.getSearchQuery());
			System.out.println(" _khbvo.getKno() >>> " + _khbvo.getKno());
			pstmt.setString(1, _khbvo.getKno());
			rsRs = pstmt.executeQuery();
			
			if (rsRs != null){
				aList = new ArrayList<KcmHelloBoardVO>();
				while (rsRs.next()){
					String kno = rsRs.getString("KNO");
					String ksubject = rsRs.getString("KSUBJECT");
					String kname = rsRs.getString("KNAME");
					String kpw = rsRs.getString("KPW");
					String kmemo = rsRs.getString("KMEMO");
					String kdeleteyn = rsRs.getString("KDELETEYN");
					String kinsertdate = rsRs.getString("KINSERTDATE");
					String kupdatedate = rsRs.getString("KUPDATEDATE");
					
					khbvo = new KcmHelloBoardVO(kno
											   ,ksubject
											   ,kname
											   ,kpw
											   ,kmemo
											   ,kdeleteyn
											   ,kinsertdate
											   ,kupdatedate);
					aList.add(khbvo);
				}
			}
			
			KcmHelloBoardConnProperty.connClose(conn, pstmt, rsRs);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생 " + e.getMessage());
		}finally{
			KcmHelloBoardConnProperty.connClose(conn, pstmt, rsRs);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.searchKcmHelloBoard(KcmHelloBoardVO _khbvo) left");
		return aList;
	}
	
	@Override
	public List<KcmHelloBoardVO> pwSelectKcmHelloBoard(KcmHelloBoardVO _khbvo){
		return null;
	}

	@Override
	public int insertKcmHelloBoard(KcmHelloBoardVO _khbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmHelloBoardDAOImpl.insertKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int nCnt = 0;
		try{
			conn = KcmHelloBoardConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getInsertQuery());
			System.out.println(" INSERT QUERY >>> \n" + KcmHelloBoardSqlMap.getInsertQuery());
			pstmt.setString(1, KcmHelloBoardChaebunClass.boardNo());
			pstmt.setString(2, _khbvo.getKsubject());
			pstmt.setString(3, _khbvo.getKname());
			pstmt.setString(4, _khbvo.getKpw());
			pstmt.setString(5, _khbvo.getKmemo());
			pstmt.setString(6, _khbvo.getKdeleteyn());
			nCnt = pstmt.executeUpdate();
			if (nCnt > 0){
				System.out.println(" 쿼리 수행 성공! " );
			}
			if (!conn.getAutoCommit()){conn.commit();}
			
			KcmHelloBoardConnProperty.connClose(conn, pstmt);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생. " + e.getMessage());
		}finally{
			KcmHelloBoardConnProperty.connClose(conn, pstmt);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.insertKcmHelloBoard(KcmHelloBoardVO _khbvo) left");
		return nCnt;
	}

	@Override
	public int updateKcmHelloBoard(KcmHelloBoardVO _khbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmHelloBoardDAOImpl.updateKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int nCnt = 0;
		try{
			conn = KcmHelloBoardConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getUpdateQuery());
			System.out.println(" UPDATE QUERY >>> \n" + KcmHelloBoardSqlMap.getUpdateQuery());
			pstmt.setString(1, _khbvo.getKsubject());
			pstmt.setString(2, _khbvo.getKmemo());
			pstmt.setString(3, _khbvo.getKno());
			nCnt = pstmt.executeUpdate();
			System.out.println(" nCnt >>> " + nCnt);
			
			if (nCnt >= 1){System.out.println(" 업데이트 성공!");}
			if (!conn.getAutoCommit()){conn.commit();}
			
			KcmHelloBoardConnProperty.connClose(conn, pstmt);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생 " + e.getMessage());
		}finally{
			KcmHelloBoardConnProperty.connClose(conn, pstmt);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.updateKcmHelloBoard(KcmHelloBoardVO _khbvo) left");
		return nCnt;
	}

	@Override
	public int deleteKcmHelloBoard(KcmHelloBoardVO _khbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmHelloBoardDAOImpl.deleteKcmHelloBoard(KcmHelloBoardVO _khbvo) entered");
		Connection conn = null;
		PreparedStatement pstmt = null;
		int nCnt = 0;
		
		try{
			conn = KcmHelloBoardConnProperty.getConnection();
			pstmt = conn.prepareStatement(KcmHelloBoardSqlMap.getDeleteQuery());
			System.out.println(" DELETE QUERY >>> \n" +KcmHelloBoardSqlMap.getDeleteQuery());
			pstmt.setString(1, _khbvo.getKdeleteyn());
			pstmt.setString(2, _khbvo.getKno());
			nCnt = pstmt.executeUpdate();
			
			if (nCnt >= 1){System.out.println(" 삭제 성공! ");}
			if (!conn.getAutoCommit()){conn.commit();}
			
			KcmHelloBoardConnProperty.connClose(conn, pstmt);
		}catch(Exception e){
			System.out.println(" DB연결 또는 쿼리에 문제가 발생 " + e.getMessage());
		}finally{
			KcmHelloBoardConnProperty.connClose(conn, pstmt);
		}
		System.out.println("(log) KcmHelloBoardDAOImpl.deleteKcmHelloBoard(KcmHelloBoardVO _khbvo) left");
		return nCnt;
	}

}
