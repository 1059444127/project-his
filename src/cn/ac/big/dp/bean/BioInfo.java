package cn.ac.big.dp.bean;

public class BioInfo {
	private String chromosomid;
	private String coordinate;
	private String reference;
	private String consensus;
	private String quality;
	private String bestbase;
	private String averagequality;
	private String countofunique;
	private String countofall;
	private String secondbest;
	private String averagequalitys;
	private String countofuniques;
	private String countofalls;
	private String sequencing;
	private String ranksum;
	private String averagecopy;
	private String whetherisdbsnp;
	
	public BioInfo(String chromosomid, String coordinate, String reference,
			String consensus, String quality, String bestbase,
			String averagequality, String countofunique, String countofall,
			String secondbest, String averagequalitys, String countofuniques,
			String countofalls, String sequencing, String ranksum,
			String averagecopy, String whetherisdbsnp) {
		super();
		this.chromosomid = chromosomid;
		this.coordinate = coordinate;
		this.reference = reference;
		this.consensus = consensus;
		this.quality = quality;
		this.bestbase = bestbase;
		this.averagequality = averagequality;
		this.countofunique = countofunique;
		this.countofall = countofall;
		this.secondbest = secondbest;
		this.averagequalitys = averagequalitys;
		this.countofuniques = countofuniques;
		this.countofalls = countofalls;
		this.sequencing = sequencing;
		this.ranksum = ranksum;
		this.averagecopy = averagecopy;
		this.whetherisdbsnp = whetherisdbsnp;
	}
	public String getChromosomid() {
		return chromosomid;
	}
	public void setChromosomid(String chromosomid) {
		this.chromosomid = chromosomid;
	}
	public String getCoordinate() {
		return coordinate;
	}
	public void setCoordinate(String coordinate) {
		this.coordinate = coordinate;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getConsensus() {
		return consensus;
	}
	public void setConsensus(String consensus) {
		this.consensus = consensus;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getBestbase() {
		return bestbase;
	}
	public void setBestbase(String bestbase) {
		this.bestbase = bestbase;
	}
	public String getAveragequality() {
		return averagequality;
	}
	public void setAveragequality(String averagequality) {
		this.averagequality = averagequality;
	}
	public String getCountofunique() {
		return countofunique;
	}
	public void setCountofunique(String countofunique) {
		this.countofunique = countofunique;
	}
	public String getCountofall() {
		return countofall;
	}
	public void setCountofall(String countofall) {
		this.countofall = countofall;
	}
	public String getSecondbest() {
		return secondbest;
	}
	public void setSecondbest(String secondbest) {
		this.secondbest = secondbest;
	}
	public String getAveragequalitys() {
		return averagequalitys;
	}
	public void setAveragequalitys(String averagequalitys) {
		this.averagequalitys = averagequalitys;
	}
	public String getCountofuniques() {
		return countofuniques;
	}
	public void setCountofuniques(String countofuniques) {
		this.countofuniques = countofuniques;
	}
	public String getCountofalls() {
		return countofalls;
	}
	public void setCountofalls(String countofalls) {
		this.countofalls = countofalls;
	}
	public String getSequencing() {
		return sequencing;
	}
	public void setSequencing(String sequencing) {
		this.sequencing = sequencing;
	}
	public String getRanksum() {
		return ranksum;
	}
	public void setRanksum(String ranksum) {
		this.ranksum = ranksum;
	}
	public String getAveragecopy() {
		return averagecopy;
	}
	public void setAveragecopy(String averagecopy) {
		this.averagecopy = averagecopy;
	}
	public String getWhetherisdbsnp() {
		return whetherisdbsnp;
	}
	public void setWhetherisdbsnp(String whetherisdbsnp) {
		this.whetherisdbsnp = whetherisdbsnp;
	}
}
