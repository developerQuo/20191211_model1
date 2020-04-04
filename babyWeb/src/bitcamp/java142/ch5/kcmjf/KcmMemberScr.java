package bitcamp.java142.ch5.kcmjf;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAO;
import bitcamp.java142.ch5.kcmjf.dao.KcmMemberDAOImpl;
import bitcamp.java142.ch5.kcmjf.vo.KcmMemberVO;

public class KcmMemberScr {
	public static final String FUNC_SELECTOR_ANNOUNCE = "����� �����ϼ���.(�����Է�) "
													  + "\n 1. DB ��ȸ (select all)"
													  + "\n 2. DB �˻� (search)"
													  + "\n 3. DB Ű���� �˻� (like search)"
													  + "\n 4. DB ������ �߰� (insert)"
													  + "\n 5. DB ������ ���� (update)"
													  + "\n 6. DB ������ ���� (delete)"
													  + "\n \n 0. ���α׷� ����";
	public static final String SEARCH_ANNOUNCE = "�˻��� ���̵� �Է��ϼ���.\n";
	public static final String LIKE_SEARCH_ANNOUNCE = "Ű���带 �Է��ϼ���.\n";
	public static final String INSERT_ANNOUNCE = "�����͸� �Է��ϼ���. "
											   + "\n 1. ���̵�		2. ��й�ȣ"
											   + "\n 3. �̸�			4. �̸���"
											   + "\n 5. ��ȭ��ȣ		6. �������"
											   + "\n 7. ���θ�����ȣ		8. ���θ��ּ�";
	public static final String UPDATE_ANNOUNCE = "��й�ȣ�� ������ ������ ���̵� �Է��ϼ���.\n";
	public static final String NEW_PASS_ANNOUNCE = "���ο� ��й�ȣ�� �Է��ϼ���.\n";
	public static final String DELETE_ANNOUNCE = "������ ������ ���̵� �Է��ϼ���.\n";
	
	public static boolean funcSelector(){
		System.out.println("(log) KcmMemberScr.funcSelector() entered");
		// dataScanner�� ����ڿ��� �Է°� �޾ƿ��� (function ����, ������ �Է�)
		// �Է°��� �������� �Լ� ȣ��
		boolean flag = false;
		boolean controller = true;
		KcmMemberVO kmvo = null;
		String sVal = "";
		
		// ��� ����
		System.out.println(FUNC_SELECTOR_ANNOUNCE);
		Scanner sc = new Scanner(System.in);
		int selector = sc.nextInt();
		sc.close();
		if (selector == 0) controller = false; 
		
		kmvo = KcmMemberScr.dataScanner(selector);
		if (selector == 3){
			System.out.println(LIKE_SEARCH_ANNOUNCE);
			Scanner sc_3 = new Scanner(System.in);
			sVal = sc_3.nextLine();
			sc_3.close();
		}
		if (selector == 5){
			System.out.println(NEW_PASS_ANNOUNCE);
			Scanner sc_3 = new Scanner(System.in);
			sVal = sc_3.nextLine();
			sc_3.close();
		}
		
		// select all
		if (selector == 1){
			List<KcmMemberVO> aList = null;
			KcmMemberScr kms = new KcmMemberScr();
			aList = kms.selectKcmMember();
			
			if (aList.size() > 0){
				for (int i=0; i < aList.size(); i++){
					KcmMemberVO kmvo_2 = aList.get(i);
					KcmMemberScr.displayFunc(kmvo_2);
				}
			}
		}
		
		// search
		if (selector == 2){
			List<KcmMemberVO> aList = null;
			KcmMemberScr kms = new KcmMemberScr();
			aList = kms.searchKcmMember(kmvo);

			if (aList.size() > 0){
				for (int i=0; i < aList.size(); i++){
					KcmMemberVO kmvo_2 = aList.get(i);
					KcmMemberScr.displayFunc(kmvo_2);
				}
			}
		}
		
		// like search
		if (selector == 3){
			List<KcmMemberVO> aList = null;
			KcmMemberScr kms = new KcmMemberScr();
			aList = kms.likeSearchKcmMember(sVal);
			
			if (aList.size() > 0){
				for (int i=0; i < aList.size(); i++){
					KcmMemberVO kmvo_2 = aList.get(i);
					KcmMemberScr.displayFunc(kmvo_2);
				}
			}
		}
		
		// insert
		if (selector == 4){
			KcmMemberScr kms = new KcmMemberScr();
			flag = kms.insertKcmMember(kmvo);
			if (flag){
				KcmMemberScr kms_2 = new KcmMemberScr();
				kms_2.selectKcmMember();
			}
		}

		// update
		if (selector == 5){
			KcmMemberScr kms = new KcmMemberScr();
			flag = kms.updateKcmMember(kmvo, sVal);
			if (flag){
				KcmMemberScr kms_2 = new KcmMemberScr();
				kms_2.selectKcmMember();
			}
		}

		// delete
		if (selector == 6){
			KcmMemberScr kms = new KcmMemberScr();
			flag = kms.deleteKcmMember(kmvo);
			if (flag){
				KcmMemberScr kms_2 = new KcmMemberScr();
				kms_2.selectKcmMember();
			}
		}
		
		System.out.println("(log) KcmMemberScr.funcSelector() left");
		return controller;
	}
	
