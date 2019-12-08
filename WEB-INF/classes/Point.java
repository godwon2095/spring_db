package pointBean;

public class Point {
  private int p_amount;
  private String p_type;
  private String p_created_at;

  public Point() {
    p_amount = 0;
    p_type = null;
    p_created_at = null;
  }

  public void setPAmount(int p_amount) {
    this.p_amount = p_amount;
  }

  public void setPType(String p_type) {
    this.p_type = p_type;
  }

  public void setPCreatedAt(String p_created_at) {
    this.p_created_at = p_created_at;
  }

  public int getPAmount() {
    return p_amount;
  }

  public String getPType() {
    return p_type;
  }

  public String getPCreatedAt() {
    return p_created_at;
  }
}
