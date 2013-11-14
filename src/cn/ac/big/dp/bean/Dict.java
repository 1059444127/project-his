package cn.ac.big.dp.bean;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

public class Dict implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int dictId;
	private String dictName;
	private String dictNameEn;
	private int type;
	private String unit;
	private String elFlag;
	private int dictPId;
	private int level;
	private String status;
	private int displayFlag;
	private String[] options;
	private String option;
	private String pDictName;
	private String firstLetter;
	
	public String getpDictName() {
		return pDictName;
	}
	public void setpDictName(String pDictName) {
		this.pDictName = pDictName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private List<Dict> subDict;
	
	public int getDisplayFlag() {
		return displayFlag;
	}
	public void setDisplayFlag(int displayFlag) {
		this.displayFlag = displayFlag;
	}
	@Override
	public String toString() {
		return "Dict [dictId=" + dictId + ", dictName=" + dictName
				+ ", dictNameEn=" + dictNameEn + ", type=" + type + ", unit="
				+ unit + ", elFlag=" + elFlag + ", dictPId=" + dictPId
				+ ", level=" + level + ", status=" + status + ", displayFlag="
				+ displayFlag + ", options=" + Arrays.toString(options)
				+ ", option=" + option + ", pDictName=" + pDictName
				+ ", firstLetter=" + firstLetter + ", subDict=" + subDict + "]";
	}
	public int getDictId() {
		return dictId;
	}
	public void setDictId(int dictId) {
		this.dictId = dictId;
	}
	public String getDictName() {
		return dictName;
	}
	public void setDictName(String dictName) {
		this.dictName = dictName;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getElFlag() {
		return elFlag;
	}
	public void setElFlag(String elFlag) {
		this.elFlag = elFlag;
	}
	public int getDictPId() {
		return dictPId;
	}
	public void setDictPId(int dictPId) {
		this.dictPId = dictPId;
	}
	public String getDictNameEn() {
		return dictNameEn;
	}
	public void setDictNameEn(String dictNameEn) {
		this.dictNameEn = dictNameEn;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public List<Dict> getSubDict() {
		return subDict;
	}
	public void setSubDict(List<Dict> subDict) {
		this.subDict = subDict;
	}
	public String getFirstLetter() {
		return firstLetter;
	}
	public void setFirstLetter(String firstLetter) {
		this.firstLetter = firstLetter;
	}
	public String[] getOptions() {
		return options;
	}
	public void setOptions(String[] options) {
		this.options = options;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
		if(option!=null&&!option.trim().equals("")) {
			options = option.split(",");
		}
	}
}
