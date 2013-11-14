package cn.ac.dp.chart;


public class PieChart extends Chart{
	
	private String caption;
	private String formatnumberscale;
	private String unescapeLinks;
	private String exportEnabled="1";
	private String exportAtClient="1";
	private String exportHandler="fcExporter1";
	private String exportFormats="PDF=导出为PDF|PNG=导出为PNG图片|JPG=导出JPG图片";
	private String exportDialogMessage="加载数据中:";
	
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getFormatnumberscale() {
		return formatnumberscale;
	}
	public void setFormatnumberscale(String formatnumberscale) {
		this.formatnumberscale = formatnumberscale;
	}
	public String getUnescapeLinks() {
		return unescapeLinks;
	}
	public void setUnescapeLinks(String unescapeLinks) {
		this.unescapeLinks = unescapeLinks;
	}
	public String getExportEnabled() {
		return exportEnabled;
	}
	public void setExportEnabled(String exportEnabled) {
		this.exportEnabled = exportEnabled;
	}
	public String getExportAtClient() {
		return exportAtClient;
	}
	public void setExportAtClient(String exportAtClient) {
		this.exportAtClient = exportAtClient;
	}
	public String getExportHandler() {
		return exportHandler;
	}
	public void setExportHandler(String exportHandler) {
		this.exportHandler = exportHandler;
	}
	public String getExportFormats() {
		return exportFormats;
	}
	public void setExportFormats(String exportFormats) {
		this.exportFormats = exportFormats;
	}
	public String getExportDialogMessage() {
		return exportDialogMessage;
	}
	public void setExportDialogMessage(String exportDialogMessage) {
		this.exportDialogMessage = exportDialogMessage;
	}
}
