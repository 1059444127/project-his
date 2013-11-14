package cn.ac.dp.chart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import cn.ac.big.dp.bean.DiagCountDTO;
import cn.ac.big.dp.test.DiagMap;
import cn.ac.big.dp.util.ChartKV;

public class ChartUtils {
	private static final String[] colors = new String[]{"FFCC00","FFFF00","EB59CB","B1D1DC","C8A1D1","FF0000","800080","008040","0080C0"};
	
	public static PyramidChartJson producePyramidChart(List<DiagCountDTO> diagCount, String category, String diagName, Object result, String patientId, int hasDiag) {
		PyramidChart chart = new PyramidChart();
		
		String subfix = category.equals("aregion")?"岁":"年";
		String topic = category.equals("aregion")?"年龄":"发病时间";
		String time = category.equals("aregion")?"1-100周岁":"2008年-2013年";
		int chartType = category.equals("aregion")?0:1;
		
		chart.setCaption("疾病"+topic+"分布图");
		chart.setSubcaption(time);
		
		List<Data> data = new ArrayList<Data>();
		for(DiagCountDTO dcd : diagCount){
			String title = judgeRegion(dcd.getName(), chartType, result, patientId, hasDiag);
			data.add(new PyramidData(title+dcd.getName()+subfix, Integer.toString(dcd.getCount())));
		}
		List<Definition> definitions = new ArrayList<Definition>();
		ColumnDefinition definition = new ColumnDefinition("captionFont", "font");
		definitions.add(definition);
		definition = new ColumnDefinition("myShadow", "shadow");
		definitions.add(definition);
		
		List<Application> applications = new ArrayList<Application>();
		Application application = new Application("CAPTION", "captionFont");
		applications.add(application);
		application = new Application("DATAPLOT" ,"myShadow");
		applications.add(application);
		
		Styles style = new Styles();
		style.setApplication(applications);
		style.setDefinition(definitions);
		
		return new PyramidChartJson(chart, data, style);
	}
	private static String judgeRegion(String name, int chartType, Object result, String patientId, int hasDiag) {
		if(result==null || hasDiag==0) {
			return "";
		}
		if(chartType==0) {
			String[] aregion = new String[]{"1-10","11-20","21-30","31-40","41-50","51-60","61-70","71-80","81-90","91-100"};
			int age = (Integer)result;
			int index = (age-1) / 10;
			String myAgeRegion = aregion[index];
			
			if(name.equals(myAgeRegion)) {
				return "★"+patientId+"★  ";
			} else {
				return "";
			}
		} else {
			if(result.toString().equals(name)) {
				return "★"+patientId+"★  ";
			} else {
				return "";
			}
		}
	}
	/**
	 * 画Stack2D图
	 * @param diagNames 
	 * @param dividedCategoryList
	 * @param patientDiags 
	 * @param patientId 
	 * @return
	 */
	public static StackChartJson produceStack2DChart(List<String> diagNames, Map<String, List<DiagCountDTO>> dividedCategoryList, List<String> patientDiags, String patientId) {
		StackChart chart = new StackChart();
		chart.setBgcolor("E9E9E9");
		chart.setOutcnvbasefontcolor("666666");
		chart.setCaption("Monthly Sales Summary Comparison");
		chart.setXaxisname("病例数量");
		chart.setYaxisname("疾病");
		chart.setFormatnumberscale("0");
		chart.setUnescapeLinks("0");
		chart.setShowvalues("0");
		chart.setNumberprefix("");
		chart.setNumvdivlines("10");
		chart.setShowalternatevgridcolor("1");
		chart.setAlternatevgridcolor("e1f5ff");
		chart.setDivlinecolor("e1f5ff");
		chart.setVdivlinecolor("e1f5ff");
		chart.setBasefontcolor("666666");
		chart.setTooltipbgcolor("F3F3F3");
		chart.setTooltipbordercolor("666666");
		chart.setCanvasbordercolor("666666");
		chart.setCanvasborderthickness("1");
		chart.setShowplotborder("1");
		chart.setPlotfillalpha("80");
		
		
		List<Category> categoryList = new ArrayList<Category>();
		
		List<Data> dataList = null;
		List<DiagCountDTO> count = null;
		DataSet dataSet = null;
		List<DataSet> dataSetList = new ArrayList<DataSet>();
		Random colorSeed = new Random();
		boolean flag = false;
		Category category = null;
		List<Integer> hasDiag = null;
		
		for(String key : dividedCategoryList.keySet()) {
			count = dividedCategoryList.get(key);
			dataList = new ArrayList<Data>();
			for(int x =0; x<count.size(); x++) {
				if(!flag) {
					hasDiag = Arrays.asList(new Integer[count.size()]);
					if(patientDiags!=null && patientDiags.size()>0 && patientDiags.contains(count.get(x).getSubject())) {
						category = new Category("★"+patientId+"★"+count.get(x).getSubject());
						hasDiag.set(x, 1);
					} else {
						category = new Category(count.get(x).getSubject());
						hasDiag.set(x, 0);
					}
					categoryList.add(category);
				}
				System.out.println(count.get(x).getSubject()+"->"+DiagMap.getKey(count.get(x).getSubject()));
				dataList.add(new StackData(Integer.toString(count.get(x).getCount()),"javascript:showAgeDistibution('"+ DiagMap.getKey(count.get(x).getSubject()) +"','"+ hasDiag.get(x) +"')"));
			}
			int colorNum = colorSeed.nextInt(colors.length);
			dataSet = new DataSet(key, colors[colorNum], colors[colorNum], colors[colorNum], dataList);
			dataSetList.add(dataSet);
			flag = true;
		}
		
		Categories categories = new Categories(categoryList);
		List<Categories> categoriesList = new ArrayList<Categories>();
		categoriesList.add(categories);
		
		Application application = new Application("TRENDLINES", "TrendAnim");
		List<Application> applicationList = new ArrayList<Application>();
		applicationList.add(application);
		
		StackDefinition definition = new StackDefinition();
		List<Definition> definitionList = new ArrayList<Definition>();
		definitionList.add(definition);
		
		Styles styles = new Styles(definitionList, applicationList);
		StackChartJson chartJson = new StackChartJson(chart, categoriesList, dataSetList, styles);
		return chartJson;
	}
	public static PieChartJson productPieChart(String diagName, Map<String,DiagCountDTO> values) {
		
		PieChart chart = new PieChart();
		chart.setCaption(diagName);
		chart.setFormatnumberscale("0");
		chart.setUnescapeLinks("0");
		
		List<Data> data = new ArrayList<Data>();
		Iterator<String> it = values.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			String dName = key.substring(0, key.lastIndexOf("-"));
			String dValue = key.substring(key.lastIndexOf("-")+1);
			String value = Integer.toString(values.get(key).getCount());
			key = key.endsWith("1")?key.substring(0,key.lastIndexOf("1")-1):key;
			data.add(new PieData(key,value,"javascript:showPatientTable('"+ DiagMap.getKey(dName) +"','"+ DiagMap.getKey(dValue) +"')"));
		}
		
