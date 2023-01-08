package work.user;

import java.io.Serializable;

public class UserBean implements Serializable{
	private String userCode;         //유저코드
	private String loginId;               //아이디
	private String pw;               //패스워드
	private String email;            //이메일
	private String name;             //이름
	private String birth;            //생년월일
	private String phoneCd;          //전화번호앞자리코드
	private String phoneNum;         //전화번호뒷자리
	private String sex;              //성별
	private String entDate;          //회원가입일
	private String grade;			 //회원등급
	private String connectDate;		 //최근접속시간

	public UserBean() {
		super();
	}

	public UserBean(String userCode, String loginId, String pw, String email,
			String name, String birth, String phoneCd, String phoneNum,
			String sex, String entDate, String grade, String connectDate) {
		super();
		this.userCode = userCode;
		this.loginId = loginId;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.phoneCd = phoneCd;
		this.phoneNum = phoneNum;
		this.sex = sex;
		this.entDate = entDate;
		this.grade = grade;
		this.connectDate = connectDate;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhoneCd() {
		return phoneCd;
	}

	public void setPhoneCd(String phoneCd) {
		this.phoneCd = phoneCd;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEntDate() {
		return entDate;
	}

	public void setEntDate(String entDate) {
		this.entDate = entDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getConnectDate() {
		return connectDate;
	}

	public void setConnectDate(String connectDate) {
		this.connectDate = connectDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserBean [userCode=");
		builder.append(userCode);
		builder.append(", loginId=");
		builder.append(loginId);
		builder.append(", pw=");
		builder.append(pw);
		builder.append(", email=");
		builder.append(email);
		builder.append(", name=");
		builder.append(name);
		builder.append(", birth=");
		builder.append(birth);
		builder.append(", phoneCd=");
		builder.append(phoneCd);
		builder.append(", phoneNum=");
		builder.append(phoneNum);
		builder.append(", sex=");
		builder.append(sex);
		builder.append(", entDate=");
		builder.append(entDate);
		builder.append(", grade=");
		builder.append(grade);
		builder.append(", connectDate=");
		builder.append(connectDate);
		builder.append("]");
		return builder.toString();
	}

}
