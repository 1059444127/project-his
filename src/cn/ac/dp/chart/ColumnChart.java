package cn.ac.dp.chart;

public class ColumnChart extends Chart {

	private String palette;
	private String caption;
	private String xaxisname;
	private String yaxisname;
	private String showvalues;
	private String decimals;
	private String formatnumberscale;
	private String unescapeLinks;
	private String exportEnabled = "1";
	private String exportAtClient = "1";
	private String exportHandler = "fcExporter2";
	private String exportFormats = "PDF=导出为PDF|PNG=导出为PNG图片|JPG=导出JPG图片";
	private String exportDialogMessage = "加载数据中:";

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

	public String getPalette() {
		return palette;
	}

	public void setPalette(String palette) {
		this.palette = palette;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getXaxisname() {
		return xaxisname;
	}

	public void setXaxisname(String xaxisname) {
		this.xaxisname = xaxisname;
	}

	public String getYaxisname() {
		return yaxisname;
	}

	public void setYaxisname(String yaxisname) {
		this.yaxisname = yaxisname;
	}

	public String getShowvalues() {
		return showvalues;
	}

	public void setShowvalues(String showvalues) {
		this.showvalues = showvalues;
	}

	public String getDecimals() {
		return decimals;
	}

	public void setDecimals(String decimals) {
		this.decimals = decimals;
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

}
