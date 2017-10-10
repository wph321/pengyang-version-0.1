package com.modle;

import java.io.Serializable;

public class Patients implements Serializable{

	private int pat_id;
	
	private String name;
	
	private String sex;
	
	private String age;
	
	private String telphone;
	
	private String result;
	
	private String doc_name;
	
	private String Diag_Doctor;
	
	private String pdf_path;
	
	public Patients() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Patients(int id, String name, String sex, String age, String telephone, String result, String doc_name,
			String diag_Doctor, String pdf_path) {
		super();
		this.pat_id = id;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.telphone = telephone;
		this.result = result;
		this.doc_name = doc_name;
		Diag_Doctor = diag_Doctor;
		this.pdf_path = pdf_path;
	}
	

	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getAge() {
		return age;
	}
	
	public void setAge(String age) {
		this.age = age;
	}
	
	public String getTelphone() {
		return telphone;
	}
	
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public String getDoc_name() {
		return doc_name;
	}
	
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	
	public String getDiag_Doctor() {
		return Diag_Doctor;
	}
	
	public void setDiag_Doctor(String diag_Doctor) {
		Diag_Doctor = diag_Doctor;
	}
	
	public String getPdf_path() {
		return pdf_path;
	}
	
	public void setPdf_path(String pdf_path) {
		this.pdf_path = pdf_path;
	}

	public int getPat_id() {
		return pat_id;
	}

	public void setPat_id(int pat_id) {
		this.pat_id = pat_id;
	}

	@Override
	public String toString() {
		return "Patients [pat_id=" + pat_id + ", name=" + name + ", sex=" + sex + ", age=" + age + ", telphone=" + telphone
				+ ", result=" + result + ", doc_name=" + doc_name + ", Diag_Doctor=" + Diag_Doctor + ", pdf_path="
				+ pdf_path + "]";
	}
	
}
