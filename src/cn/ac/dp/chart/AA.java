package cn.ac.dp.chart;

public class AA extends A{
	private String name;
	public AA(String name) {
		super();
		this.name = name;
	}
	public String toString() {
		return name;
	}
	public static void main(String[] args) {
		A a = new AA("name");
		System.out.println(a);
	}
}
