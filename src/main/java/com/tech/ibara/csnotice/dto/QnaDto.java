package com.tech.ibara.csnotice.dto;

import java.util.Date;

public class QnaDto {
	private int nbno;
	private String nbtitle;
	private String nbcontent;
	private String nbwriter;
	private int nbhit;
	private Date nbdate;
	private int nbgroup;
	private int nbstep;
	private int nbindent;
	private String nbfile;
	
	public QnaDto() {
		
	}
	
	public int getNbno() {
		return nbno;
	}
	public void setNbno(int nbno) {
		this.nbno = nbno;
	}
	public String getNbtitle() {
		return nbtitle;
	}
	public void setNbtitle(String nbtitle) {
		this.nbtitle = nbtitle;
	}
	public String getNbcontent() {
		return nbcontent;
	}
	public void setNbcontent(String nbcontent) {
		this.nbcontent = nbcontent;
	}
	public String getNbwriter() {
		return nbwriter;
	}
	public void setNbwriter(String nbwriter) {
		this.nbwriter = nbwriter;
	}
	public int getNbhit() {
		return nbhit;
	}
	public void setNbhit(int nbhit) {
		this.nbhit = nbhit;
	}
	public Date getNbdate() {
		return nbdate;
	}
	public void setNbdate(Date nbdate) {
		this.nbdate = nbdate;
	}
	public int getNbgroup() {
		return nbgroup;
	}
	public void setNbgroup(int nbgroup) {
		this.nbgroup = nbgroup;
	}
	public int getNbstep() {
		return nbstep;
	}
	public void setNbstep(int nbstep) {
		this.nbstep = nbstep;
	}
	public int getNbindent() {
		return nbindent;
	}
	public void setNbindent(int nbindent) {
		this.nbindent = nbindent;
	}
	public String getNbfile() {
		return nbfile;
	}
	public void setNbfile(String nbfile) {
		this.nbfile = nbfile;
	}
}
