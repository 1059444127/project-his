package cn.ac.dp.chart;

/**
 * 
 * @author pangbo BUAA B1 GS112149A
 * 
 */
public class LineChart extends Chart {

	private String caption;
	private String subcaption;
	private String linethickness;
	private String showvalues;
	private String formatnumberscale;
	private String anchorradius;
	private String divlinealpha;
	private String divlinecolor;
	private String divlineisdashed;
	private String showalternatehgridcolor;
	private String alternatehgridcolor;
	private String shadowalpha;
	private String labelstep;
	private String numvdivlines;
	private String chartrightmargin;
	private String bgcolor;
	private String bgangle;
	private String bgalpha;
	private String alternatehgridalpha;
	private String legendposition;
	private String exportEnabled = "1";
	private String exportAtClient = "1";
	private String exportHandler = "fcExporter1";
	private String exportFormats = "PDF=导出为PDF|PNG=导出为PNG图片|JPG=导出JPG图片";
	private String exportDialogMessage = "加载数据中:";

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getSubcaption() {
		return subcaption;
	}

	public void setSubcaption(String subcaption) {
		this.subcaption = subcaption;
	}

	public String getLinethickness() {
		return linethickness;
	}

	public void setLinethickness(String linethickness) {
		this.linethickness = linethickness;
	}

	public String getShowvalues() {
		return showvalues;
	}

	public void setShowvalues(String showvalues) {
		this.showvalues = showvalues;
	}

	public String getFormatnumberscale() {
		return formatnumberscale;
	}

	public void setFormatnumberscale(String formatnumberscale) {
		this.formatnumberscale = formatnumberscale;
	}

	public String getAnchorradius() {
		return anchorradius;
	}

	public void setAnchorradius(String anchorradius) {
		this.anchorradius = anchorradius;
	}

	public String getDivlinealpha() {
		return divlinealpha;
	}

	public void setDivlinealpha(String divlinealpha) {
		this.divlinealpha = divlinealpha;
	}

	public String getDivlinecolor() {
		return divlinecolor;
	}

	public void setDivlinecolor(String divlinecolor) {
		this.divlinecolor = divlinecolor;
	}

	public String getDivlineisdashed() {
		return divlineisdashed;
	}

	public void setDivlineisdashed(String divlineisdashed) {
		this.divlineisdashed = divlineisdashed;
	}

	public String getShowalternatehgridcolor() {
		return showalternatehgridcolor;
	}

	public void setShowalternatehgridcolor(String showalternatehgridcolor) {
		this.showalternatehgridcolor = showalternatehgridcolor;
	}

	public String getAlternatehgridcolor() {
		return alternatehgridcolor;
	}

	public void setAlternatehgridcolor(String alternatehgridcolor) {
		this.alternatehgridcolor = alternatehgridcolor;
	}

	public String getShadowalpha() {
		return shadowalpha;
	}

	public void setShadowalpha(String shadowalpha) {
		this.shadowalpha = shadowalpha;
	}

	public String getLabelstep() {
		return labelstep;
	}

	public void setLabelstep(String labelstep) {
		this.labelstep = labelstep;
	}

	public String getNumvdivlines() {
		return numvdivlines;
	}

	public void setNumvdivlines(String numvdivlines) {
		this.numvdivlines = numvdivlines;
	}

	public String getChartrightmargin() {
		return chartrightmargin;
	}

	public void setChartrightmargin(String chartrightmargin) {
		this.chartrightmargin = chartrightmargin;
	}

	public String getBgcolor() {
		return bgcolor;
	}

	public void setBgcolor(String bgcolor) {
		this.bgcolor = bgcolor;
	}

	public String getBgangle() {
		return bgangle;
	}

	public void setBgangle(String bgangle) {
		this.bgangle = bgangle;
	}

	public String getBgalpha() {
		return bgalpha;
	}

	public void setBgalpha(String bgalpha) {
		this.bgalpha = bgalpha;
	}

	public String getAlternatehgridalpha() {
		return alternatehgridalpha;
	}

	public void setAlternatehgridalpha(String alternatehgridalpha) {
		this.alternatehgridalpha = alternatehgridalpha;
	}

	public String getLegendposition() {
		return legendposition;
	}

	public void setLegendposition(String legendposition) {
		this.legendposition = legendposition;
	}

	public LineChart(String caption, String subcaption, String linethickness,
			String showvalues, String formatnumberscale, String anchorradius,
			String divlinealpha, String divlinecolor, String divlineisdashed,
			String showalternatehgridcolor, String alternatehgridcolor,
			String shadowalpha, String labelstep, String numvdivlines,
			String chartrightmargin, String bgcolor, String bgangle,
			String bgalpha, String alternatehgridalpha, String legendposition) {
		this.caption = caption;
		this.subcaption = subcaption;
		this.linethickness = linethickness;
		this.showvalues = showvalues;
		this.formatnumberscale = formatnumberscale;
		this.anchorradius = anchorradius;
		this.divlinealpha = divlinealpha;
		this.divlinecolor = divlinecolor;
		this.divlineisdashed = divlineisdashed;
		this.showalternatehgridcolor = showalternatehgridcolor;
		this.alternatehgridcolor = alternatehgridcolor;
		this.shadowalpha = shadowalpha;
		this.labelstep = labelstep;
		this.numvdivlines = numvdivlines;
		this.chartrightmargin = chartrightmargin;
		this.bgcolor = bgcolor;
		this.bgangle = bgangle;
		this.bgalpha = bgalpha;
		this.alternatehgridalpha = alternatehgridalpha;
		this.legendposition = legendposition;
	}

	public LineChart() {
		super();
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