	public static KcmMemberVO dataScanner(int selectFunc){
		System.out.println("(log) KcmMemberScr.dataScanner() entered");
		KcmMemberVO kmvo = null;
		List<String> sList = null;
		
		// �˻�
		if (selectFunc == 2){
			kmvo = new KcmMemberVO();
			System.out.println(SEARCH_ANNOUNCE);
			Scanner sc_2 = new Scanner(System.in);
			kmvo.setKid(sc_2.nextLine());
			sc_2.close();
			// check data
			KcmMemberScr.displayFunc(kmvo);
		}
		// ������ �߰�
		if (selectFunc == 4){
			// ������ ���
			sList = new ArrayList<String>();
			System.out.println(INSERT_ANNOUNCE);
			
			int j = 1;
			Scanner sc_2 = new Scanner(System.in);
			System.out.println(j + " : ");
			while(sc_2.hasNextLine()){
				String input = sc_2.nextLine();
				sList.add(input);
				j++;
				if(j != 9) System.out.println(j + " : ");
				if(j == 9) break;
			}
			sc_2.close();
			for (int i=0; i < sList.size(); i++){
				System.out.print(" " + sList.get(i));
			}
			kmvo = new KcmMemberVO();
			System.out.println(" ");
			kmvo.setKid(sList.get(0));
			kmvo.setKpw(sList.get(1));
			kmvo.setKname(sList.get(2));
			kmvo.setKemail(sList.get(3));
			kmvo.setKhp(sList.get(4));
			kmvo.setKbirth(sList.get(5));
			kmvo.setKpostno(sList.get(6));
			kmvo.setKjuso(sList.get(7));
			
			// check data
			KcmMemberScr.displayFunc(kmvo);
		}
		// ������ ����
		if (selectFunc == 5){
			kmvo = new KcmMemberVO();
			System.out.println(UPDATE_ANNOUNCE);
			Scanner sc_2 = new Scanner(System.in);
			kmvo.setKid(sc_2.nextLine());
			sc_2.close();
			// check data
			KcmMemberScr.displayFunc(kmvo);
		}
		// ������ ����
		if (selectFunc == 6){
			kmvo = new KcmMemberVO();
			System.out.println(DELETE_ANNOUNCE);
			Scanner sc_2 = new Scanner(System.in);
			kmvo.setKid(sc_2.nextLine());
			sc_2.close();
			// check data
			KcmMemberScr.displayFunc(kmvo);
		}
		
		return kmvo;
	}
	
	public List<KcmMemberVO> selectKcmMember(){
		System.out.println("(log) KcmMemberScr.selectKcmMember() entered");
		List<KcmMemberVO> aList = null;
		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
		aList = kmdao.selectKcmMember();
		System.out.println("aList.size() >>> " + aList.size());
		System.out.println("(log) KcmMemberScr.selectKcmMember() left");
		return aList;
	}
	
