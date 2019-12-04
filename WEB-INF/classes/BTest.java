package BTest;

public class BTest {
  private int cnt = 0;

  public String getMsg() {
    return "getMsg() Called";
  }

  public int getCnt() {
    return ++cnt;
  }
}
