package cn.ac.big.dp.test;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class GetSubUniqueItem {
	
	public static void main(String[] args) {
		
		Connection conn = DBManager.getConnection();
		List<NewWb> wbList = getAllSubItem();
		String sql = "insert into tb_dict_sub(dict_name, type, status, exam_lab_flag, unit, context) values(?,?,?,?,?,?)";
		for(NewWb nw : wbList) {
			DBUtils.insertObject(conn, sql, new String[]{nw.getDictName(),String.valueOf(nw.getType()), nw.getStauts(), nw.getExamLabFlag(), nw.getUnit(),nw.getContext()});
		}
		DBManager.returnConnection(conn);
	}
	public static String getCellValue(Cell cell){
		String o = "";
		if(cell!=null){
			switch(cell.getCellType()){
			case Cell.CELL_TYPE_BLANK:
				o = "";break;
			case Cell.CELL_TYPE_BOOLEAN:
				o = String.valueOf(cell.getBooleanCellValue());break;
			case Cell.CELL_TYPE_NUMERIC:
				o = String.valueOf(cell.getNumericCellValue());break;
			case Cell.CELL_TYPE_STRING:
				o = cell.getStringCellValue();break;
			case Cell.CELL_TYPE_FORMULA:
				o = String.valueOf(cell.getCellFormula());break;
			default:
				o = "";
			}
		}
		return o;
	}
	private static List<NewWb> getAllSubItem() {
		List<NewWb> wbList = new ArrayList<NewWb>();
		File file = new File("d:/dict.xls");
		try {
			Workbook wb = WorkbookFactory.create(file);
			Sheet sheet = wb.getSheetAt(0);
			int rowNum = sheet.getLastRowNum();
			Row row = null;
			NewWb nw = null;
			for(int i=1; i<rowNum; i++) {
				row = sheet.getRow(i);
				String dictName = getCellValue(row.getCell(1));
				String unit = getCellValue(row.getCell(4));
				String context = getCellValue(row.getCell(5));
				nw = new NewWb(dictName, unit, context);
				wbList.add(nw);
			}
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return wbList;
	}
	
}
