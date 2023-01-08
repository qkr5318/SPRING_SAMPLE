package work.sche;

import java.io.Serializable;

public class ScheBean implements Serializable{
	private String scheNo;     	//일정번호
	private String userCode;    	//유저코드
	private String scheTitle;      //일정제목
	private String scheContents;   //일정내용
	private String scheDate;       //일정작성일자
	private String scheStartDate;   //기한(시작)
	private String scheEndDate;	   //기한(끝)
	private String scheHits;       //일정조회수

	public ScheBean() {
		super();
	}

	public ScheBean(String scheNo, String userCode, String scheTitle,
			String scheContents, String scheDate, String scheStartDate,
			String scheEndDate, String scheHits) {
		super();
		this.scheNo = scheNo;
		this.userCode = userCode;
		this.scheTitle = scheTitle;
		this.scheContents = scheContents;
		this.scheDate = scheDate;
		this.scheStartDate = scheStartDate;
		this.scheEndDate = scheEndDate;
		this.scheHits = scheHits;
	}

	public String getScheNo() {
		return scheNo;
	}

	public void setScheNo(String scheNo) {
		this.scheNo = scheNo;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getScheTitle() {
		return scheTitle;
	}

	public void setScheTitle(String scheTitle) {
		this.scheTitle = scheTitle;
	}

	public String getScheContents() {
		return scheContents;
	}

	public void setScheContents(String scheContents) {
		this.scheContents = scheContents;
	}

	public String getScheDate() {
		return scheDate;
	}

	public void setScheDate(String scheDate) {
		this.scheDate = scheDate;
	}

	public String getScheStartDate() {
		return scheStartDate;
	}

	public void setScheStartDate(String scheStartDate) {
		this.scheStartDate = scheStartDate;
	}

	public String getScheEndDate() {
		return scheEndDate;
	}

	public void setScheEndDate(String scheEndDate) {
		this.scheEndDate = scheEndDate;
	}

	public String getScheHits() {
		return scheHits;
	}

	public void setScheHits(String scheHits) {
		this.scheHits = scheHits;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ScheBean [scheNo=");
		builder.append(scheNo);
		builder.append(", userCode=");
		builder.append(userCode);
		builder.append(", scheTitle=");
		builder.append(scheTitle);
		builder.append(", scheContents=");
		builder.append(scheContents);
		builder.append(", scheDate=");
		builder.append(scheDate);
		builder.append(", scheStartDate=");
		builder.append(scheStartDate);
		builder.append(", scheEndDate=");
		builder.append(scheEndDate);
		builder.append(", scheHits=");
		builder.append(scheHits);
		builder.append("]");
		return builder.toString();
	}
}
