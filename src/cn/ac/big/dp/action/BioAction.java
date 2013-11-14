package cn.ac.big.dp.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.dp.bean.BioInfo;

import com.opensymphony.xwork2.ActionSupport;

public class BioAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private String choromsome;
	private List<BioInfo> bioList;
	
	public String infoAction() throws IOException {
		File file = new File(ServletActionContext.getServletContext().getRealPath("resources/result/S2PRB11a02830A.snp"));
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
		String line = null;
		BioInfo bi = null;
		bioList = new ArrayList<BioInfo>();
		System.out.println(choromsome);
		while((line=bufferedReader.readLine())!=null) {
			if(!"".equals(line.trim())) {
				String[] eles = line.split("\t");
				String chromosomid = eles[0];
				if(!choromsome.equals(chromosomid)) {
					continue;
				}
				String coordinate = eles[1];
				String reference = eles[2];
				String consensus = eles[3];
				String quality = eles[4];
				String bestbase = eles[5];
				String averagequality = eles[6];
				String countofunique = eles[7];
				String countofall = eles[8];
				String secondbest = eles[9];
				String averagequalitys = eles[10];
				String countofuniques = eles[11];
				String countofalls = eles[12];
				String sequencing = eles[13];
				String ranksum = eles[14];
				String averagecopy = eles[15];
				String whetherisdbsnp = eles[16];
				bi = new BioInfo(chromosomid, coordinate, reference, consensus, quality, bestbase, averagequality, countofunique, countofall, secondbest, averagequalitys, countofuniques, countofalls, sequencing, ranksum, averagecopy, whetherisdbsnp);
				bioList.add(bi);
			}
		}
		return SUCCESS;
	}
	public String getChoromsome() {
		return choromsome;
	}
	public void setChoromsome(String choromsome) {
		this.choromsome = choromsome;
	}
	public List<BioInfo> getBioList() {
		return bioList;
	}
	public void setBioList(List<BioInfo> bioList) {
		this.bioList = bioList;
	}
}
