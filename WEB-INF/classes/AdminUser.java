package adminUserBean;

public class AdminUser {
  private int a_id;
  private String a_email;
  private String a_pwd;

  public AdminUser() {
    a_id = 0;
    a_email = null;
    a_pwd = null;
  }

  public void setAID(int a_id) {
    this.a_id = a_id;
  }

  public void setAEmail(String a_email) {
    this.a_email = a_email;
  }

  public void setAPwd(String a_pwd) {
    this.a_pwd = a_pwd;
  }

  public int getAID() {
    return a_id;
  }

  public String getAEmail() {
    return a_email;
  }

  public String getAPwd() {
    return a_pwd;
  }
}
