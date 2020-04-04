package bitcamp.java142.ch5.board.vo;

public class KcmHelloBoardVO {
	private String kno;
	private String ksubject;
	private String kname;
	private String kpw;
	private String kmemo;
	private String kdeleteyn;
	private String kinsertdate;
	private String kupdatedate;
	
	
	public KcmHelloBoardVO() {
	}

	public KcmHelloBoardVO(String kno, String kdeleteyn) {
		this.kno = kno;
		this.kdeleteyn = kdeleteyn;
	}

	public KcmHelloBoardVO(String kno
						 , String ksubject
						 , String kmemo) {
		this.kno = kno;
		this.ksubject = ksubject;
		this.kmemo = kmemo;
	}
	
	public KcmHelloBoardVO(String ksubject, 
						   String kname, 
						   String kpw, 
						   String kmemo, 
						   String kdeleteyn) {
		this.ksubject = ksubject;
		this.kname = kname;
		this.kpw = kpw;
		this.kmemo = kmemo;
		this.kdeleteyn = kdeleteyn;
	}

	public KcmHelloBoardVO(String kno
						  ,String ksubject
						  ,String kname
						  ,String kpw
						  ,String kmemo
						  ,String kdeleteyn
						  ,String kinsertdate
						  ,String kupdatedate) {
		this.kno = kno;
		this.ksubject = ksubject;
		this.kname = kname;
		this.kpw = kpw;
		this.kmemo = kmemo;
		this.kdeleteyn = kdeleteyn;
		this.kinsertdate = kinsertdate;
		this.kupdatedate = kupdatedate;
	}

	public String getKno() {
		return kno;
	}
	public void setKno(String kno) {
		this.kno = kno;
	}
	public String getKsubject() {
		return ksubject;
	}
	public void setKsubject(String ksubject) {
		this.ksubject = ksubject;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getKpw() {
		return kpw;
	}
	public void setKpw(String kpw) {
		this.kpw = kpw;
	}
	public String getKmemo() {
		return kmemo;
	}
	public void setKmemo(String kmemo) {
		this.kmemo = kmemo;
	}
	public String getKdeleteyn() {
		return kdeleteyn;
	}
	public void setKdeleteyn(String kdeleteyn) {
		this.kdeleteyn = kdeleteyn;
	}
	public String getKinsertdate() {
		return kinsertdate;
	}
	public void setKinsertdate(String kinsertdate) {
		this.kinsertdate = kinsertdate;
	}
	public String getKupdatedate() {
		return kupdatedate;
	}
	public void setKupdatedate(String kupdatedate) {
		this.kupdatedate = kupdatedate;
	}
	
	
}
