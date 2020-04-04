package bitcamp.java142.ch5.kcmjf.dao;

import java.util.List;

import bitcamp.java142.ch5.kcmjf.vo.KcmMemberVO;

public interface KcmMemberDAO {

	public List<KcmMemberVO> selectKcmMember();
	
	public List<KcmMemberVO> searchKcmMember(KcmMemberVO _kmvo);
	
	public List<KcmMemberVO> likeSearchKcmMember(String _sVal);
	
	public boolean insertKcmMember(KcmMemberVO _kmvo);
	
	public boolean updateKcmMember(KcmMemberVO _kmvo, String _sVal);
	
	public boolean deleteKcmMember(KcmMemberVO _kmvo);
	
	// login
	public List<KcmMemberVO> loginKcmMember(KcmMemberVO kvo);
}
