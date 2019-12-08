package courseBean;

public class Course {
	private String c_id;
  private String c_id_no;
  private String c_name;
  private String c_unit;
	private int t_max;
	private int enrolls_count;

	public Course() {
		c_id = null;
		c_id_no = null;
		c_name = null;
		c_unit = null;
		t_max = 0;
		enrolls_count = 0;
	}

	public void setCId(String c_id) {
		this.c_id = c_id;
	}

	public void setCIdNo(String c_id_no) {
		this.c_id_no = c_id_no;
	}

	public void setCName(String c_name) {
		this.c_name = c_name;
	}

	public void setCUnit(String c_unit) {
		this.c_unit = c_unit;
	}

	public void setTMax(int t_max) {
		this.t_max = t_max;
	}

	public void setEnrollsCount(int enrolls_count) {
		this.enrolls_count = enrolls_count;
	}

	public String getCId() {
		return c_id;
	}

	public String getCIdNo() {
		return c_id_no;
	}

	public String getCName() {
		return c_name;
	}

	public String getCUnit() {
		return c_unit;
	}

	public int getTMax() {
		return t_max;
	}

	public int getEnrollsCount() {
		return enrolls_count;
	}
}
