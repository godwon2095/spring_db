package enrollBean;

public class EnrolledTime {
	private String c_name;
  private int t_time;

	public EnrolledTime() {
		c_name = null;
    t_time = 0;
	}

	public void setCName(String c_name) {
    this.c_name = c_name;
	}

  public void setTTime(int t_time) {
    this.t_time = t_time;
  }

	public String getCName() {
		return c_name;
	}

  public int getTTime() {
    return t_time;
  }
}