		PieChartJson chartJson = new PieChartJson();
		chartJson.setData(data);
		chartJson.setChart(chart);
		return chartJson;
	}
	public static ColumnChartJson produceColumnChart(List<String> diagNames, Map<String,DiagCountDTO> values){
		
		ColumnChart chart = new ColumnChart();
		chart.setCaption("疾病分布图");
		chart.setShowvalues("0");
		chart.setPalette("2");
		chart.setXaxisname("疾病");
		chart.setYaxisname("病例");
		chart.setDecimals("0");
		chart.setFormatnumberscale("0");
		chart.setUnescapeLinks("0");
		
		List<Data> data = new ArrayList<Data>();
		Iterator<String> it = values.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			String value = Integer.toString(values.get(key).getCount());
			data.add(new ColumnData(key,value,"javascript:showDetail('"+ DiagMap.getKey(key) +"')"));
		}
		
		List<Definition> definitions = new ArrayList<Definition>();
		ColumnDefinition definition = new ColumnDefinition("myAnim","animation");
		definitions.add(definition);
		
		List<Application> applications = new ArrayList<Application>();
		Application application = new Application("VLINES", "myAnim");
		applications.add(application);
		
		Styles style = new Styles();
		style.setApplication(applications);
		style.setDefinition(definitions);
		
		ColumnChartJson chartJson = new ColumnChartJson();
		chartJson.setChart(chart);
		chartJson.setStyles(style);
		chartJson.setData(data);
		
		return chartJson;
	}
	public static LineChartJson produceHeightLineChart(List<ChartKV> valueList, String[] reference){
		
		/*
		 * category
		 */
		LineChart chart = new LineChart("检验指标(白细胞计数)", "(单位(10^9/L))", "1", "0", "0", "2", "20", "CC3300", "1", "1", "CC3300", "40", "2", "5", "35", "FFFFFF,CC3300", "330", "10,10", "5", "RIGHT");
		List<Category> categoryList = new ArrayList<Category>();
		
		for(int i = 0; i<valueList.size();i++)
		{
			ChartKV ckv = valueList.get(i);
			Category category = new Category(ckv.getDate());
			categoryList.add(category);
		}
		Categories categories = new Categories(categoryList);
		List<Categories> categoriesList = new ArrayList<Categories>();
		categoriesList.add(categories);
		
		/*
		 * data
		 */
		List<Data> resultDataList = new ArrayList<Data>();
		List<Data> referLowDataList = new ArrayList<Data>();
		List<Data> referHighDataList = new ArrayList<Data>();
		for(ChartKV ckv : valueList){
			Data data = new LineData(ckv.getValue());
			if(reference!=null) {
				Data data1 = new LineData(reference[1]);
				referHighDataList.add(data1);
				Data data2 = new LineData(reference[0]);
				referLowDataList.add(data2);
			}
			resultDataList .add(data);
		}
		
		
		DataSet resultDataSet = new DataSet("实际数值", "1D8BD1", "1D8BD1", "1D8BD1", resultDataList);
		DataSet referLowDataSet = new DataSet("最低数值", "00CC00", "00CC00", "00CC00", referLowDataList);
		DataSet referHighDataSet = new DataSet("最高数值", "FF3300", "FF3300", "FF3300", referHighDataList);
		List<DataSet> dataSetList = new ArrayList<DataSet>();
		dataSetList.add(resultDataSet);
		dataSetList.add(referHighDataSet);
		dataSetList.add(referLowDataSet);
		
		Application application1 = new Application("CAPTION", "CaptionFont");
		List<Application> applicationList = new ArrayList<Application>();
		applicationList.add(application1);
		
		LineDefinition definition = new LineDefinition("CaptionFont","font","12");
		List<Definition> definitionList = new ArrayList<Definition>();
		definitionList.add(definition);
		
		Styles styles = new Styles(definitionList, applicationList);
		
		LineChartJson json = new LineChartJson(chart, categoriesList, dataSetList, styles);
		return json;
		
	}
}
