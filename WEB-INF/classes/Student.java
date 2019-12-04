package studentBean;

public class Student {
	private String s_addr;
  private String s_pwd;
  private String s_college;
  private String s_major;

	public Student() {
		s_addr = null;
		s_pwd = null;
		s_college = null;
		s_major = null;
	}

	public void setSAddr(String s_addr) {
		this.s_addr = s_addr;
	}

	public void setSPwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}

	public void setSCollege(String s_college) {
		this.s_college = s_college;
	}

	public void setSMajor(String s_major) {
		this.s_major = s_major;
	}

	public String getSAddr() {
		return s_addr;
	}

	public String getSPwd() {
		return s_pwd;
	}

	public String getSCollege() {
		return s_college;
	}

	public String getSMajor() {
		return s_major;
	}
}
