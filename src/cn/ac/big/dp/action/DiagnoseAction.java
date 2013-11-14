package cn.ac.big.dp.action;

import java.util.List;

import cn.ac.big.dp.service.IDiagnoseService;

import com.opensymphony.xwork2.ActionSupport;

public class DiagnoseAction extends ActionSupport {
	
	
	private static final long serialVersionUID = 1L;
	private IDiagnoseService diagnoseService;
	
	private List<String> diagNames;

	public String getDiagName() {
		diagNames = this.diagnoseService.selectAllDiagName();
		return SUCCESS;
	}
	
	public String getDiagNameM() {
		diagNames = this.diagnoseService.selectAllDiagName();
		return "success_m";
	}

	public List<String> getDiagNames() {
		return diagNames;
	}

	public void setDiagNames(List<String> diagNames) {
		this.diagNames = diagNames;
	}

	public void setDiagnoseService(IDiagnoseService diagnoseService) {
		this.diagnoseService = diagnoseService;
	}
}
