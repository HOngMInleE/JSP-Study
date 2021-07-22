package mission;

public class MemberBean {

	String name;
	String userId;
	String userPwd;
	String email;
	String phone;
	String admin;
	
	public MemberBean() {
		super();
	}

	public MemberBean(String name, String userId, String userPwd, String email, String phone, String admin) {
		super();
		this.name = name;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.admin = admin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	
}
