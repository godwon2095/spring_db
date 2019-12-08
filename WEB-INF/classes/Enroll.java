package enrollBean;

public class Enroll {
	private int e_id;
	private String c_id;
	private int c_id_no;
	private String c_name;
	private int c_unit;
	private int p_amount;
	private Boolean e_success;

	public Enroll() {
		e_id = 0;
		c_id = null;
		c_id_no = 0;
		c_name = null;
		c_unit = 0;
		p_amount = 0;
		e_success = null;
	}

	public void setEId(int e_id) {
		this.e_id = e_id;
	}

	public void setCId(String c_id) {
		this.c_id = c_id;
	}

	public void setCIdNo(int c_id_no) {
		this.c_id_no = c_id_no;
	}

	public void setCName(String c_name) {
		this.c_name = c_name;
	}

	public void setCUnit(int c_unit) {
		this.c_unit = c_unit;
	}

	public void setPAmount(int p_amount) {
		this.p_amount = p_amount;
	}

	public void setESuccess(Boolean e_success) {
		this.e_success = e_success;
	}

	public int getEId() {
		return e_id;
	}

	public String getCId() {
		return c_id;
	}

	public int getCIdNo() {
		return c_id_no;
	}

	public String getCName() {
		return c_name;
	}

	public int getCUnit() {
		return c_unit;
	}

	public int getPAmount() {
		return p_amount;
	}

	public Boolean getESuccess() {
		return e_success;
	}
}
