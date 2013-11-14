package cn.ac.big.dp.util;

public class TypeUtils {
	
	public static double JudgeValueType(Object value) {
		Double result = null;
		if(value!=null) {
			try {
				result = Double.parseDouble(value.toString());
				return result;
			} catch (NumberFormatException e) {
				
			}
		}
		return 0;
	}
	
}
