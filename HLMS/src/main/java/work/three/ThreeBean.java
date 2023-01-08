package work.three;

import java.io.Serializable;

public class ThreeBean implements Serializable{
	private String appCode;     //지원서코드
	private String pUserCode;     //교수코드
	private String sUserCode;     //학생코드
	private String motive;			 //지원이유
	private String tuition;    //수강료
	private String virAcc;    //가상계좌
	private String appStatus;    //지원상태   0:신청학생, 1:면접대상자, 2:최종합격자 명단
	private String major;    //지원상태   0:신청학생, 1:면접대상자, 2:최종합격자 명단

	public ThreeBean() {
		super();
	}

	public ThreeBean(String appCode, String pUserCode, String sUserCode,
			String motive, String tuition, String virAcc, String appStatus,
			String major) {
		super();
		this.appCode = appCode;
		this.pUserCode = pUserCode;
		this.sUserCode = sUserCode;
		this.motive = motive;
		this.tuition = tuition;
		this.virAcc = virAcc;
		this.appStatus = appStatus;
		this.major = major;
	}

	public String getAppCode() {
		return appCode;
	}

	public void setAppCode(String appCode) {
		this.appCode = appCode;
	}

	public String getpUserCode() {
		return pUserCode;
	}

	public void setpUserCode(String pUserCode) {
		this.pUserCode = pUserCode;
	}

	public String getsUserCode() {
		return sUserCode;
	}

	public void setsUserCode(String sUserCode) {
		this.sUserCode = sUserCode;
	}

	public String getMotive() {
		return motive;
	}

	public void setMotive(String motive) {
		this.motive = motive;
	}

	public String getTuition() {
		return tuition;
	}

	public void setTuition(String tuition) {
		this.tuition = tuition;
	}

	public String getVirAcc() {
		return virAcc;
	}

	public void setVirAcc(String virAcc) {
		this.virAcc = virAcc;
	}

	public String getAppStatus() {
		return appStatus;
	}

	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ThreeBean [appCode=");
		builder.append(appCode);
		builder.append(", pUserCode=");
		builder.append(pUserCode);
		builder.append(", sUserCode=");
		builder.append(sUserCode);
		builder.append(", motive=");
		builder.append(motive);
		builder.append(", tuition=");
		builder.append(tuition);
		builder.append(", virAcc=");
		builder.append(virAcc);
		builder.append(", appStatus=");
		builder.append(appStatus);
		builder.append(", major=");
		builder.append(major);
		builder.append("]");
		return builder.toString();
	}

}
