package cn.ac.big.dp.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.dp.bean.Diagnose;
import cn.ac.big.dp.service.IDiagnoseService;

import com.opensymphony.xwork2.ActionSupport;

public class ReportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String patientId;
	private String visitId;
	private IDiagnoseService diagnoseService;
	private List<ReportFile> reportFileList = new ArrayList<ReportFile>();
	private List<Diagnose> diagList;
	
	public List<ReportFile> getReportFileList() {
		return reportFileList;
	}

	public void setReportFileList(List<ReportFile> reportFileList) {
		this.reportFileList = reportFileList;
	}
	public String reportList(){
		diagList = diagnoseService.selectDiagByParams(patientId, visitId);
		String webRootPath = ServletActionContext.getServletContext().getRealPath("/");
		String fileDir = webRootPath + "report" + File.separator + patientId + "_"+visitId;
		File file = new File(fileDir);
		if(file.exists()&&file.isDirectory()){
			File[] subFiles = file.listFiles();
			for(File f : subFiles){
				ReportFile rf = new ReportFile(f.getName(), "report/" + patientId + "_" + visitId + "/" + f.getName());
				reportFileList.add(rf);
			}
		}
		return SUCCESS;
	}
	
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	public String getVisitId() {
		return visitId;
	}
	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}
	
	public void setDiagnoseService(IDiagnoseService diagnoseService) {
		this.diagnoseService = diagnoseService;
	}

	public List<Diagnose> getDiagList() {
		return diagList;
	}

	public void setDiagList(List<Diagnose> diagList) {
		this.diagList = diagList;
	}

	public static class ReportFile{
		private String fileName;
		private String path;
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
		public ReportFile(String fileName, String path) {
			super();
			this.fileName = fileName;
			this.path = path;
		}
		@Override
		public String toString() {
			return "ReportFile [fileName=" + fileName + ", path=" + path + "]";
		}
	}
}
