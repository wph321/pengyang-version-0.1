/**
 * 
 */
package com.modle;

import java.io.Serializable;

/**
 * @author admin 2017年12月11日下午3:44:21
 */
public class User implements Serializable {

	private String name;
	private String username;
	private String passworld;
	private Office office;
	private String hospital_sign;
	private Superiorhospital sh;
	private CommunityHospital ch;

	public User(String name, String username, String passworld, Office office, String hospital_sign,
			Superiorhospital sh, CommunityHospital ch) {
		super();
		this.name = name;
		this.username = username;
		this.passworld = passworld;
		this.office = office;
		this.hospital_sign = hospital_sign;
		this.sh = sh;
		this.ch = ch;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassworld() {
		return passworld;
	}

	public void setPassworld(String passworld) {
		this.passworld = passworld;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public String getHospital_sign() {
		return hospital_sign;
	}

	public void setHospital_sign(String hospital_sign) {
		this.hospital_sign = hospital_sign;
	}

	public Superiorhospital getSh() {
		return sh;
	}

	public void setSh(Superiorhospital sh) {
		this.sh = sh;
	}

	public CommunityHospital getCh() {
		return ch;
	}

	public void setCh(CommunityHospital ch) {
		this.ch = ch;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", username=" + username + ", passworld=" + passworld + ", office=" + office
				+ ", hospital_sign=" + hospital_sign + ", sh=" + sh + ", ch=" + ch + "]";
	}

}