	public List<KcmMemberVO> searchKcmMember(KcmMemberVO _kmvo){
		System.out.println("(log) KcmMemberScr.searchKcmMember(KcmMemberVO _kmvo) entered");
		KcmMemberVO kmvo = _kmvo;
		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
		List<KcmMemberVO> aList = kmdao.searchKcmMember(kmvo);
		System.out.println("aList.size() >>> " + aList.size());
		System.out.println("(log) KcmMemberScr.searchKcmMember(KcmMemberVO _kmvo) left");
		return aList;
	}
	
	public List<KcmMemberVO> likeSearchKcmMember(String _sVal){
		System.out.println("(log) KcmMemberScr.likeSearchKcmMember(String _sVal) entered");
		List<KcmMemberVO> aList = null;
		String sVal = _sVal;
		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
		aList = kmdao.likeSearchKcmMember(sVal);
		System.out.println("aList.size() >>> " + aList.size());
		System.out.println("(log) KcmMemberScr.likeSearchKcmMember(String _sVal) left");
		return aList;
	}
	
	public boolean insertKcmMember(KcmMemberVO _kmvo){
		System.out.println("(log) KcmMemberScr.insertKcmMember(KcmMemberVO _kmvo) entered");
		boolean flag = false;
		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
		flag = kmdao.insertKcmMember(_kmvo);
		System.out.println("flag >>> " + flag);
		System.out.println("(log) KcmMemberScr.insertKcmMember(KcmMemberVO _kmvo) left");
		return flag;
	}
	
	public boolean updateKcmMember(KcmMemberVO _kmvo, String _sVal){
		System.out.println("(log) KcmMemberScr.updateKcmMember(KcmMemberVO _kmvo, String _sVal) entered");
		boolean flag = false;
		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
		flag = kmdao.updateKcmMember(_kmvo, _sVal);
		System.out.println("flag >>> " + flag);
		System.out.println("(log) KcmMemberScr.updateKcmMember(KcmMemberVO _kmvo, String _sVal) left");
		return flag;
	}
	
	public boolean deleteKcmMember(KcmMemberVO _kmvo){
		System.out.println("(log) KcmMemberScr.deleteKcmMember(KcmMemberVO _kmvo) entered");
		KcmMemberDAO kmdao = new KcmMemberDAOImpl();
		KcmMemberVO kmvo = _kmvo;
		boolean flag = kmdao.deleteKcmMember(kmvo);
		System.out.println("flag >>> " + flag);
		System.out.println("(log) KcmMemberScr.deleteKcmMember(KcmMemberVO _kmvo) left");
		return flag;
	}
	
	public static void displayFunc(List<KcmMemberVO> _aList){
		
	}
	public static void displayFunc(KcmMemberVO _kmvo){
//		System.out.println("(log) KcmMemberScr.displayFunc(KcmMemberVO _kmvo) entered");
		System.out.print("  " + _kmvo.getKmem());
		System.out.print(" " + _kmvo.getKid());
		System.out.print(" " + _kmvo.getKpw());
		System.out.print(" " + _kmvo.getKname());
		System.out.print(" " + _kmvo.getKemail());
		System.out.print(" " + _kmvo.getKhp());
		System.out.print(" " + _kmvo.getKbirth());
		System.out.print(" " + _kmvo.getKpostno());
		System.out.print(" " + _kmvo.getKjuso());
		System.out.print(" " + _kmvo.getKdeleteYN());
		System.out.print(" " + _kmvo.getKinsertdate());
		System.out.println(" " + _kmvo.getKupdatedate());
//		System.out.println("(log) KcmMemberScr.displayFunc(KcmMemberVO _kmvo) left");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("(log) KcmMemberScr.main() entered");
		boolean mflag = true;
		while (mflag){
			mflag = KcmMemberScr.funcSelector();
			
		}
		System.out.println("(log) KcmMemberScr.main() left");
	}

}
