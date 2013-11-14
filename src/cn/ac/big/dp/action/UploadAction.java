package cn.ac.big.dp.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;

import cn.ac.big.dp.bean.Dict;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.service.impl.DictService;
import cn.ac.big.dp.service.impl.DrugService;
import cn.ac.big.dp.util.ExcelUtils;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File fileupload;
	private String fileuploadFileName;
	private Map<String,Object> resultMap = new HashMap<String, Object>();
	private List<Dict> labDictList;
	private List<Dict> examDictList;
	private List<Dict> diagDictList;
	private List<Drug> drugDictList;
	
	private DictService dictService;
	private DrugService drugService;

	
	public String index() {
		labDictList = dictService.getDisplayRootDictByParams("检验");
		examDictList = dictService.getDisplayRootDictByParams("检查");
		diagDictList = dictService.getDisplayRootDictByParams("诊断信息");
		drugDictList = drugService.getAllDrugs();
		return SUCCESS;
	}
	
	public String uploadBasic() throws FileNotFoundException, IOException {
		String path = ServletActionContext.getServletContext().getRealPath("/upload");
		fileuploadFileName = Long.toString(new Date().getTime());
		IOUtils.copy(new FileInputStream(fileupload), new FileOutputStream(path+File.separator+fileuploadFileName+".xls"));
		try {
			resultMap = ExcelUtils.readProperties(new FileInputStream(fileupload));
			resultMap.put("fileId", fileuploadFileName);
			resultMap.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "模板填写格式有误！");
		}
		return SUCCESS;
	}
	
	/**
	 * 上传检验、检查、诊断、带药信息
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public String uploadTed() throws FileNotFoundException, IOException {
		String path = ServletActionContext.getServletContext().getRealPath("/upload");
		fileuploadFileName = Long.toString(new Date().getTime());
		
		//写文件到文件上传目录
		IOUtils.copy(new FileInputStream(fileupload), new FileOutputStream(path+File.separator+fileuploadFileName+".xls"));
		try {
			
			//抽取Excel中的属性
			resultMap = ExcelUtils.readProperties(new FileInputStream(fileupload));
			
			//将检查\检验\诊断\带药map<String, List<TestItem>>存入session，正式入库时取出
			for(String key : resultMap.keySet()) {
				if("lab".equals(key)||"exam".equals(key)||"diag".equals(key)||"drug".equals(key)) {
					ServletActionContext.getRequest().getSession().setAttribute(key, resultMap.get(key));
				}
			}
			resultMap.put("fileId", fileuploadFileName);
			resultMap.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "模板填写格式有误！");
		} 
		return SUCCESS;
	}
	
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public Map<String, Object> getResultMap() {
		return resultMap;
	}
	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}
	public List<Dict> getLabDictList() {
		return labDictList;
	}
	public void setLabDictList(List<Dict> labDictList) {
		this.labDictList = labDictList;
	}
	public List<Dict> getExamDictList() {
		return examDictList;
	}
	public void setExamDictList(List<Dict> examDictList) {
		this.examDictList = examDictList;
	}
	public List<Dict> getDiagDictList() {
		return diagDictList;
	}
	public void setDiagDictList(List<Dict> diagDictList) {
		this.diagDictList = diagDictList;
	}
	public List<Drug> getDrugDictList() {
		return drugDictList;
	}
	public void setDrugDictList(List<Drug> drugDictList) {
		this.drugDictList = drugDictList;
	}
	public void setDrugService(DrugService drugService) {
		this.drugService = drugService;
	}
	public DictService getDictService() {
		return dictService;
	}
	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}	
