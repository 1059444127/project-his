package cn.ac.big.dp.test;

import java.util.List;

public class A <T>{
	public static <D> void test(List<D> list) {
		for(D d:list){
			System.out.println(d);
		}
	}
	public static void main(String[] args) {
		
		A<Object> a = new A<Object>();
		
	}
}
