package cn.ac.big.dp.util;

import java.beans.PropertyDescriptor;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Stack;

import org.apache.commons.beanutils.BeanUtils;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.GroupCondition;
import cn.ac.big.dp.bean.OrderCondition;
import cn.ac.big.dp.bean.SearchForm;

public class CommonUtils {
	
	public static <T> List<String> getBeanPropertyAsList(List<T> beans, Class<T> clazz, String propertyName) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		List<String> stringList = new ArrayList<String>();
		String value = null;
		for(T t : beans){
			value = BeanUtils.getProperty(t, "DRUG_NAME");
			stringList.add(value);
		}
		return stringList;
	}
	
	public static List<Condition> revertFormToList(SearchForm searchForm){
		
		List<Condition> conditionList = new ArrayList<Condition>();
		Stack<String> itemStack1 = new Stack<String>();
		Stack<String> itemStack2 = new Stack<String>();
		String andOr = "and";
		
		if(searchForm.getItemValue1() != null){
			List<String> ItemValues = Arrays.asList(searchForm.getItemValue1());
			Collections.reverse(ItemValues);
			itemStack1.addAll(ItemValues);
		}
		
		if(searchForm.getItemValue2() != null){
			List<String> ItemValues = Arrays.asList(searchForm.getItemValue2());
			Collections.reverse(ItemValues);
			itemStack2.addAll(ItemValues);
		}
		for(int i = 0; i < searchForm.getSubItem().length; i++){
			String mainField = null;
			if(searchForm.getMainItem()!=null && searchForm.getMainItem().length>0) {
				mainField = searchForm.getMainItem()[i];
			}
			String field = searchForm.getSubItem()[i];
			String fieldEn = searchForm.getSubItemEn()[i];
			String operator = searchForm.getOperator()[i];
			String testType = searchForm.getTestType()[i];
			String item = mainField + field;
			Object itemValue1 = null;
			Object itemValue2 = null;
			List<Object> itemValue1s = new ArrayList<Object>();
			if(!(operator.endsWith("normal")||operator.startsWith("sex")||operator.contains("judge_yes")||operator.contains("judge_no"))){
				itemValue1 = itemStack1.pop();
				if(operator.endsWith("region")){
					itemValue2 = itemStack2.pop();
				}
			}
			if("count_m".equals(operator)) {
				String[] values = itemValue1.toString().split("\\s|,");
				for(String value:values) {
					itemValue1s.add(value.trim());
				}
			}
			Condition c = new Condition(item, testType, mainField, field, fieldEn, operator, itemValue1, itemValue1s, itemValue2, andOr);
			andOr = searchForm.getRelation()[i];
			conditionList.add(c);
		}
		return conditionList;
	}
	public static List<String> reverseToStringCond1(List<Condition> condList) {
		List<String> condDisplay = new ArrayList<String>();
		for(int j = 0; j < condList.size(); j++){
			String andOr = " ";
			if(j != 0){
				andOr = " "+ condList.get(j).getAndOr()+" ";
			}
			String fieldName = condList.get(j).getFieldName();
			String operator = condList.get(j).getOperator();
			Object value1 = condList.get(j).getValue1();
			Object value2 = condList.get(j).getValue2();
			if((value1!=null && "".equals(value1))||(value2!=null && "".equals(value2))) {
				condDisplay.add(andOr + "检验\\检查过" + fieldName);
			}
			else if(operator.endsWith("eq")||"count_1".equals(operator))
				condDisplay.add(andOr + fieldName + "=" + value1);
			else if(operator.endsWith("lt"))
				condDisplay.add(andOr + fieldName + "<" + value1);
			else if(operator.endsWith("gt"))
				condDisplay.add(andOr + fieldName + ">" + value1);
			else if("nlt".equals(operator))
				condDisplay.add(andOr + fieldName + ">=" + value1);
			else if("ngt".equals(operator))
				condDisplay.add(andOr + fieldName + "<=" + value1);
			else if(operator.endsWith("region"))
				condDisplay.add(andOr + value1 + "<=" + fieldName + "<=" + value2);
			else if("string_lk".equals(operator))
				condDisplay.add(andOr + fieldName + "如：" + value1);
			else if("count_m".equals(operator))
				condDisplay.add(andOr + fieldName + "在(" + value1 +")中");
			else if("normal".equals(operator))
				condDisplay.add(andOr + fieldName + "：正常");
			else if("unnormal".equals(operator))
				condDisplay.add(andOr + fieldName + "：不正常");
			else if("sex_m".equals(operator))
				condDisplay.add(andOr + fieldName + "：男");
			else if("sex_f".equals(operator))
				condDisplay.add(andOr + fieldName + "：女");
			else if("judge_yes".equals(operator))
				condDisplay.add(andOr + fieldName + "：是");
			else if("judge_no".equals(operator))
				condDisplay.add(andOr + fieldName + "：不是");
			else if("judge_include".equals(operator))
				condDisplay.add(andOr + fieldName + "：包含("+value1+")");
			else if("judge_exclude".equals(operator))
				condDisplay.add(andOr + fieldName + "：排除");
			
		}
		return condDisplay;
	}
	public static List<OrderCondition> reverseToStringCond(List<GroupCondition> condList){
		
		List<OrderCondition> orderCondList = new ArrayList<OrderCondition>();
		List<String> condDisplay = null;
		for(int i = 0; i < condList.size(); i++){
			String goupId = condList.get(i).getGroup();
			condDisplay = new ArrayList<String>();
			for(int j = 0; j < condList.get(i).getGroupList().size(); j++){
				String andOr = " ";
				if(j != 0){
					andOr = " "+condList.get(i).getGroupList().get(j).getAndOr()+" ";
				}
				String fieldName = condList.get(i).getGroupList().get(j).getFieldName();
				String operator = condList.get(i).getGroupList().get(j).getOperator();
				Object value1 = condList.get(i).getGroupList().get(j).getValue1();
				Object value2 = condList.get(i).getGroupList().get(j).getValue2();
				
				if(operator.endsWith("eq")||"count_1".equals(operator))
					condDisplay.add(andOr + fieldName + "=" + value1);
				else if(operator.endsWith("lt"))
					condDisplay.add(andOr + fieldName + "<" + value1);
				else if(operator.endsWith("gt"))
					condDisplay.add(andOr + fieldName + ">" + value1);
				else if("nlt".equals(operator))
					condDisplay.add(andOr + fieldName + ">=" + value1);
				else if("ngt".equals(operator))
					condDisplay.add(andOr + fieldName + "<=" + value1);
				else if(operator.endsWith("region"))
					condDisplay.add(andOr + value1 + "<=" + fieldName + "<=" + value2);
				else if("string_lk".equals(operator))
					condDisplay.add(andOr + fieldName + "如：" + value1);
				else if("count_m".equals(operator))
					condDisplay.add(andOr + fieldName + "在(" + value1 +")中");
				else if("normal".equals(operator))
					condDisplay.add(andOr + fieldName + "：正常");
				else if("unnormal".equals(operator))
					condDisplay.add(andOr + fieldName + "：不正常");
				else if("sex_m".equals(operator))
					condDisplay.add(andOr + fieldName + "：男");
				else if("sex_f".equals(operator))
					condDisplay.add(andOr + fieldName + "：女");
				else if("judge_yes".equals(operator))
					condDisplay.add(andOr + fieldName + "：是");
				else if("judge_no".equals(operator))
					condDisplay.add(andOr + fieldName + "：不是");
				else if("judge_include".equals(operator))
					condDisplay.add(andOr + fieldName + "：包含");
				else if("judge_exclude".equals(operator))
					condDisplay.add(andOr + fieldName + "：排除");
			}
			OrderCondition oc = new OrderCondition(goupId, condDisplay);
			orderCondList.add(oc);
		}
		return orderCondList;
	}
	
	public static <T> List<String> getSelectFieldValue(String[] selectedField,List<T> resultList, Class<?> clazz) throws Exception{
		List<String> stringResultList = new ArrayList<String>();
		for(T t : resultList){
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i<selectedField.length; i++){
				PropertyDescriptor pd = new PropertyDescriptor(selectedField[i], Condition.class);
				//PropertyDescriptor[] ps = 
				//Introspector.getBeanInfo(a.getClass()).getPropertyDescriptors();
				Method method = pd.getReadMethod();
				Object value = method.invoke(t, new Object[]{});
				sb.append(value);
				if(i!=selectedField.length-1){
					sb.append("\t");
				}
			}
			stringResultList.add(sb.toString());
		}
		return stringResultList;
	}
	
}
