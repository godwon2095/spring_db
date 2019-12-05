package courseBean;

public class Course {
	private String c_id;
  private String c_id_no;
  private String c_name;
  private String c_unit;

	public Course() {
		c_id = null;
		c_id_no = null;
		c_name = null;
		c_unit = null;
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
}
