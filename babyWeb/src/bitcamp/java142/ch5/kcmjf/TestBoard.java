package bitcamp.java142.ch5.kcmjf;
import java.util.Iterator;
import java.util.List;

import bitcamp.java142.ch5.board.common.KcmHelloBoardChaebunClass;
import bitcamp.java142.ch5.board.dao.KcmHelloBoardDAO;
import bitcamp.java142.ch5.board.dao.KcmHelloBoardDAOImpl;
import bitcamp.java142.ch5.board.vo.KcmHelloBoardVO;
public class TestBoard {
	public static void displayFunc(KcmHelloBoardVO _khbvo){
//		System.out.println("(log) KcmMemberScr.displayFunc(KcmMemberVO _kmvo) entered");
		System.out.print("  " + _khbvo.getKno());
		System.out.print(" " + _khbvo.getKsubject());
		System.out.print(" " + _khbvo.getKname());
		System.out.print(" " + _khbvo.getKpw());
		System.out.print(" " + _khbvo.getKmemo());
		System.out.print(" " + _khbvo.getKdeleteyn());
		System.out.print(" " + _khbvo.getKinsertdate());
		System.out.println(" " + _khbvo.getKupdatedate());
//		System.out.println("(log) KcmMemberScr.displayFunc(KcmMemberVO _kmvo) left");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		KcmHelloBoardChaebunClass.boardNo();
		
		List<KcmHelloBoardVO> aList = null;
		KcmHelloBoardVO khbvo = null;
		KcmHelloBoardDAO khbdao = new KcmHelloBoardDAOImpl();

		// select
//		aList = khbdao.selectKcmHelloBoard();
//		Iterator<KcmHelloBoardVO> iter = aList.iterator();
//		while (iter.hasNext()){
//			khbvo = iter.next();
//			TestBoard.displayFunc(khbvo);
//		}
//		
		// search
//		String kno = "B0002";
//		khbvo = new KcmHelloBoardVO();
//		khbvo.setKno(kno);
//		aList = khbdao.searchKcmHelloBoard(khbvo);
//		Iterator<KcmHelloBoardVO> iter = aList.iterator();
//		while (iter.hasNext()){
//			khbvo = iter.next();
//			TestBoard.displayFunc(khbvo);
//		}
		
		// insert
//		String ksubject = "주제";
//		String kname = "이름";
//		String kpw = "비번";
//		String kmemo = "메모";
//		
//		khbvo = new KcmHelloBoardVO(ksubject
//								   ,kname
//								   ,kpw
//								   ,kmemo);
//		int nCnt = khbdao.insertKcmHelloBoard(khbvo);
//		
//		if (nCnt > 0){
//			aList = khbdao.selectKcmHelloBoard();
//			Iterator<KcmHelloBoardVO> iter = aList.iterator();
//			while (iter.hasNext()){
//				khbvo = iter.next();
//				TestBoard.displayFunc(khbvo);
//			}
//		}
		
		// update
//		String kno = "B0002";
//		String ksubject = "수정 주제";
//		String kmemo = "수정 메모";
//		String kdeleteyn = "Y";
//		
//		khbvo = new KcmHelloBoardVO(kno,
//									ksubject,
//									kmemo);
//		int nCnt = khbdao.updateKcmHelloBoard(khbvo);
//		if (nCnt > 0){
//			aList = khbdao.selectKcmHelloBoard();
//			Iterator<KcmHelloBoardVO> iter = aList.iterator();
//			while (iter.hasNext()){
//				khbvo = iter.next();
//				TestBoard.displayFunc(khbvo);
//			}
//		}
		
		// delete
		String kno = "B0002";
		String kdeleteyn = "N";
		
		khbvo = new KcmHelloBoardVO(kno,
									kdeleteyn);
		int nCnt = khbdao.deleteKcmHelloBoard(khbvo);
		if (nCnt > 0){
			aList = khbdao.selectKcmHelloBoard();
			Iterator<KcmHelloBoardVO> iter = aList.iterator();
			while (iter.hasNext()){
				khbvo = iter.next();
				TestBoard.displayFunc(khbvo);
			}
		}
	}

}
